# Design Patterns

Design patterns are typical solutions to common problems in software design. They provide templates on how to solve problems and can speed up the development process by providing tested, proven development paradigms. Design patterns are usually divided into three main categories:

<img src='https://github.com/tulasireddytulasi/flutter-interview-questions/blob/main/img/flutter_images/types_of_patterns.png' alt="Types of Deign Patterns"/>

## 1. Creational Patterns
Creational patterns deal with object creation mechanisms, aiming to create objects in a manner suitable to the situation. They help make a system independent of how its objects are created, composed, and represented.

- **Singleton:** Ensures a class has only one instance and provides a global point of access to it.
- **Factory Method:** Defines an interface for creating an object but allows subclasses to alter the type of objects that will be created.
- **Abstract Factory:** Provides an interface for creating families of related or dependent objects without specifying their concrete classes.
- **Builder:** Separates the construction of a complex object from its representation so that the same construction process can create different representations.
- **Prototype:** Creates new objects by copying an existing object, known as the prototype.

## 2. Structural Patterns
Structural patterns concern class and object composition. They use inheritance to compose interfaces and define ways to compose objects to obtain new functionalities.

- **Adapter:** Allows incompatible interfaces to work together by converting the interface of a class into another interface that a client expects.
- **Bridge:** Separates an object’s abstraction from its implementation so that the two can vary independently.
- **Composite:** Composes objects into tree structures to represent part-whole hierarchies. It lets clients treat individual objects and compositions uniformly.
- **Decorator:** Adds additional functionality to an object dynamically. It provides a flexible alternative to subclassing for extending functionality.
- **Facade:** Provides a simplified interface to a complex subsystem.
- **Flyweight:** Reduces the cost of creating and manipulating a large number of similar objects by sharing as much data as possible.
- **Proxy:** Provides a surrogate or placeholder for another object to control access to it.

## 3. Behavioral Patterns
Behavioral patterns are concerned with algorithms and the assignment of responsibilities between objects. They describe not just patterns of objects or classes but also the patterns of communication between them.

- **Chain of Responsibility:** Passes a request along a chain of handlers. Upon receiving a request, each handler decides either to process the request or to pass it to the next handler in the chain.
- **Command:** Encapsulates a request as an object, thereby allowing for parameterization of clients with queues, requests, and operations.
- **Interpreter:** Defines a representation for a language’s grammar and uses that representation to interpret sentences in the language.
- **Iterator:** Provides a way to access elements of a collection object sequentially without exposing its underlying representation.
- **Mediator:** Defines an object that encapsulates how a set of objects interact. This promotes loose coupling by keeping objects from referring to each other explicitly.
- **Memento:** Captures and externalizes an object’s internal state so that the object can be restored to this state later without violating encapsulation.
- **Observer:** Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
- **State:** Allows an object to alter its behavior when its internal state changes. The object will appear to change its class.
- **Strategy:** Defines a family of algorithms, encapsulates each one, and makes them interchangeable. It lets the algorithm vary independently from clients that use it.
- **Template Method:** Defines the skeleton of an algorithm in a method, deferring some steps to subclasses. It allows subclasses to redefine certain steps of an algorithm without changing its structure.
- **Visitor:** Represents an operation to be performed on elements of an object structure. It lets you define a new operation without changing the classes of the elements on which it operates.

Each of these patterns offers a specific solution to a commonly occurring problem in software design, making your code more flexible, reusable, and easier to maintain.

## References
- "Design Patterns: Elements of Reusable Object-Oriented Software" by Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides (Gang of Four)
- "Head First Design Patterns" by Eric Freeman, Bert Bates, Kathy Sierra, Elisabeth Robson

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
