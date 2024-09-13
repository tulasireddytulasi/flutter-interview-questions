import 'dart:isolate';
import 'dart:io';

void main() async {
  // Create the ReceivePort for the main isolate
  final mainReceivePort = ReceivePort();

  // Spawn Isolate 1 and Isolate 2
  await Isolate.spawn(isolateOne, mainReceivePort.sendPort);
  await Isolate.spawn(isolateTwo, mainReceivePort.sendPort);

  // Listen to get the SendPorts from both Isolates
  final stream = mainReceivePort.asBroadcastStream();
  final SendPort sendPortIsolate1 = await stream.first;
  final SendPort sendPortIsolate2 = await stream.first;

  // Pass Isolate 2's SendPort to Isolate 1
  sendPortIsolate1.send(sendPortIsolate2);

  // Keep the main isolate active
  await Future.delayed(Duration(seconds: 1)); // Adjust the duration as needed
}

// Isolate 1 function
void isolateOne(SendPort mainSendPort) async {
  final rp = ReceivePort();
  mainSendPort.send(rp.sendPort); // Send Isolate 1's SendPort to the main isolate

  SendPort? sendPortToIsolate2;

  await for (var message in rp) {
    if (message is SendPort) {
      // Isolate 1 receives Isolate 2's SendPort
      sendPortToIsolate2 = message;

      // Take input from user and send message to Isolate 2
      while (true) {
        stdout.write('Isolate 1: Enter message to send to Isolate 2: ');
        String? input = stdin.readLineSync();
        if (input != null && input.isNotEmpty) {
          sendPortToIsolate2.send(input);

          // Wait for response from Isolate 2
          final response = await rp.first;
          if (response is String) {
            print("Isolate 1 received: $response");
          }
        }
      }
    } else if (message is String) {
      // Print message received from Isolate 2
      print("Isolate 1 received: $message");
    }
  }
}

// Isolate 2 function
void isolateTwo(SendPort mainSendPort) async {
  final rp = ReceivePort();
  mainSendPort.send(rp.sendPort); // Send Isolate 2's SendPort to the main isolate

  SendPort? sendPortToIsolate1;

  await for (var message in rp) {
    if (message is SendPort) {
      // Isolate 2 receives Isolate 1's SendPort
      sendPortToIsolate1 = message;
    } else if (message is String) {
      // Print message received from Isolate 1
      print("Isolate 2 received: $message");

      // Respond to Isolate 1
      while (true) {
        stdout.write('Isolate 2: Enter response to send to Isolate 1: ');
        String? input = stdin.readLineSync();
        if (input != null && input.isNotEmpty) {
          sendPortToIsolate1?.send(input);

          // Wait for response from Isolate 1
          final response = await rp.first;
          if (response is String) {
            print("Isolate 2 received: $response");
          }
        }
      }
    }
  }
}
