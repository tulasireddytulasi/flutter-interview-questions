# Flutter Architecture Questions:

These concepts form the basis for understanding and implementing an Architecture enabling developers
to create responsive and efficient applications.

##### 1. What are the things we have to discuss and plan at architecture level while developing Flutter App?

When developing a Flutter app, there are several architectural aspects that should be discussed and
planned at the beginning to ensure a solid foundation and smooth development process. Here are some
key points to consider at the architecture level:

1. **Project Structure**: Decide on a consistent and scalable project structure that follows best
   practices and conventions. This includes organizing files, folders, and packages in a logical
   manner, separating concerns, and adhering to naming conventions.

2. **State Management**: Determine the appropriate state management approach for your app. Flutter
   provides various options, including Provider, BLoC (Business Logic Component), Riverpod, MobX,
   and more. Evaluate the complexity of your app and choose the approach that aligns best with your
   requirements.

3. **Navigation and Routing**: Plan the navigation flow of your app. Decide whether to use named
   routes, nested routes, or a combination of both. Consider implementing navigation packages
   like `go_router` or `auto_route` for more advanced routing scenarios.

4. **Architecture Patterns**: Discuss and choose the architectural patterns that fit your app's
   needs. Common patterns include Model-View-ViewModel (MVVM), Model-View-Controller (MVC),
   Model-View-Presenter (MVP), or a combination of these patterns with other architectural concepts
   like Clean Architecture or Hexagonal Architecture.

5. **Data Management**: Plan how you will manage data in your app. This includes deciding on the
   data storage strategy (local, remote, or both), implementing data access layers (repositories,
   data sources), and handling data caching and synchronization.

6. **Networking and API Integration**: If your app requires communication with remote services or
   APIs, plan the networking layer. Discuss the use of packages like `http`, `dio`, or `retrofit`
   for making HTTP requests, handling responses, and error handling.

7. **Dependency Injection**: Evaluate the need for a dependency injection (DI) solution to manage
   dependencies and promote testability. Popular DI packages for Flutter
   include `get_it`, `injectable`, and `provider`.

8. **Internationalization and Localization**: If your app needs to support multiple languages or
   regions, plan for internationalization and localization. Flutter provides tools and packages
   like `intl` and `flutter_localizations` to handle translations, date/time formatting, and other
   locale-specific requirements.

9. **Testing Strategy**: Discuss and plan your testing approach early on. This includes deciding on
   the types of tests (unit, widget, integration, end-to-end), testing frameworks (
   e.g., `flutter_test`, `mockito`), and setting up a continuous integration (CI) pipeline for
   automated testing.

10. **Architecture Documentation**: Consider documenting your app's architecture, including
    diagrams, code structure, and decision rationales. This documentation can serve as a reference
    for the team and aid in onboarding new members or maintaining the codebase in the future.

11. **Performance and Optimization**: Discuss performance considerations and optimization
    strategies, such as code splitting, lazy loading, and memory management techniques, to ensure a
    smooth and efficient user experience.

12. **Deployment and Release Strategy**: Plan your deployment strategy, including target platforms (
    Android, iOS, web), release channels (e.g., production, beta), and the process for building and
    distributing app updates.

By addressing these architectural aspects early in the development process, you can establish a
solid foundation for your Flutter app, promote code maintainability, and facilitate collaboration
among team members. Remember, architectural decisions should be revisited and adjusted as the
project evolves and requirements change.

--------

##### 2. What is MVVM? Explain in detail.

**Model-View-ViewModel** (MVVM) is a software architectural pattern that supports the separation of
the UI (which is View) from the development of the business logic or the backend logic (Model). The
view model inside MVVM is the bridge responsible for data conversion in a way that behaves by the
changes happening on the UI.

In addition, to know about the responsibilities of the three components, it's also important to
understand how they interact. At the highest level, the view `"knows about"` the view model, and the
view model `"knows about"` the model, but the model is unaware of the view model, and the view model
is unaware of the view.

<img src='https://miro.medium.com/v2/resize:fit:700/0*Plj_xKz_2EwTrXQz.png' alt="life cycle"/>

##### There are several advantages of using MVVM:

- Separation of Concerns: It is a design principle for separating a computer program into distinct
  sections such that each section addresses a separate concern. A concern is anything that matters
  in providing a solution to a problem.
- Improved testability
- Defined project structure
- Parallel development of UI
- Abstract the View, thus reducing the quantity of business logic required in the code behind it

##### Some disadvantages of using MVVM:Some disadvantages of using MVVM:

- It has a slightly steep learning curve. How all the layers work together may take some time to
  understand.
- It adds a lot of extra classes, so it's not ideal for low-complexity projects.

Since architectural or design patterns are platform-agnostic, they can be used with any framework,
in our case, Flutter.

##### Components:

**Model**: This is the domain model or the model which represents the data from your backend (aka
data access layer). Models hold information but typically don't handle behavior. They don't format
information or influence how data appears. The Model in the MVVM design pattern represents the
actual data that will be used in application development

**View**: This is the only part of the application users actually interact with. For instance, the
user presses the button, scrolls the list, edits the settings, etc., and these events are then
forwarded to the view model, which then does the processing and returns the expected user response (
some form of UI). It's important to remember that the View isn't responsible for handling the state.

`A View should be as dumb as possible. Never put your business logic in Views.`

**View Model**: The `ViewModel` acts as an intermediate between the View and the Model so that it
provides data to the UI. The `ViewModel` may also expose methods for helping to maintain the View's
state, update the model based on the action's on a View, and trigger events on the View. For
Flutter, we have a listener called `ChangeNotifier` that allows ViewModel to inform or update the
View whenever the data get updated.

##### The ViewModel has two responsibilities:

- it reacts to user inputs (e.g., by changing the model, initiating network requests, or routing to
  different screens)
- it offers output data that the View can subscribe to

In summary, the ViewModel sits behind the UI layer. It exposes data needed by a View and can be
viewed as the source our Views go to for both data and actions.

**Reference**:
https://freedium.cfd/https://betterprogramming.pub/how-to-use-mvvm-in-flutter-4b28b63da2ca

