# Flutter Bloc Pattern Questions:

### Introduction

**Flutter Bloc** is a state management library for the Flutter framework that helps developers
organise and manage application states reactively and efficiently. It follows the **Business Logic
Component (BLoC)** pattern, separating business logic from the UI layer.

With Flutter Bloc, you can create maintainable and testable Flutter applications that are scalable
and easy to reason about. The flutter state management feature allows handling all possible
application states efficiently.

##### 1. What is Flutter Bloc?

Flutter Bloc is a state management pattern and library for Flutter, a popular open-source UI
software development toolkit created by Google. State management is a crucial aspect of building
complex applications, and Flutter Bloc provides a structured way to manage and update the state of a
Flutter application.

Bloc stands for Business Logic Component, and the Flutter Bloc library helps in organizing and
managing the flow of data and events in your application. It follows the reactive programming
paradigm, where the UI components react to changes in the application state.

--------

##### 2.How does it work?

The core idea of Flutter Bloc is to separate the business logic (Bloc) from the UI, making the code
more modular, testable, and maintainable. Let us look at the how Flutter Bloc works:

1. **Events**: Events are user interactions or system events or trigger events or other
   occurrences that trigger a state change in the application. These events can be button clicks,
   form submissions, API responses, etc.
   Events are dispatched to the Bloc, representing things like button clicks, data loading requests,
   or any action that should cause a change in the application state.

2. **Bloc**: The Bloc is responsible for managing the application state. It listens to incoming
   events and processes them, updating the state accordingly. The state changes are then broadcasted
   to the UI components. It contains the business logic and state management code, and it's
   responsible for executing the appropriate logic and emitting new states.

3. **States**: States represent the different conditions or snapshots of the application. The UI
   components rebuild based on the current state, reflecting changes to the user.

4. **UI Integration**: Flutter provides specific widgets to integrate with Blocs, such as
   BlocBuilder, BlocProvider, and BlocListener. BlocBuilder is a widget that rebuilds itself
   whenever the state of the Bloc changes. It helps in updating the UI based on the current state.
   BlocProvider is used to provide the Bloc instance to the widget tree so that child widgets can
   access it.

5. **Streams**: Flutter Bloc relies on Dart's Streams for handling asynchronous operations. The Bloc
   listens to an input stream for events, processes them, and emits new states to an output stream.
   Widgets subscribe to the output stream to receive updates and rebuild when the state changes.

--------

##### 3. What are Bloc Widgets?

Bloc Widgets are not a specific category of widgets but rather widgets provided by the Flutter Bloc
library to facilitate integration with the Bloc pattern. Here are a few important ones:

- **BlocBuilder**: A widget that rebuilds itself based on the latest state emitted by a Bloc. It
  takes a Bloc and a builder function, which defines how the widget should be rebuilt based on the
  current state.

- **BlocProvider**: A widget that provides a Bloc to its descendants in the widget tree. It is used
  at the root of a widget tree to make a Bloc accessible to all the widgets below it.

- **BlocListener**: A widget that listens to state changes in a Bloc and executes a callback in
  response to those changes. It's useful for performing side effects based on Bloc state
  transitions.

- **BlocConsumer**: A combination of BlocListener and BlocBuilder. It allows you to build and listen
  to state changes at the same time, making it useful when you need to do both for a single bloc.

- **MultiBlocProvider**: A Flutter widget that allows the provision of multiple blocs to a subtree.
  It takes a list of BlocProvider widgets.

- **MultiBlocListener**: A Flutter widget that allows multiple BlocListener widgets to be combined.
  It takes a list of BlocListener widgets.

- **RepositoryProvider**: Used to provide repositories to the widget tree. It's similar to
  BlocProvider, but it is used for dependency injection of repositories.

These widgets help in seamlessly integrating the Bloc pattern into Flutter applications, making it
easier to manage state and update the UI in a reactive and predictable manner.



------------

##### 4. Understanding Concept of BLoC: Events & States

- **Events**: Events are inputs of an application like button_press to load images, text inputs, or
  any other user input that an application may receive.
- **States**: They are simply the application's state, which can alter in response to the event
  received.

Bloc manages these events and states, i.e., transforming a stream of Events into a stream of States
as output.

##### Creating An Event

```dart
@immutable
abstract class AppBlocEvent {
  const AppBlocEvent();
}

@immutable
class ChangeTextEvent extends AppBlocEvent {
  const ChangeTextEvent();
}

```

##### Creating A State

```dart
@immutable
class AppState extends Equatable {
  final int index;
  final String text;

  const AppState.empty()
      : index = 0,
        text = 'Initial Text';

  const AppState({
    required this.index,
    required this.text,
  });

  @Override
  List<Object> get props => [index, text];
}

```
------------

`BlocConsumer` is a Flutter widget that provides a convenient way to listen to BLoC (Business Logic Component) state changes and rebuild parts of the UI accordingly. It combines the functionality of `BlocBuilder` and `BlocListener`, allowing you to handle state updates and side effects within a single widget.

### Attributes of `BlocConsumer`

1. **`bloc`**: 
   - **Type**: `Bloc`
   - **Description**: The `bloc` attribute is where you provide the BLoC instance that the `BlocConsumer` will listen to and interact with. This is the BLoC that will emit states and receive events.

2. **`builder`**:
   - **Type**: `Widget Function(BuildContext context, S state)`
   - **Description**: The `builder` function is responsible for building the UI based on the current state of the BLoC. It is called every time the BLoC emits a new state. The `builder` receives the `BuildContext` and the current state as parameters and returns a widget tree.

3. **`listener`**:
   - **Type**: `void Function(BuildContext context, S state)`
   - **Description**: The `listener` function is used for side effects that should occur in response to state changes but don't involve rebuilding the UI. This could include showing a snackbar, navigating to another screen, or performing any other action in response to a state change. It is called every time the BLoC emits a new state.

4. **`listenWhen`**:
   - **Type**: `bool Function(S previous, S current)`
   - **Description**: The `listenWhen` function determines whether the `listener` function should be called based on the previous and current states. This can be used to optimize performance by only triggering side effects for specific state changes.

5. **`buildWhen`**:
   - **Type**: `bool Function(S previous, S current)`
   - **Description**: The `buildWhen` function determines whether the `builder` function should be called based on the previous and current states. This can be used to control when the UI should be rebuilt, helping to optimize performance by preventing unnecessary rebuilds.

### Example Usage

Here's an example of how `BlocConsumer` might be used in a Flutter widget:

```dart
BlocConsumer<MyBloc, MyState>(
  bloc: myBloc,
  listener: (context, state) {
    if (state is MyErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred!')),
      );
    }
  },
  builder: (context, state) {
    if (state is MyLoadingState) {
      return CircularProgressIndicator();
    } else if (state is MyLoadedState) {
      return ListView.builder(
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(state.items[index].name));
        },
      );
    } else {
      return Center(child: Text('Please wait...'));
    }
  },
);
```

In this example:
- `listener` displays a `SnackBar` when an error state occurs.
- `builder` displays different widgets based on the current state (loading, loaded, or default).

`BlocConsumer` is a powerful tool in Flutter's BLoC architecture, streamlining the process of managing state and handling side effects.

------------

#### Advantages of BLoC Design Pattern

- It provides good documentation about different scenarios.
- It separates the business logic from the code, thus making the code understandable.
- Using BLoC makes the outcome more testable.
- It is easy to keep track of different states that occur during product development.

------------

#### Disadvantages of BLoC Design Pattern

- Implementing Flutter Bloc requires writing boilerplate code for defining events, states, and
  blocs, which might increase code verbosity.
- Debugging can be more challenging with Flutter Bloc, as the flow of events and states can be
  intricate.
- Flutter Bloc might introduce unnecessary complexity for small or simple applications compared to
  more straightforward state management solutions like setState.

------------

#### Frequently Asked Questions:

**What is Bloc pattern Flutter?**

Bloc pattern in Flutter is a state management approach, separating business logic from UI, improving
organization, and making apps more maintainable.

1. **What is the purpose of BLoC in Flutter?**

 The purpose of BLoC in Flutter is to manage and separate business logic, events, and states,
enhancing code modularity and testability for a reactive UI.

2. **Which state management is best in Flutter?**

 There's no one-size-fits-all. Bloc is popular for complex apps, while Provider and Riverpod are
simpler. Choose based on project needs.

3. **Is Bloc better than GetX?**

 "Better" depends on context. Bloc is widely used for its structure, while GetX is praised for
simplicity and performance. Choose based on project requirements and developer preferences.

4. **What is the difference between Cubit and Bloc?**

 Cubit is a subset of the BLoC Pattern package that does not rely on events and instead uses methods
to emit new states.

So, we can use Cubit for simple states, and as needed we can use the Bloc.

 There are many advantages of choosing Cubit over Bloc. The two main benefits are:

 Cubit is a subset of Bloc; so, it reduces complexity. Cubit eliminates the event classes. Cubit 
 uses emit rather than yield to emit state. Since emit works synchronously, you can ensure that the state
is updated in the next line.

5. **In Flutter Bloc when we abstract classes why we need sealed classes for events and states?**

In Flutter BLoC (Business Logic Component) architecture, we use sealed classes for events and states
for two main reasons: code safety and discoverability.

1. **Code Safety**:
   Sealed classes in Dart are abstract classes that cannot be extended outside of their defining
   library. This means that if you have a sealed class called `MyEvent` in your project, no other
   part of the codebase can create a new subclass of `MyEvent` without being explicitly allowed to
   do so.

   This restriction provides code safety by preventing developers from accidentally creating new
   event or state types that the BLoC wasn't designed to handle. By limiting the creation of event
   and state types to the BLoC's own library, you ensure that the BLoC can handle all possible
   events and states correctly.

2. **Discoverability**:
   Sealed classes also improve code discoverability and maintainability. When you look at a BLoC's
   code, you can easily find all the possible events and states it can handle by looking at the
   subclasses of the sealed `Event` and `State` classes.

   Without sealed classes, events and states could be defined anywhere in the codebase, making it
   harder to understand the BLoC's behavior and potentially leading to missing or duplicated
   event/state types.

------------

**Conclusion**

This article taught us about Flutter BLoC, a powerful state management library that enables the
separation of concerns and organised application state handling. We delved into the advantages and
disadvantages of the BLoC design pattern, understanding the role of events and states in managing
application states reactively. We implemented a counting app through a step-by-step example and
learnt the basic implementation of the BLoC pattern using the Flutter BLoC library.

------------

#### Unit Testing

------------

https://github.com/tulasireddytulasi/flutter_bloc_project
https://github.com/felangel/bloc/tree/master/examples
https://github.com/felangel/bloc/tree/master/examples/flutter_shopping_cart
https://sahasuthpala.medium.com/flutter-bloc-unit-testing-f3fdd195eff8
https://www.ics.com/blog/how-conduct-unit-tests-using-bloc
https://hackernoon.com/the-ultimate-guide-to-flutter-bloc-state-management-and-testing

#### 1. What is Unit Testing?

Unit testing is a software testing technique that involves testing individual units or components of
a software system to verify their correctness. In Flutter, unit tests are typically written using
the **test** package provided by the Dart ecosystem. Here's an example:

```dart
import 'package:flutter_test/flutter_test.dart';

// Function to test
int add(int a, int b) {
  return a + b;
}

void main() {
  test('adds two positive integers correctly', () {
    expect(add(2, 3), equals(5));
  });

  test('adds two negative integers correctly', () {
    expect(add(-2, -3), equals(-5));
  });

  test('adds zero correctly', () {
    expect(add(0, 5), equals(5));
    expect(add(5, 0), equals(5));
  });
}
```

In this example, we have a simple add function that takes two integers and returns their sum. We
then define three test cases using the test function from the flutter_test package. Each test case
calls the add function with different inputs and asserts the expected output using the expect
function.

------------

#### 2. What is BLoC Testing?

BLoC (Business Logic Component) is a design pattern used in Flutter for separating the presentation
layer from the business logic. Testing BLoCs involves testing the state management and event
handling logic. Here's an example:

```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/blocs/counter_bloc.dart';

void main() {
  group('CounterBloc', () {
    CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    tearDown(() {
      counterBloc?.close();
    });

    test('initial state is 0', () {
      expect(counterBloc.state, equals(0));
    });

    blocTest(
      'emits [1] when CounterIncremented is added',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(CounterIncremented()),
      expect: [equals(1)],
    );
  });
}
```

In this example, we're testing the **CounterBloc** using the **bloc_test** package. We define a *
*group** to organize our tests, and within it, we set up and tear down the **CounterBloc** instance
for each test case.

The first test case verifies that the initial state of the **CounterBloc** is 0. The second test
case uses the **blocTest** function to test the behavior of the **CounterBloc** when a *
*CounterIncremented** event is added. It expects the state to be emitted as 1.









