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

------------

**Questions:**

##### 1. Disadvantages of Singleton Design Pattern

The Singleton design pattern, while useful in certain scenarios, has several disadvantages:

1. Global state: Singletons introduce global state, which can make code harder to reason about and test.

2. Tight coupling: Classes that use a Singleton become tightly coupled to it, reducing flexibility and reusability.

3. Hidden dependencies: Singleton usage isn't always obvious in method signatures, leading to hidden dependencies.

4. Difficulty in testing: Singletons can make unit testing more challenging, as they maintain state between tests.

5. Concurrency issues: In multithreaded environments, Singletons can cause race conditions if not properly implemented.

6. Violation of Single Responsibility Principle: Singletons often handle their own creation and lifecycle, potentially violating this principle.

7. Inflexibility: Singletons can be difficult to extend or modify without affecting all code that uses them.

8. Memory management: In some languages, Singletons can cause memory leaks if not properly managed.

9. Reduced modularity: Singletons can make it harder to modularize code, as they create dependencies across modules.

10. Overuse: Developers might overuse Singletons as an easy solution, leading to poor design in the long run.

These drawbacks often make alternatives like dependency injection more appealing in modern software design.

------------

#### Design Patterns Code Examples:

##### 1. Singleton Pattern

Explanation: The Singleton pattern ensures a class has only one instance and provides a global point of access to it. In this example, DatabaseConnection uses a private constructor and a static instance. The factory constructor always returns the same instance.

```dart
class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  factory DatabaseConnection() {
    return _instance;
  }

  DatabaseConnection._internal();

  void connect() {
    print('Connected to database');
  }
}

void main() {
  var db1 = DatabaseConnection();
  var db2 = DatabaseConnection();
  print(identical(db1, db2)); // true
}
```

--------

##### 2. Factory Method Pattern:

**Use**: Defines an interface for creating an object, but lets subclasses decide which class to instantiate.
**Example**: A payment processor that creates different types of payment methods.

```dart
abstract class Payment {
  void processPayment();
}

class CreditCardPayment implements Payment {
  @override
  void processPayment() {
    print('Processing credit card payment');
  }
}

class PayPalPayment implements Payment {
  @override
  void processPayment() {
    print('Processing PayPal payment');
  }
}

abstract class PaymentFactory {
  Payment createPayment();
}

class CreditCardPaymentFactory implements PaymentFactory {
  @override
  Payment createPayment() {
    return CreditCardPayment();
  }
}

class PayPalPaymentFactory implements PaymentFactory {
  @override
  Payment createPayment() {
    return PayPalPayment();
  }
}
```

------------

##### 3. Adapter Pattern:

Explanation: The Adapter pattern allows incompatible interfaces to work together. Here, PrinterAdapter adapts the OldPrinter to the NewPrinter interface.

```dart
class OldPrinter {
  void printDocument(String text) {
    print('Old Printer: $text');
  }
}

abstract class NewPrinter {
  void print(String document);
}

class PrinterAdapter implements NewPrinter {
  final OldPrinter _oldPrinter;

  PrinterAdapter(this._oldPrinter);

  @override
  void print(String document) {
    _oldPrinter.printDocument(document);
  }
}

void main() {
  var oldPrinter = OldPrinter();
  NewPrinter newPrinter = PrinterAdapter(oldPrinter);
  newPrinter.print('Hello, World!');
}
```

------------

##### 4. Decorator Pattern:

Certainly! The Decorator Design Pattern is a structural pattern that allows behavior to be added to an individual object, either statically or dynamically, without affecting the behavior of other objects from the same class. Here's an example of the Decorator pattern in Dart:

```dart
// Component interface
abstract class Coffee {
  String getDescription();
  double getCost();
}

// Concrete Component
class SimpleCoffee implements Coffee {
  @override
  String getDescription() => "Simple Coffee";

  @override
  double getCost() => 2.0;
}

// Decorator
abstract class CoffeeDecorator implements Coffee {
  final Coffee _decoratedCoffee;

  CoffeeDecorator(this._decoratedCoffee);

  @override
  String getDescription() => _decoratedCoffee.getDescription();

  @override
  double getCost() => _decoratedCoffee.getCost();
}

// Concrete Decorators
class MilkDecorator extends CoffeeDecorator {
  MilkDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() => "${super.getDescription()}, Milk";

  @override
  double getCost() => super.getCost() + 0.5;
}

class SugarDecorator extends CoffeeDecorator {
  SugarDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() => "${super.getDescription()}, Sugar";

  @override
  double getCost() => super.getCost() + 0.2;
}

class WhippedCreamDecorator extends CoffeeDecorator {
  WhippedCreamDecorator(Coffee coffee) : super(coffee);

  @override
  String getDescription() => "${super.getDescription()}, Whipped Cream";

  @override
  double getCost() => super.getCost() + 1.0;
}

void main() {
  // Create a simple coffee
  Coffee coffee = SimpleCoffee();
  print("${coffee.getDescription()} costs \$${coffee.getCost()}");

  // Add milk to the coffee
  coffee = MilkDecorator(coffee);
  print("${coffee.getDescription()} costs \$${coffee.getCost()}");

  // Add sugar to the coffee with milk
  coffee = SugarDecorator(coffee);
  print("${coffee.getDescription()} costs \$${coffee.getCost()}");

  // Add whipped cream to the coffee with milk and sugar
  coffee = WhippedCreamDecorator(coffee);
  print("${coffee.getDescription()} costs \$${coffee.getCost()}");

  // Create a different combination
  Coffee anotherCoffee = WhippedCreamDecorator(SugarDecorator(SimpleCoffee()));
  print("${anotherCoffee.getDescription()} costs \$${anotherCoffee.getCost()}");
}
```

In this example:

1. `Coffee` is the component interface that defines the basic behavior of a coffee.

2. `SimpleCoffee` is a concrete component that implements the basic coffee.

3. `CoffeeDecorator` is the base decorator class that implements the `Coffee` interface and has a reference to a `Coffee` object.

4. `MilkDecorator`, `SugarDecorator`, and `WhippedCreamDecorator` are concrete decorators that add specific behaviors (milk, sugar, and whipped cream) to the coffee.

5. In the `main` function, we demonstrate how decorators can be used to add various combinations of additional ingredients to the coffee dynamically.

The Decorator pattern allows us to:
- Add responsibilities to objects dynamically
- Provide a flexible alternative to subclassing for extending functionality
- Combine behaviors by wrapping objects in multiple decorators

This pattern is particularly useful when you need to add features to objects without altering their structure, and when you want to avoid a class explosion that can occur with multiple subclass combinations.

------------

##### 5. Facade Pattern:

Explanation: The Facade pattern provides a simplified interface to a complex subsystem. Here, **ComputerFacade** simplifies the process of starting a computer by coordinating the CPU, Memory, and HardDrive subsystems.

```dart
class CPU {
  void freeze() => print('CPU: Freezing');
  void jump(int position) => print('CPU: Jumping to $position');
  void execute() => print('CPU: Executing');
}

class Memory {
  void load(int position, String data) => print('Memory: Loading $data at $position');
}

class HardDrive {
  String read(int lba, int size) => 'data from sector $lba with size $size';
}

class ComputerFacade {
  final CPU _cpu;
  final Memory _memory;
  final HardDrive _hardDrive;

  ComputerFacade(this._cpu, this._memory, this._hardDrive);

  void start() {
    _cpu.freeze();
    _memory.load(0, _hardDrive.read(0, 1024));
    _cpu.jump(0);
    _cpu.execute();
  }
}

void main() {
  var computer = ComputerFacade(CPU(), Memory(), HardDrive());
  computer.start();
}
```

------------

##### 6. Observer Pattern:

**Use**: Defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.
**Example**: A news publisher (subject) and subscribers (observers). When new content is published, all subscribers are notified.

```dart
class NewsPublisher {
  List<Subscriber> _subscribers = [];
  
  void addSubscriber(Subscriber subscriber) {
    _subscribers.add(subscriber);
  }
  
  void notifySubscribers(String news) {
    for (var subscriber in _subscribers) {
      subscriber.update(news);
    }
  }
}

abstract class Subscriber {
  void update(String news);
}

class NewsReader implements Subscriber {
  String name;
  NewsReader(this.name);
  
  @override
  void update(String news) {
    print('$name received news: $news');
  }
}
```

------------

##### 7. Strategy Pattern:

**Use**: Defines a family of algorithms, encapsulates each one, and makes them interchangeable.
**Example**: Different sorting algorithms that can be used interchangeably.

```dart
abstract class SortStrategy {
  void sort(List<int> data);
}

class BubbleSort implements SortStrategy {
  @override
  void sort(List<int> data) {
    print('Sorting using bubble sort');
    // Bubble sort implementation
  }
}

class QuickSort implements SortStrategy {
  @override
  void sort(List<int> data) {
    print('Sorting using quick sort');
    // Quick sort implementation
  }
}

class Sorter {
  SortStrategy _strategy;
  
  Sorter(this._strategy);
  
  void setStrategy(SortStrategy strategy) {
    _strategy = strategy;
  }
  
  void sortData(List<int> data) {
    _strategy.sort(data);
  }
}
```

------------



