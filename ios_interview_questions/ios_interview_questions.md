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

## iOS Fundamentals

Perfect 👌 Here are **short, crisp interview-style answers** for iOS Fundamentals:

---

### **1. App Lifecycle (UIKit & SwiftUI differences)**

* **UIKit (AppDelegate + SceneDelegate):**

  * `didFinishLaunching` → App started.
  * `sceneDidBecomeActive` → App is active.
  * `sceneWillResignActive` → Moving to inactive.
  * `sceneDidEnterBackground` → App in background.
* **SwiftUI:**

  * No AppDelegate by default. Uses `@main` with `App` protocol.
  * Lifecycle managed by `Scene` → `WindowGroup`.
  * App state changes can be tracked using `@Environment(\.scenePhase)`.

---

### **2. ViewController Lifecycle**

1. `init(coder:) / loadView()` – Load view.
2. `viewDidLoad()` – Called once, good for setup.
3. `viewWillAppear()` – Before appearing on screen.
4. `viewDidAppear()` – Fully visible.
5. `viewWillDisappear()` – Before leaving screen.
6. `viewDidDisappear()` – Fully off screen.
7. `deinit` – Cleanup memory.

---

### **3. Storyboard vs Programmatic UI vs SwiftUI**

* **Storyboard:** Drag-and-drop UI. Easy to start, but harder to maintain in large teams.
* **Programmatic UI:** Full control via code. More flexible, better for version control.
* **SwiftUI:** Declarative syntax. UI updates automatically when state changes. Faster to prototype and reactive.

---

### **4. Target-Action, Delegates, Notifications, KVO**

* **Target-Action:** One-to-one. Example: button tap → method call.
* **Delegates:** One-to-one. Custom protocol where one object delegates responsibility to another.
* **Notifications:** One-to-many. Broadcast message via `NotificationCenter`.
* **KVO (Key-Value Observing):** Observes property changes on objects. (Mostly replaced by Combine/SwiftUI).

---

### **5. AutoLayout & Constraints**

* AutoLayout is Apple’s system to create responsive UI across devices.
* Defines relationships between views using **constraints** (leading, trailing, top, bottom, height, width).
* Can be applied via Storyboard, programmatically (`NSLayoutConstraint`), or with libraries like SnapKit.

---

### **6. App States (Active, Background, Suspended)**

* **Not Running** → App not launched or terminated.
* **Inactive** → Running but not receiving events (like during phone call).
* **Active** → Foreground, receiving events.
* **Background** → Running tasks in background (e.g. location, music).
* **Suspended** → In memory, no code execution. Quickly resumes to Active.

---

##  Memory & Performance in iOS

Great 👍 Here are **interview-ready answers** for **Memory & Performance in iOS**:

---

### **1. Strong Reference Cycles & Memory Leaks**

* **Strong Reference Cycle:** Happens when two objects hold strong references to each other, preventing ARC from deallocating them.
  Example:

  * A `ViewController` strongly references a closure.
  * Closure also strongly references `self`.
* **Fix:** Use `[weak self]` or `[unowned self]` in closures, and `weak` for delegates.
* **Memory Leak:** When objects never get released → app memory keeps growing → crash risk.

---

### **2. Instruments Usage (Leaks, Time Profiler)**

* **Leaks Instrument:** Detects memory leaks, strong reference cycles. Helps find objects that stay in memory unexpectedly.
* **Allocations:** Shows memory usage over time.
* **Time Profiler:** Profiles CPU usage, identifies performance bottlenecks (e.g. heavy loops, blocking main thread).
* Usage: Run app with Instruments → select tool → analyze memory/cpu traces → fix bottlenecks.

---

### **3. Lazy Loading & Caching**

* **Lazy Loading:** Load resources only when needed. Reduces initial memory usage. Example:

  ```swift
  lazy var image = UIImage(named: "photo")
  ```
* **Caching:** Store already loaded data to reuse later (e.g. `NSCache`, image cache in `URLSession` or `Kingfisher`). Prevents repeated network/database calls.
* Together → Improve memory + performance.

---

### **4. Optimizing Scrolling Performance (UITableView / UICollectionView)**

* **Cell Reuse:** Use `dequeueReusableCell` to recycle cells instead of creating new ones.
* **Asynchronous Work:** Offload heavy tasks (image loading, JSON parsing) to background queues.
* **Batch Updates & Pagination:** Load data in chunks.
* **Image Optimization:** Use caching, downscale images before rendering.
* **Avoid AutoLayout Overhead:** Minimize deep view hierarchies, prefer stack views/constraints wisely.
* **Pre-fetching:** Use `UITableViewDataSourcePrefetching` to prepare data before it appears.

---



