import 'dart:isolate';

// Function for IsolateRani to add items to the list
void isolateRani(SendPort mainSendPort) async {
  List<int> list = [];
  final port = ReceivePort();
  mainSendPort.send(port.sendPort);

  for (int i = 0; i < 5; i++) {
    list.add(i + 1); // Add an item
    print("IsolateRani added: ${i + 1}");
    mainSendPort.send(list); // Send the updated list to the main isolate
    await Future.delayed(Duration(seconds: 1)); // Simulating delay
  }
}

// Function for IsolateMani to remove items from the list
void isolateMani(SendPort mainSendPort) async {
  final port = ReceivePort();
  mainSendPort.send(port.sendPort);

  await for (final list in port) {
    if (list.isNotEmpty) {
      int removedItem = list.removeLast();
      print("IsolateMani removed: $removedItem");
      mainSendPort.send(list); // Send the updated list back
    }
  }
}

void main() async {
  List<int> sharedList = [];
  final raniReceivePort = ReceivePort();
  final maniReceivePort = ReceivePort();

  // Start the isolates
  await Isolate.spawn(isolateRani, raniReceivePort.sendPort);
  await Isolate.spawn(isolateMani, maniReceivePort.sendPort);

  // final raniSendPort = await raniReceivePort.first;
  final maniSendPort = await maniReceivePort.first;

  // Listen to the updates from IsolateRani
  raniReceivePort.listen((message) {
    if (message is List<int>) {
      print("Main received updated list from IsolateRani: $message");
      sharedList = message;
      maniSendPort.send(sharedList); // Send updated list to IsolateMani
    }
  });

  // Listen to the updates from IsolateMani
  maniReceivePort.listen((message) {
    if (message is List<int>) {
      print("Main received updated list from IsolateMani: $message");
      sharedList = message;
    }
  });
}
