# Flutter Async Questions:

These concepts form the basis for understanding and implementing Async Operations, enabling
developers to create responsive and efficient applications.

##### 1. What is Stream?

A **stream** is a sequence of asynchronous events, and it allows the components of your
application to communicate without blocking the execution. And they also allow for real-time updates
and reactive programming, which can help developers create responsive and interactive applications.
Streams are crucial for handling user input, network requests, and other asynchronous tasks in a
Flutter application.

A **stream** is like a pipe, you put a value on the one end and if there’s a listener on the other
end that listener will receive that value. A Stream can have multiple listeners and all of those
listeners will receive the same value when it’s put in the pipeline. The way you put values on a
stream is by using a **StreamController**.

--------

##### 2. What are different types of Streams in dart?

In Dart, there are two main types of streams:

1. **Single-Subscription Stream**:
   - **Description**: This type of stream can only be listened to by a single subscriber. Once the stream is consumed, it cannot be reused by other listeners.
   - **Usage**: Suitable for scenarios where the data is consumed once, such as reading data from a file or processing a single event.
   - **Example**: `Stream.fromIterable([1, 2, 3])` creates a single-subscription stream that emits a sequence of numbers.

2. **Broadcast Stream**:
   - **Description**: This type of stream allows multiple subscribers to listen to the same stream concurrently. Each listener receives the same events independently.
   - **Usage**: Useful when you want multiple parts of your application to react to the same stream of data or events, such as broadcasting user actions or notifications.
   - **Example**: `StreamController.broadcast()` creates a broadcast stream that can have multiple listeners.

Each type of stream serves different use cases, with single-subscription streams being ideal for single-use scenarios and broadcast streams suited for multi-use scenarios.

--------


##### 3. What is Future?

In Dart, a future is an instance of the **Future** class that represents the result of an
asynchronous operation. **Asynchronous** operations are delayed operations that can't provide an
immediate result, such as reading a file, querying a database, or fetching data over a network. A
future can have two states:

- **Uncompleted**: The future is in this state before it has produced a value.
- **Completed**: The future completes with a value if the asynchronous operation succeeds, or with
  an error if it fails.

--------

##### 4. Stream vs Future?

The difference is that Futures are about one-shot request/response (I ask, there is a delay, I get a
notification that my Future is ready to collect, and I'm done!) whereas Streams are a continuous
series of responses to a single request (I ask, there is a delay, then I keep getting responses
until the stream dries up or I decide to close it and walk away).

--------

##### 5. What is Stream Builder?

In Flutter, a **StreamBuilder** is a widget that acts as a bridge between a data stream and the user
interface (UI). It listens to events from streams, rebuilds itself for upcoming events, and displays
real-time data in apps. For example, you can use a StreamBuilder in chatting apps or real-time stock
trading apps.

--------

##### 6. What is Future Builder?

FutureBuilder is a widget in Flutter that can handle different widget states based on the resolution
of a Future. It can be used to run asynchronous functions and update the user interface (UI) based
on the function's output. FutureBuilder can also eliminate the need for manual management of Future
states, such as handling loading indicators or error messages.

--------

##### 7. What is Async and await ?

**Async/await** is a feature in Dart that allows us to write asynchronous code that looks and
behaves like synchronous code, making it easier to read.

When a function is marked **async**, it signifies that it will carry out some work that could take
some time and will return a Future object that wraps the result of that work.

The **async** keyword marks a function as asynchronous, which means that the program will run
independently of the function, even if it takes time to complete. Asynchronous functions return a
**Future** to indicate that their result is not immediately available. The **await** keyword is 
used to pause the execution of the function until the awaited **Future** completes.

The **await** keyword, on the other hand, allows you to delay the execution of an async function
until the awaited Future has finished. This enables us to create code that appears to be synchronous
but is actually asynchronous.

The **async** and **await** keywords both provide a declarative way to define an asynchronous
function and use their results. You can use the **async** keyword before a function body to make it
asynchronous. You can use the **await** keyword to get the completed result of an asynchronous
expression.

--------

##### 8. What is Async*?

- **async*** gives you a Stream

**Async*** is used to create a function that returns a bunch of future values one at a time. Each
result is wrapped in a Stream.

--------

##### 9. What is yeild?

**yield** adds a value to the output stream of the surrounding async* function. It's like return ,
but does not terminate the function.

--------

##### 10. What is `sync` & `async` in Dart?
- **Synchronous operation:** A synchronous operation blocks other operations from executing until it completes. synchronous function: A synchronous function only performs synchronous operations. 
- **Asynchronous operation:** Once initiated, an asynchronous operation allows other operations to execute before it completes.

--------

##### 11. Which is better `promise` or `await`?

Async/Await is used to work with promises in asynchronous functions. It is basically syntactic sugar for promises. It is just a wrapper to restyle code and make promises easier to read and use. It makes asynchronous code look more like synchronous/procedural code, which is easier to understand.

--------

##### 12. What is diff b/w  Async and Async* ?

- **async** gives you a Future
- **async*** gives you a Stream

**Async** functions execute synchronously until they reach the await keyword. Therefore, all
synchronous code within an async function body executes immediately.

**Async*** is used to create a function that returns a bunch of future values one at a time. Each
result is wrapped in a Stream.

--------

##### 13. What is Event lopps?

The Event Loop is a mechanism that continuously checks and processes events and tasks in a loop,
allowing Dart to handle asynchronous operations without blocking the main thread.
Key points:

1. Dart is single-threaded, executing one task at a time on the main thread.
2. Asynchronous operations are added to an Event Queue.
3. The Event Loop repeatedly checks the Event Queue and processes tasks one by one.
4. Microtask Queue holds scheduled tasks that execute before the next Event Queue task.
5. Ensures responsiveness by preventing the main thread from being blocked.
6. Supports asynchronous operations like Futures and Streams.

Understanding the Event Loop is crucial for writing efficient, non-blocking code and managing
asynchronous operations effectively in Dart.

--------

##### 14. Diff b/w Future and Isolate?

A **Future** represents the result of an asynchronous operation, while an **Isolate** is a separate
execution thread for parallel processing.
**Futures** are used for handling asynchronous tasks like network requests or file I/O without
blocking the main thread. **Isolates** are used for running computationally intensive tasks in
parallel or offloading work from the main thread.

The key differences are:

- Futures use the same memory space, Isolates have separate memory heaps.
- Futures communicate by passing values, Isolates use message passing.
- Futures are for asynchronous programming, Isolates are for parallel programming.

------------

##### 15. What will happen in background when you use Future?

When you use a Future in Dart, the asynchronous operation it represents is executed on a separate
thread or event loop in the background. This allows the main thread (or UI thread in Flutter) to
continue executing other code without being blocked.

The key points are:

- Asynchronous operation runs on a separate thread/event loop in the background.
- Main thread remains unblocked and responsive.
- Callbacks registered with the Future execute on the main thread once the operation completes.
- This ensures smooth UI experience in Flutter by preventing main thread blocking.

------------

##### 16. What is emit in Flutter?

**emits** function Null safety

Returns a StreamMatcher for matcher . If matcher is already a StreamMatcher, it's returned as-is. If
it's any other Matcher, this matches a single event that matches that matcher. If it's any other
Object, this matches a single event that's equal to that object.

------------




