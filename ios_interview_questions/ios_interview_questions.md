Got it 👍 I’ll prepare **short, interview-focused answers** for each topic so you can revise quickly and confidently.
Swift Language
---

### **1. Value types vs Reference types (struct vs class vs enum)**

* **Structs & Enums** → Value types, copied when passed or assigned. Each instance keeps its own data.
* **Classes** → Reference types, multiple variables can point to the same instance in memory.
* Use **structs** for immutability, safety, lightweight models.
* Use **classes** when you need inheritance, shared state, or reference semantics.

---

### **2. ARC (Automatic Reference Counting) – strong, weak, unowned**

* ARC automatically manages memory by keeping track of references.
* **Strong** → Default. Increases reference count, keeps object alive.
* **Weak** → No strong ownership, does not increase count. Optional, becomes `nil` when object deallocated.
* **Unowned** → Like weak, but non-optional. Use when reference should never be `nil` during lifetime.
* Prevent **retain cycles** by using weak/unowned in closures or delegate patterns.

---

### **3. Protocols, Extensions, Generics**

* **Protocols** → Define a blueprint of properties/methods. Achieve abstraction and polymorphism.
* **Extensions** → Add new functionality to existing types (struct, class, enum, protocol) without modifying source.
* **Generics** → Write flexible, reusable code. Example: `func swap<T>(_ a: inout T, _ b: inout T)`.

---

### **4. Error Handling (try, throw, catch)**

* Swift uses `Error` protocol for error types.
* Mark functions that can fail with `throws`.
* Handle errors using:

  ```swift
  do {
      try someFunction()
  } catch {
      print(error)
  }
  ```
* `try?` → Returns `nil` if fails.
* `try!` → Crashes if error thrown.

---

### **5. Closures, Escaping vs Non-Escaping**

* **Closures** → Self-contained blocks of code, like functions without names.
* **Non-escaping (default)** → Executed immediately within function scope.
* **Escaping** → Stored and executed later (e.g. completion handlers). Must mark with `@escaping`.
* Capture list (`[weak self]`) used to avoid retain cycles.

---

### **6. Property Wrappers (@State, @Published, @ObservedObject – SwiftUI)**

* **@State** → Local, mutable state for a SwiftUI View. Triggers view updates.
* **@Published** → Used inside `ObservableObject`. Notifies subscribers when value changes.
* **@ObservedObject** → A view subscribes to an external `ObservableObject` to reflect changes.
* Helps manage reactive UI updates cleanly.

---

### **7. Concurrency (GCD, async/await, DispatchQueue, OperationQueue)**

* **GCD (Grand Central Dispatch)** → Low-level API for concurrent execution. Use `DispatchQueue` for background or main thread tasks.
* **DispatchQueue** → Serial or concurrent queues. Example: `DispatchQueue.global().async {}`.
* **OperationQueue** → High-level abstraction on top of GCD, supports dependencies, priorities, cancelation.
* **async/await** → Modern Swift concurrency model. Makes async code look synchronous and easier to read.

---

