# Flutter complete interview questions with answers

this file contains a list of flutter interview questions with answers

---
 Flutter Interview Questions and Answers
---

#### 1. What is the difference between main() function and the runApp() function in Flutter?

In Dart, main() acts as the entry point for the program whereas runApp() attaches the given widget to the screen. The runApp() function takes the given Widget and makes it the root of the widget tree. In this example, the widget tree consists of two widgets, the Center widget and its child, the Text widget. The framework forces the root widget to cover the screen, which means the text “Hello, world” ends up centered on screen.

------------

#### 2. What is WidgetsBinding.instance.addPostFrameCallback( ) and WidgetsFlutterBinding.ensureInitialized()  in Flutter?

- **WidgetsBinding.instance.addPostFrameCallback()** is used to schedule code execution after the next frame has been rendered.
- **WidgetsFlutterBinding.ensureInitialized()** is used to initialize the Flutter engine before running any Flutter-related code.

------------

#### 3. What is WidgetsBinding?

- **WidgetsBinding**:
  - WidgetsBinding is a class in Flutter that manages the lifecycle of a Flutter application.
  - WidgetsBinding is responsible for initializing the application, setting up the event loop, and updating the UI.
  - WidgetsBinding is not an isolate, but it is responsible for managing the UI thread.
  - WidgetsBinding is responsible for updating the UI when the application state changes.
  - WidgetsBinding is responsible for handling platform messages, which are messages sent from the native platform to the Flutter application.
  - WidgetsBinding is responsible for handling platform messages, which are messages sent from the native platform to the Flutter application. 

------------

#### 4. How to know the app is in the foreground or background?

1. Implement `WidgetsBindingObserver` in your StatefulWidget.
2. Register the observer in `initState()`.
3. Override `didChangeAppLifecycleState` to detect lifecycle changes.
4. Check if the state is `resumed` (foreground) or `paused` (background).
5. Remove the observer in `dispose()`.

------------

#### 5. What are some commonly used SystemChrome methods in Flutter?

The **SystemChrome** class in Flutter provides a set of methods that allow you to interact with the system's user interface and control various aspects of the app's appearance and behavior. Here are some commonly used **SystemChrome** methods:

1. **SystemChrome.setPreferredOrientations(List<DeviceOrientation> orientations):** This method allows you to set the preferred orientations for your app. For example, you can set it to **[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]** to lock the app in portrait mode.

**Example:**

```dart
import 'package:flutter/services.dart';

void setAppOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
```

------------

#### 6. What is the Android lifecycle, Flutter lifecycle, and app lifecycle?

- **Android lifecycle** refers to the different states an Android app can be in, such as Created, Started, Resumed, Paused, Stopped, and Destroyed. Developers need to handle these states to ensure their app behaves correctly.
- **Flutter lifecycle** refers to the states a Flutter app goes through, which are similar to Android but with some differences. The main states are Inactive, Paused, Resumed, Detached, and Disposed.
- **App lifecycle** generally refers to the different states any app can be in, such as foreground, background, active, inactive, and resumed.

------------

#### 7. What is a KeyedSubtree in Flutter?

In Flutter, a **KeyedSubtree** is a utility widget that helps optimize the rendering and rebuilding process of complex widget trees. It is especially useful when dealing with lists or grids of widgets that need to be frequently rebuilt or reordered.

By using **KeyedSubtree**, Flutter can avoid unnecessarily rebuilding widgets that have not changed, and instead focus on updating only the widgets that have been modified. This can significantly improve performance, especially in cases where the widget tree is large or complex, and frequent rebuilds are required.

**Example:**

```dart
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return KeyedSubtree(
          key: ValueKey(items[index]), // Provide a unique key for each item
          child: ListTile(
            title: Text(items[index]),
          ),
        );
      },
    );
```

------------

#### 8. How do you call a method of Page 1 from Page 2, both being StatefulWidgets?

1. On **Page1**, we define a method **showMessage** that we want to call from **Page2**.
2. When navigating to **Page2**, we pass a reference to the **showMessage** method as a callback function.
3. On **Page2**, we receive the callback function through the constructor and store it in the **widget.callback** property.
4. When the button is pressed on **Page2**, we call **widget.callback(),** which invokes the **showMessage** method of **Page1**.

------------

#### 9. What is the `dart:ffi` package, and what is it used for?

The **dart:ffi** package in Dart is used for Foreign Function Interface (FFI), which allows Dart code to call and interact with native code libraries (e.g., C, C++, Rust) written in other programming languages. It provides a way to bridge the gap between Dart and native code, enabling you to leverage existing native libraries or write high-performance code in languages like C/C++ while still using Dart for the main application logic.

------------

#### 10. What is the command for creating a new Flutter project with a specific platform and language for each platform?

To create a new Flutter project with a specific platform and language for each platform, you can use the **flutter create** command with the **--platforms** and **--language** options.
The general command structure is:

```dart
flutter create --platforms=<platforms> --language=<language> <project_name>
```
Create a new Flutter project for Android and iOS, using Kotlin for Android and Swift for iOS:
```dart
flutter create --platforms=android,ios --language=kotlin,swift my_project
```
Create a new Flutter project for web and desktop (Windows, macOS, and Linux), using Dart for all platforms:

```dart
flutter create --platforms=web,windows,macos,linux --language=dart my_project
```
If you don't specify the **--platforms** and **--language** options, Flutter will create a project for all supported platforms using Dart as the default language.

------------

#### 11. What is the location of the local pub cache directory?

In Flutter, the local pub cache directory is where the packages you've downloaded are stored. The default location of the pub cache directory varies based on your operating system:

- Windows: %APPDATA%\Pub\Cache
- macOS/Linux: $HOME/.pub-cache

You can also find the location of the pub cache directory by running the following command in your terminal:
```dart
flutter pub cache
```

------------

#### 12. Explain the following below:

1. **Lifting State Up**: In Flutter, when multiple child widgets need to share data or state, it is often better to lift the state up to their closest common ancestor widget. This way, the parent widget can manage the state and pass the data down to the child widgets as needed, ensuring consistency and avoiding prop drilling.

2. **InheritedWidget**: The `InheritedWidget` is a special type of widget that enables data to be efficiently passed down the widget tree to any descendant widgets that depend on it. It is useful for passing data that needs to be shared among multiple widgets without having to manually pass it down through each level of the tree.

3. **ValueListenableBuilder**: The `ValueListenableBuilder` is a widget that rebuilds itself whenever the value of a `ValueListenable` object changes. It is useful for creating widgets that depend on data that can change over time, such as data from a `ChangeNotifier` or a `ValueNotifier`.

4. **ClipRRect**: The `ClipRRect` widget is used to clip a rectangular area from a child widget. It can be used to create rounded corners, circles, or any other shape that can be described by a rectangular clip.

5. **SliverAppBar**: The `SliverAppBar` is a widget that can be used in a `CustomScrollView` to create an app bar that can be pinned, floating, or snapping. It is designed to work seamlessly with other slivers in a scrolling view.

6. **FittedBox**: The `FittedBox` is a widget that scales and positions its child widget to fit within its available space. It can be useful for displaying content that may be larger or smaller than the available space, such as images or text.

7. **CustomPaint**: The `CustomPaint` widget allows you to draw custom graphics directly onto the canvas using a `CustomPainter` class. It is useful for creating complex shapes, animations, or visualizations that cannot be easily achieved with the built-in Flutter widgets.

8. **TweenAnimationBuilder**: The `TweenAnimationBuilder` is a widget that builds a widget based on the value of an animation. It is useful for creating custom animations by providing a builder function that returns a widget based on the current value of the animation.

9. **FFI (Foreign Function Interface) in Dart**: FFI in Dart allows you to call native code (C, C++, Rust, etc.) from Dart and vice versa. It provides a way to interact with platform-specific libraries and APIs that are not available in Dart's standard library. This feature can be useful for tasks like accessing low-level system functionality, hardware peripherals, or leveraging existing native libraries.

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

- `Upper layers`: The Dart-based platform that takes care of app widgets, gestures, animations, illustrations, and materials;
- `Flutter engine`: Handles the display and formatting of text.
-  `Built-in service`: Used for the management of plugins, packages, and event loops.

for more details: https://medium.com/flutter-community/the-layer-cake-widgets-elements-renderobjects-7644c3142401

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

41.Why are StatefulWidget and state separate classes Flutter?

Widgets are immutable. Since StatefulWidget extends Widget it therefore must be immutable too. Splitting the declaration into two classes allows both StatefulWidget to be immutable and State to be mutable.

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







