### Isolate Communication in Dart:

```dart
import 'dart:isolate';  // Importing the isolate package to enable parallel execution and communication between threads.
import 'dart:io';       // Importing the IO library to read and write to the console.
import 'dart:convert';  // Importing the convert package to handle character encoding like UTF-8.

void main(List<String> args) async {
  // Infinite loop that will repeatedly ask the user to input something.
  do {
    stdout.write('Say something: ');  // Prompt the user for input.
    final line = stdin.readLineSync(encoding: utf8);  // Read user input and encode it as UTF-8.
    switch (line?.trim().toLowerCase()) {  // Use a switch-case to handle different inputs.
      case null:  // If the input is null (nothing entered), skip and ask again.
        continue;
      case 'exit':  // If the input is 'exit', the program will terminate.
        exit(0);
      default:  // For any other input, get a response via the isolate.
        final msg = await getMessage(line!);  // Call the getMessage function to handle the user input.
        print(msg);  // Print the response received from the isolate.
    }
  } while (true);  // Keep asking the user for input indefinitely.
}

Future<String> getMessage(String forGreeting) async {
  final rp = ReceivePort();  // Create a new ReceivePort to receive data from the spawned isolate.
  Isolate.spawn(_communicator, rp.sendPort);  // Spawn a new isolate and send the SendPort to it for communication.

  final boardCastRp = rp.asBroadcastStream();  // Convert the ReceivePort into a broadcast stream to listen to multiple events.
  final SendPort communicatorSendPort = await boardCastRp.first;  // Receive the SendPort from the newly spawned isolate.
  communicatorSendPort.send(forGreeting);  // Send the user's input to the isolate for processing.

  return boardCastRp  // Process the broadcast stream.
      .takeWhile((element) => element is String)  // Take elements that are strings.
      .cast<String>()  // Cast the elements as strings.
      .take(1)  // Take the first string response.
      .first;  // Return the first string response.
}

void _communicator(SendPort sp) async {
  final rp = ReceivePort();  // Create a new ReceivePort to receive messages from the main isolate.
  sp.send(rp.sendPort);  // Send the newly created ReceivePort's SendPort to the main isolate to establish communication.

  final messages = rp.takeWhile((element) => element is String).cast<String>();  // Listen for incoming messages that are strings.

  await for (final message in messages) {  // Loop through each message received from the main isolate.
    for (final entry in messagesAndResponses.entries) {  // Iterate through predefined messages and responses.
      if (entry.key.trim().toLowerCase() == message.trim().toLowerCase()) {  // If the user's input matches a key in the predefined messages.
        sp.send(entry.value);  // Send the corresponding response to the main isolate.
        continue;  // Continue to the next iteration.
      }
    }
    sp.send("I have no response to that!");  // If no match is found, send a default response.
  }
}

// A map of predefined messages and their corresponding responses.
const messagesAndResponses = {
  '': ' Ask me a question like "How are you"',
  'Hello': 'Hi',
  'How are you?': 'Fine',
  'What are you doing?': 'Learning about Isolates in Dart',
  'Are you having fun?': 'Yeah sure',
};
```

### Explanation:
1. **Imports**: Required for isolate handling, input/output, and encoding management.
2. **Main Function**: Reads user input, checks the input using a `switch-case`, and delegates handling to the `getMessage` function.
3. **`getMessage`**: Spawns a new isolate and sends the user input to it, waits for the response from the isolate.
4. **Isolate Communication**: The isolate, once spawned, communicates with the main isolate using `SendPort` and `ReceivePort`. It checks the input against a predefined set of responses.
5. **Message Handling in Isolate**: The `_communicator` function matches the input against predefined responses and sends the appropriate message back.
6. **Predefined Responses**: The `messagesAndResponses` constant contains a map of inputs and corresponding responses.