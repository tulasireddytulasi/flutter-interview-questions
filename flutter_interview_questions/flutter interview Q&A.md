# Flutter complete interview questions with answers

this file contains a list of flutter interview questions with answers

---
 Flutter Interview Questions and Answers
---

1.what is difference between BLOC, Provider and GetX, RiverPod?

GetX  | Riverpod | Provider | BLoC
------------- | ------------- | ------------ | ---------------
Easy to learn  | Little more difficult than Getx | Little more difficult than Getx but eaiser than Riverpod | Very difficult for beginners (creating states and events could look confusing)
Covers routing  | Covers State Management | Covers State Management | Covers State Management
Provide beautiful | Http request | Many Flutter plugins are written in Provider, so it's worth learning. | Let's you see the deep into the flutter framework
Http request  | Easy tool for quick app development | | Keeps the code cleaner and redeable.
State Management  | State inspection in dev tool
Auth Middleware | Code is relatively readable, Riverpod provides different kinds of providers. For beginners a little hard to grasp the content. Riverpod's syntax style like BLoC or Cubit

---

2.what is difference between Unit testing and Widget testing and Integrate and integrated tests instument in flutter?

`Unit Testing`: It is a type of software testing in which a small piece of code is tested to see if the code works as expected. The name is derived from the fact that tests are done on a unit by unit basis. The goal of Unit testing is to help reduce the cost of bug fixes, as this way, bugs or errors in the code level are identified early in the development lifecycle.

`Widget Testing`: The widget test is testing UI components, so it is also called Component Testing. It is used to test a single widget. The main goal of widget testing is to check whether the widget works as expected. A user can write test cases for every widget present in the project.

`Integration Testing`: Integration testing, as its name implies, verifies that the interface between two software units or modules works correctly. It is a broader type of testing that covers connection between 2 or more moduled and can also in some cases, cover the whole application.
In the end-to-end process of software testing, Integration Testing will be performed after the Unit Testing and before System Testing.

 for more details: https://www.practitest.com/qa-learningcenter/resources/unit-test-vs-integration-test

---

3.How do you monitor errors in flutter?

There are different errors in flutter, like UI errors for ex TextOverFlow error, Network errors like Null point exceptions, SocketException. And to monitor all types of errors we can use sentry package.

---

4.What do understand about material and cupertino aspect of flutter design?

Flutter SDK offers two sets of styling widgets, the Material, and Cupertino Widget. The Material widget implements material design language for iOS, Android, web, and desktop applications. The Cupertino widget on the other hand is used to implement the current iOS design language based on Apple’s human interface guidelines.

 So, here arises a question, why do we need a Cupertino widget for iOS app development when there is a Material widget that can be used for any platform including iOS.

 The cupertino widget is specifically designed for the apps that run on the iOS platform. As the widget respects Android and iOS platform differences, it doesn’t support all the features in the Material widgets. Also, there are some licensing issues.

 For example, if you run the Cupertino app on the Android platform you might not see the correct fonts loaded on the UI belonging to the San Francisco font family.  Also, you may experience the pages getting dismissible via a back swipe.

 for more details: https://www.dhiwise.com/post/flutter-cupertino-widget

---

5.before release an app in production, what step do you consider to  make sure all the functions are working fine and also if the is optimized or not?

Before release will run all the tests and ensure that you always get tests your unit tests, widget tests and integrated tests are performing perfect.

---

6.what is dart and why is flutter use it?
- Dart is a programming language and flutter is a framwork for developing the mobile application and websites.
- Dart is AOT (Ahead Of Time) compiled to fast, predictable, native code, which allows almost all of Flutter to be written in Dart. This not only makes Flutter fast, virtually everything (including all the widgets) can be customized.
- Dart can also be JIT (Just In Time) compiled for exceptionally fast development cycles and game-changing workflow (including Flutter’s popular sub-second stateful hot reload).
- Dart makes it easier to create smooth animations and transitions that run at 60fps. Dart can do object allocation and garbage collection without locks. And like JavaScript, Dart avoids preemptive scheduling and shared memory (and thus locks). Because Flutter apps are compiled to native code, they do not require a slow bridge between realms (e.g., JavaScript to native). They also start up much faster.
- Dart allows Flutter to avoid the need for a separate declarative layout language like JSX or XML, or separate visual interface builders, because Dart’s declarative, programmatic layout is easy to read and visualize. And with all the layout in one language and in one place, it is easy for Flutter to provide advanced tooling that makes layout a snap.
- Developers have found that Dart is particularly easy to learn because it has features that are familiar to users of both static and dynamic languages.
- Not all of these features are unique to Dart, but the combination of them hits a sweet spot that makes Dart uniquely powerful for implementing Flutter. So much so, it is hard to imagine Flutter being as powerful as it is without Dart.

 for more details: https://medium.com/hackernoon/why-flutter-uses-dart-dd635a054ebf#:~:text=Dart%20is%20AOT%20(Ahead%20Of,the%20widgets)%20can%20be%20customized.

---

7.Difference between required and optional parameter in dart?

Dart's optional parameters are optional in that the caller isn't required to specify a value for the parameter when calling the function.
Optional parameters can only be declared after any required parameters.
Optional parameters can have a default value, which is used when a caller does not specify a value.

 Required parameters are modetory to specify when calling any funtion in dart.

---

8.What are Null Aware Operators in flutter?

Null-aware operators are one of my favorite features in Dart. In any language, having variables and values fly around that are null can be problematic. It can crash your program. Programmers often have to write if (response == null) return at the top of a function to make asynchronous calls. That's not the worst thing ever, but it's not concise.

 Null-aware operators in Dart help resolve this issue. They're operators to say, "If this object or value is null, then forget about it: stop trying to execute this code."

 The number-one rule of writing Dart code is to be concise but not pithy. Anytime you can write less code without sacrificing readability, you probably should. The three null-aware operators that Dart provides are ?., ??, and ??=.

 for more details: https://flutterbyexample.com/lesson/null-aware-operators

---

9.What do we pass functions to a widget?

Functions are first-class objects in Dart and can be passed as parameters to other functions. We pass a function to a widget essentially saying, invoke this function when something happens. Callbacks using interfaces like Android have too much boilerplate code for a simple callback. Dart does both declarations as well as setting up the callback. This becomes much cleaner and organized and helps us avoid unnecessary complications.

```dart
// Widget
FlatButton(
  onPressed: buttonPressed,
)

// function
buttonPressed(){
// Do something here
}
```

---

10.What are the disadvantages of Flutter?

Large and Weighty Apps.
Applications created using Flutter, and packaged with its corresponding tools, are inherently larger than apps created natively. Even some competing frameworks can build comparable applications with a smaller footprint. The requirements to include the framework’s engine and widgets with apps means there’s more to package into applications.

With device space often at a premium, this can be a significant factor in convincing users to download an app. This drawback alone almost completely prohibits Flutter from being used to target instant apps due to tight footprint restrictions.

---

11.Which Flutter architecture is best?

BLoC Architecture is the best-suited architecture for most Flutter apps. It helps developers write a single codebase that can be shared across various platforms such as tvOS, iOS, Android, Web, watchOS, and more.

---

12.How many build mode in Flutter?

There are 3 different build modes in flutter:

`Debug` : This is the most common mode we always test the apps. If you are using Android Studio you can find its button on the top panel (a green play button).

`flutter run`
`Release` : This mode is for deploying the app on market places.

Note: This mode needs a key generated for android release mode.

`flutter run --release`
`Profile` : This is the mode you are looking for. In profile mode, some debugging ability is maintained—enough to profile your app’s performance and also it has the performance as the release mode.

---

13.What is use of RxDart in Flutter?

RxDart adds functionality to Dart Streams in three ways: Stream Classes - create Streams with specific capabilities, such as combining or merging many Streams. Extension Methods - transform a source Stream into a new Stream with different capabilities, such as throttling or buffering events.

---

14.What are the layers in Flutter?

The structure of Flutter consists of three layers:

<img src='https://github.com/tulasireddytulasi/flutter-interview-questions/blob/main/img/flutter_images/flutter_architecture.jpg' alt="async"/>

`Upper layers`: The Dart-based platform that takes care of app widgets, gestures, animations, illustrations, and materials;
`Flutter engine`: Handles the display and formatting of text.
`Built-in service`: Used for the management of plugins, packages, and event loops.

for more details: https://medium.com/flutter-community/the-layer-cake-widgets-elements-renderobjects-7644c3142401

---

15.what are the new changes in flutter latest version?

The latest Flutter version is 3.3
Rendering Layer Changes in Flutter 3.3.

The Flutter team introduced a new rendering layer named Impeller with the Flutter upgrade. This runtime is able to maximize the performance of hardware-accelerated APIs like Vulkan for Android or Metal for iOS.

##### Framework Changes in Flutter 3.3

Global Selection, Text Input, Scribble, Trackpad Input, Material Design 3, Trackpad Input, Chip, IconButton and Medium and large AppBar.

##### Package Changes in Flutter 3.3

`go_router`: since the release of the go-router package, things have become a little bit clearer. The Flutter Team is in charge of overseeing the package, and it makes it way simpler to handle and navigate the deep links by offering a declarative, URL-based API.

##### Desktop Changes in Flutter 3.3

`Windows`: Previously, developers had to change the Flutter desktop app version from a file that was specific to Windows apps. With the Flutter update, you can now easily change the app versions from the project's build arguments and pubspec.yaml files.

When you push an app update, this feature enables auto-update, so that end users get it at the earliest.

for more details: https://radixweb.com/blog/what-is-new-in-flutter-3-3-update#flutter

---

16.Why Dart is single threaded?

By design, Dart is a single-threaded programming language. That's mean we have asynchronous code across application. When a program starts, it creates something that is called Isolate. When isolated created, the microtask manager executes all events asynchronously.

---

17.What is Linting in Flutter?

Linting is the process of checking the source code for Programmatic as well as Stylistic errors and unformatted code. It's helpful in identifying some common and uncommon mistakes that are made during coding like logical errors, unused variables, empty if-else statements among others.

---

18.What is RichText in Flutter?

The RichText widget is used to display text that uses various different styles. The displayed text is described using a tree of TextSpan objects, each of which has its own associated style that is used for that subtree.

---

19.What is scaffold in Flutter?

Scaffold is a class in flutter which provides many widgets or we can say APIs like Drawer, SnackBar, BottomNavigationBar, FloatingActionButton, AppBar, etc. Scaffold will expand or occupy the whole device screen. It will occupy the available space.

---

20.What is a MaterialApp in Flutter?

MaterialApp is a widget that introduces a number of widgets Navigator, Theme that are required to build a material design app. Scaffold Widget is used under MaterialApp, it gives you many basic functionalities, like AppBar, BottomNavigationBar, Drawer, FloatingActionButton, etc.

---

21.What is Flutter life cycle?

The lifecycle of the Flutter App is the show of how the application will change its State. It helps in understanding the idea driving the smooth progression of our applications. Everything in Flutter is a Widget, so before thinking about Lifecycle, we should think about Widgets in Flutter.

---

22.Why is `null safe` in Flutter?

Null safety prevents errors that result from unintentional access of variables set to null . For example, if a method expects an integer but receives null , your app causes a runtime error. This type of error, a null dereference error, can be difficult to debug.

---

23.What is `sync` & `async` in Dart?

synchronous operation: A synchronous operation blocks other operations from executing until it completes. synchronous function: A synchronous function only performs synchronous operations. asynchronous operation: Once initiated, an asynchronous operation allows other operations to execute before it completes.

---

24.What is `Yield *` In Flutter?

yield adds a value to the output stream of the surrounding async* function. It's like return , but doesn't terminate the function.

---

25.Which is better `promise` or `await`?

Async/Await is used to work with promises in asynchronous functions. It is basically syntactic sugar for promises. It is just a wrapper to restyle code and make promises easier to read and use. It makes asynchronous code look more like synchronous/procedural code, which is easier to understand.

---

26.What does `async *` mean in Dart?

Dart Async is related to asynchronous programming. It executes the asynchronous operation in a thread. It ensures that the critical functions to be executed until completion. The asynchronous operation is executed, separately the main application thread.

---

27.What is `Linter` in Dart?

The linter gives you feedback to help you catch potential errors and keep your code in line with the published Dart Style Guide. Enforceable lint rules (or "lints") are cataloged here and can be configured via an analysis options file.

---

28.What are the six 6 Advantages of Flutter?

The main business values Flutter can promise are streamlined development speed, a close-to-native look of cross-platform apps, easy testing, and debugging, plus the opportunity to share the codebase between Android and iOS.

---

29.What is HashMap in Flutter?

Ans: A hash-table based implementation of Map. The HashMap is unordered (the order of iteration is not guaranteed). The keys of a HashMap must have consistent Object.

---

30.What is GetX in Flutter?

GetX is a quick, stable, and light state management library in a flutter. There are so many State Management libraries in flutter like MobX, BLoC, Redux, Provider, and so forth.

---

31.What is `offset` in Flutter?

Generally speaking, Offsets can be interpreted in two ways: As representing a point in Cartesian space a specified distance from a separately-maintained origin. For example, the top-left position of children in the RenderBox protocol is typically represented as an Offset from the top left of the parent box.

---

32.What is the difference between `lint` and `linter`?

Linting is the automated checking of your source code for programmatic and stylistic errors. This is done by using a lint tool (otherwise known as linter). A lint tool is a basic static code analyzer. The term linting originally comes from a Unix utility for C.

---

33.What is didUpdateWidget in Flutter?

didUpdateWidget method Null safety

key, the framework will update the widget property of this State object to refer to the new widget and then call this method with the previous widget as an argument. Override this method to respond when the widget changes (e.g., to start implicit animations).

---

34.Is Dart `static` or `dynamic`?

Is Dart a statically typed language? Yes, Dart 2 is statically typed. For more information, read about Dart's type system. With its combination of static and runtime checks, Dart has a sound type system, which guarantees that an expression of one type cannot produce a value of another type.

Even with type-safe Dart, you can annotate any variable with dynamic if you need the flexibility of a dynamic language. The dynamic type itself is static, but can contain any type at runtime. Of course, that removes many of the benefits of a type-safe language for that variable.

---

35.What is `late` keyword in Flutter?

Overview. In Dart, we use the late keyword to declare variables that will be initialized later. These are called non-nullable variables as they are initialized after the declaration. Hence, we use the late keyword.

---

36.What is `late modifier` in Flutter?
the late modifier is part of the new null-safety by dart it's used to tell the compiler to treat this variable as non-nullable and will be initialized later without it the compiler will treat the variable as nullable and give error. late String name; @override void initState() { super.

Null Safety questions:
https://www.folkstalk.com/2022/09/how-use-late-in-dart-with-code-examples.html

---

37.What does `~/` mean in Dart?

Divide
`~` is currently only used for. ~/ Divide, returning an integer result. and ~/= integer division and assignment.

---

38.What is difference between `async` and `async *` In Flutter?

Async functions execute synchronously until they reach the `await` keyword. Therefore, all synchronous code within an async function body executes immediately. `Async*` is used to create a function that returns a bunch of future values one at a time. Each result is wrapped in a Stream.

---

39.What is `sync` & `async` in Dart?
synchronous operation: A synchronous operation blocks other operations from executing until it completes. synchronous function: A synchronous function only performs synchronous operations. asynchronous operation: Once initiated, an asynchronous operation allows other operations to execute before it completes.

---

40: What is `emit` in Flutter?

`emits` function Null safety

Returns a StreamMatcher for matcher . If matcher is already a StreamMatcher, it's returned as-is. If it's any other Matcher, this matches a single event that matches that matcher. If it's any other Object, this matches a single event that's equal to that object.

---

41.Why are StatefulWidget and state separate classes Flutter?

Widgets are immutable. Since StatefulWidget extends Widget it therefore must be immutable too. Splitting the declaration into two classes allows both StatefulWidget to be immutable and State to be mutable.

---

42.Why we use `mixin` in Dart?

A mixin is a class with methods and properties utilized by other classes in Dart. It is a way to reuse code and write code clean. Mixins, in other words, are regular classes from which we can grab methods (or variables) without having to extend them.

---

43.Can you have an `null` key or `empty` key in a dart map?

Some maps allow null as a value. For those maps, a lookup using this operator cannot distinguish between a key not being in the map, and the key being there with a null value. Methods like containsKey or putIfAbsent can be used if the distinction is important.

---

44.Explain Flutter Provider.

Used in State Management. Based on publish subscriber method. One provider (publisher) Multiple consumers (subscribers).
The function notifyChangeListner updated the consumers on any change.

---

45.what is the spread operator in flutter?

The spread operator is a useful and quick syntax for adding items to arrays, and combining arrays.

The spread operator is simple to use just add … is the beginning and you are good to go.

But you may think why it’s not throwing an error. That’s simple as Column Contains a List<Widget> and spread operator can be used to add an existing List in another List it accepts and understands.

<img src='https://github.com/tulasireddytulasi/flutter-interview-questions/blob/main/img/flutter_images/spread_operator.png' alt="spread_operator"/>

---

46.Explain what a Flutter widget is

A widget is an element of a graphical user interface (GUI) that displays information or provides a specific way for a user to interact with the operating system or an application.

A Flutter app is always considered as a tree of widgets. Whenever you are going to code for building anything in Flutter, it will be inside a widget. Widgets describe how your app view should look like with their current configuration and state.

Widgets are the central class hierarchy in the Flutter framework. A widget is an immutable description of part of a user interface. Widgets can be inflated into elements, which manage the underlying render tree. Widgets themselves have no mutable state (all their fields must be final).

---

47.Explain what the Flutter SDK and Dart SDK is

Flutter is Google's free, open-source software development kit (SDK) for cross-platform mobile application development. Using a single platform-agnostic codebase, Flutter helps developers build high-performance, scalable applications with attractive and functional user interfaces for Android or IOS.

The Dart SDK has the libraries and command-line tools that you need to develop Dart web, command-line, and server apps. To get the Dart SDK, see Get Dart. If you're developing Flutter apps, then you don't need to separately download the Dart SDK; just install Flutter.

---

48.What is the difference between AOT and JIT?

Ahead-of-Time (AOT) is a type of compilation that compiles your app at build time.
Just-in-Time (JIT) is a type of compilation that compiles your app in the browser at runtime.

---

49.How does Flutter run my code on Android?

The engine’s C and C++ code are compiled with Android’s NDK. The Dart code (both the SDK’s and yours) are ahead-of-time (AOT) compiled into native, ARM, and x86 libraries. Those libraries are included in a “runner” Android project, and the whole thing is built into an .apk. When launched, the app loads the Flutter library. Any rendering, input, or event handling, and so on, is delegated to the compiled Flutter and app code. This is similar to the way many game engines work.

During debug mode, Flutter uses a virtual machine (VM) to run its code in order to enable stateful hot reload, a feature that lets you make changes to your running code without recompilation. You’ll see a “debug” banner in the top right-hand corner of your app when running in this mode, to remind you that performance is not characteristic of the finished release app.

for more details: https://docs.flutter.dev/resources/faq

---

50.what is widget testing tools in flutter?

Widget testing tool is real devices or emulators.

---





