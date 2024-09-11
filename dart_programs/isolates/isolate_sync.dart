import 'dart:isolate';

void main() async {
  // Create a receive port to listen for messages from the other isolate
  ReceivePort receivePort = ReceivePort();

  // Create a new isolate and pass the send port to it
  Isolate isolate = await Isolate.spawn(
    myIsolateFunction,
    receivePort.sendPort,
  );

  // Listen for messages from the other isolate
  receivePort.listen((message) {
    print('Received message from isolate: $message');
  });

  // Send a message to the other isolate
  isolate.controlPort.send('Hello from main isolate!');
}

void myIsolateFunction(SendPort sendPort) async {
  // Create a receive port to listen for messages from the main isolate
  ReceivePort receivePort = ReceivePort();

  // Send the receive port to the main isolate
  sendPort.send(receivePort.sendPort);

  // Listen for messages from the main isolate
  receivePort.listen((message) {
    print('Received message from main isolate: $message');
  });

  // Send a message to the main isolate
  sendPort.send('Hello from my isolate!');
}

