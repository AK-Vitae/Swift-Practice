# iOS Interview Prep

## AK: Structs vs Classes

| Aspect | Structs | Classes |
|--------|---------|---------|
| Type | Value type | Reference type |
| Analogy | Excel (each cell independent) | Google Sheets (shared document) |
| Memory allocation | Stack (unless part of a class) | Heap |
| Copying behavior | Deep copy (full copy of data) | Shallow copy (copy of reference) |
| Mutability | Requires `mutating` keyword for methods that modify self | Can modify properties freely |
| Inheritance | No inheritance | Supports inheritance |
| Initialization | Automatic memberwise initializer | No automatic memberwise initializer |
| Deinitializer | Not available | Available (`deinit`) |
| Performance | Generally more lightweight and faster | Slightly more overhead |
| Thread safety | Inherently thread-safe | Requires careful management for thread safety |
| Use cases | Small, self-contained data models | Complex objects, shared state, OOP patterns |
| Reference counting | No | Yes (ARC) |

## AK: Model

```swift
struct PostModel: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String?
    
    var likes: Int = Int.random(in: 0...100)
    
    var isPopular: Bool {
        return likes > 10
    }
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title, body
    }
    
    // When you need to map the names
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case title = "post_title"
        case body = "post_body"
    }
}

extension PostModel {
    static func samplePosts() -> [PostModel] {
        return [
            PostModel(id: 1, userId: 1, title: "Test", body: ""),
            PostModel(id: 2, userId: 2, title: "Test 2", body: ""),
            PostModel(id: 3, userId: 3, title: "Test 3", body: "body"),
            PostModel(id: 4, userId: 4, title: "Test 4", body: "body 2")
        ]
    }
}
```

## AK: Collections

### Arrays

Use **arrays** when order matters and you need index-based access.

```swift
let emptyArray1: [Int] = []
let emptyArray2 = [Int]()
var emptyArray3 = Array<String>()

let initialArray1 = [1, 2, 3, 4, 5]
let initialArray2 = ["Apple", "Banana", "Cherry"]
let initialArray3 = Array(1...5)
```

### Sets

Use **sets** for unique collections where order isn't important.

```swift
let emptySet1 = Set<Int>()
var emptySet2: Set<String> = []
let emptySet3 = Set<Double>()

let initialSet1: Set = [1, 2, 3, 4, 5]
let initialSet2: Set<String> = ["Red", "Green", "Blue"]
let initialSet3 = Set(["Dog", "Cat", "Bird"])
```

### Dictionaries

Use **dictionaries** when you need key-based lookup.

```swift
let emptyDict1: [String: Int] = [:]
var emptyDict2 = [Int: String]()
let emptyDict3 = Dictionary<String, Bool>()

let initialDict1 = ["name": "Alice", "age": 30]
let initialDict2 = [1: "One", 2: "Two", 3: "Three"]
let initialDict3: [String: [Int]] = ["evens": [2, 4, 6], "odds": [1, 3, 5]]
```

### Tuples

Use **tuples** for small, temporary groupings of related values.

```swift
let emptyTuple1 = ()
let emptyTuple2: Void = ()

let twoElementTuple = (42, "Hello")
let namedTuple = (x: 10, y: 20)
let mixedTuple: (Int, String, Double) = (1, "Two", 3.0)
let nestedTuple = (1, (2, 3), "Four")
```

## AK: Actors

* UI Updates: In SwiftUI (and UIKit), UI updates must occur on the main thread.
  * Attempting to update the UI from a background thread can lead to unpredictable behavior, crashes, or corrupted UI state.
  * Thread Safety: By marking methods with @MainActor, you ensure that those methods are executed on the main thread, providing thread safety for operations that require it.
* Cleaner Code: It simplifies the code by reducing the need for explicit thread dispatching using DispatchQueue.main.async.
* **Applying @MainActor to an Entire Class:** Ensures all operations within the class are executed on the main thread, simplifying thread management but potentially introducing unnecessary overhead.
* **Applying @MainActor to Specific Functions:** Provides granular control over main-thread execution, optimizing performance but requiring careful identification and marking of methods that need to run on the main thread.

## AK: High Order

### `map`

**Definition:** `map` transforms each element of a collection using a provided closure and returns a new collection containing the transformed elements.

```swift
let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map { $0 * $0 }
print(squaredNumbers) // [1, 4, 9, 16, 25]
```

### `reduce`

**Definition:** `reduce` combines all elements of a collection into a single value using a provided closure.

```swift
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0) { $0 + $1 }
print(sum) // 15
```

### `filter`

**Definition:** `filter` returns a new collection containing only the elements of the original collection that satisfy a given condition.

```swift
let numbers = [1, 2, 3, 4, 5]
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print(evenNumbers) // [2, 4]
```

### `sort`

**Definition:** `sort` sorts the elements of a collection according to a given closure.

```swift
let numbers = [5, 3, 1, 4, 2]
let sortedNumbers = numbers.sorted()
print(sortedNumbers) // [1, 2, 3, 4, 5]

let numbers = [5, 3, 1, 4, 2]
let sortedNumbersDescending = numbers.sorted(by: { $0 > $1 })
print(sortedNumbersDescending) // [5, 4, 3, 2, 1]

let numbers = [5, 3, 1, 4, 2]
let sortingOption: SortingOption = .ascending
let sortedNumbers = numbers.sorted { num1, num2 in
    switch sortingOption {
    case .ascending:
        return num1 < num2
    case .descending:
        return num1 > num2
    }
}

print(sortedNumbers) // [1, 2, 3, 4, 5]
```

### `compactMap`

**Definition:** `compactMap` returns a new collection containing the non-nil results of transforming each element using a provided closure.

```swift
let strings = ["1", "two", "3", "four", "5"]
let numbers = strings.compactMap { Int($0) }
print(numbers) // [1, 3, 5]
```

### `flatMap`

**Definition:** `flatMap` transforms each element of a collection using a provided closure and then flattens the result into a single collection.

```swift
let numbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let flattenedNumbers = numbers.flatMap { $0 }
print(flattenedNumbers) // [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

### Combining Multiple Higher-Order Functions

```swift
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

// Filter even numbers, square them, and sum the results
let result = numbers
    .filter { $0 % 2 == 0 }    // [2, 4, 6, 8]
    .map { $0 * $0 }           // [4, 16, 36, 64]
    .reduce(0) { $0 + $1 }     // 120

// Filter even numbers, square them, sort the results in descending order
let sortedResult = numbers
    .filter { $0 % 2 == 0 }     // [2, 4, 6, 8]
    .map { $0 * $0 }            // [4, 16, 36, 64]
    .sorted(by: >)              // [64, 36, 16, 4]

// Filter numbers greater than 5, map to their string representation, compact map to ensure no nil values
let stringResult = numbers
    .filter { $0 > 5 }                  // [6, 7, 8, 9]
    .map { "\($0)" }                    // ["6", "7", "8", "9"]
    .compactMap { Int($0) }             // [6, 7, 8, 9]
```

## AK: StateObject

**`@StateObject`**:

* Used to create and own a reference type (an observable object) within a SwiftUI view.
* The view will watch this object for changes and redraw when the object changes.
* Typically used when creating a new instance of an observable object.

**`@ObservedObject`**:

* Used to observe an observable object that is created elsewhere.
* The view will watch this object for changes and redraw when the object changes.
* Typically used when passing an observable object down the view hierarchy.

**`@State`**:

* Used to declare a value type that is owned by a view.
* The view will watch this value for changes and redraw when the value changes.
* Typically used for simple properties like booleans, integers, strings, etc.
  
```swift
@State private var count = 0
```

**`@Binding`**

* Creates a two-way connection between a property that stores data and a view that displays and changes the data.
* It allows child views to read and write a value owned by a parent view.

```swift
struct ParentView: View {
    @State private var name: String = ""

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)

            ChildView(name: $name)
        }
    }
}

struct ChildView: View {
    @Binding var name: String

    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            
            TextField("Change name", text: $name)
        }
    }
}
```

When you change the text in either the parent or the child view's TextField, the name property is updated, and the changes are reflected in both views.

**`ObservableObject`**:

* A protocol for reference types that can be observed by SwiftUI views.
* Typically used for view models and other shared data sources.
* Contains `@Published` properties that notify subscribers when they change.

**`@EnvironmentObject`**:

* A property wrapper that allows a view to access an observable object from the environment.
* Used to share data across many views without passing it explicitly.
  
```swift

struct ParentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        ChildView().environmentObject(viewModel)
    }
}

struct ChildView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        // View Body
    }
}
```

**`Environment`**:

* A property wrapper that provides access to values stored in the environment, such as system settings or custom values.
* Used to access system-provided values like `colorScheme`, `locale`, `sizeCategory`, etc.

```swift
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Text("Current color scheme: \(colorScheme == .dark ? "Dark" : "Light")")
    }
}
```

**`@Published`**:

* A property wrapper used in an `ObservableObject` to mark properties that should trigger view updates when they change.
* Properties marked with `@Published` will notify all subscribers of changes.

**Example:**

```swift
class ViewModel: ObservableObject {
    @Published var count = 0
}
```

## AK: Local Storage Options

* UserDefaults:
  * Definition: A simple key-value storage provided by iOS.
  * Use Cases: Small, simple, non-sensitive user preferences and app settings.
* Keychain:
  * Definition: A secure storage solution provided by iOS for storing sensitive information.
  * Use Cases: Sensitive information like passwords, tokens, and private keys.
* File System:
  * Definition: Direct access to the device’s file system, typically using the FileManager class
  * Use Cases: Larger files, user-generated content, and cache data.
* Core Data:
  * Definition: A powerful object graph and persistence framework provided by iOS.
  * Use Cases: Complex data models, relationships, and offline-first data synchronization.
* SQLite:
  * Definition: A lightweight, disk-based database that doesn’t require a separate server process.
  * Use Cases: Lightweight relational database needs with structured data and SQL querying.
* GRDB:
  * Definition: A toolkit for SQLite databases, written in Swift, which provides a thin Swift-friendly wrapper over SQLite and additional features.
  * Use Cases: Applications needing powerful SQL capabilities with a lightweight Swift wrapper, high-performance data processing, and straightforward migrations.
* Realm:
  * Definition: A mobile database that is designed for simplicity, speed, and ease of use, supporting complex data structures and relationships.
  * Use Cases: Real-time applications with live objects, applications requiring easy and fast data storage and retrieval, and those needing offline-first capabilities with automatic data syncing.

## AK: View/ViewModifier Extensions

```swift
extension View {
    func customTextStyle() -> some View {
        self
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}

struct RoundedBorder: ViewModifier {
    var color: Color
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: width)
            )
    }
}

extension View {
    func roundedBorder(color: Color, width: CGFloat) -> some View {
        self.modifier(RoundedBorder(color: color, width: width))
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .customTextStyle()
            .roundedBorder(color: .red, width: 2)
    }
}
```

### AK: Enums and Switches

```swift
enum Direction {
    case north
    case south
    case east
    case west
}

switch direction {
case .north:
    print("Heading North")
case .south:
    print("Heading South")
case .east:
    print("Heading East")
case .west:
    print("Heading West")
}
```

## AK: Strong, Weak, Lazy, and Unowned References

**Strong Reference:**
A strong reference is the default type of reference in Swift. It keeps a strong hold on the object, preventing it from being deallocated.

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var person1: Person? = Person(name: "John")
var person2 = person1 // person2 is also a strong reference to the same Person instance
```

**Weak Reference:**
A weak reference does not keep a strong hold on the object, allowing it to be deallocated if there are no other strong references.

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    weak var tenant: Person?
}

var person: Person? = Person(name: "John")
var apartment = Apartment()
apartment.tenant = person

person = nil // The Person instance can now be deallocated
```

**Unowned Reference:**
An unowned reference is similar to a weak reference but is used when the reference is expected to always have a value during its lifetime.

**Example:**

```swift
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    unowned var tenant: Person
    init(tenant: Person) {
        self.tenant = tenant
    }
}

let person = Person(name: "John")
let apartment = Apartment(tenant: person)
```

**Lazy Reference:**
A lazy reference is a property that is only initialized when it is first accessed.

**Example:**

```swift
class DataLoader {
    lazy var data: [String] = {
        return loadData()
    }()
    
    func loadData() -> [String] {
        // Load data from a source
        return ["Data1", "Data2", "Data3"]
    }
}

let loader = DataLoader()
// The loadData() method is called the first time the data property is accessed
print(loader.data)
```

## AK: Access Control: `private`, `fileprivate`, `public`

**`private`:**
Restricts the use of an entity to its own defining scope.

**`fileprivate`:**
Restricts the use of an entity to its own defining source file.

**`public`:**
Allows the use of an entity from any source file within the same module or from another module that imports the defining module.

## AK: `UIHostingController`

**Definition:**
A `UIHostingController` is a view controller that manages a SwiftUI view hierarchy. It allows you to integrate SwiftUI views into a UIKit-based app.

```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            .padding()
    }
}

let hostingController = UIHostingController(rootView: ContentView())
present(hostingController, animated: true)
```

## AK: `UIViewRepresentable`

**Definition:**
`UIViewRepresentable` is a protocol that you can use to wrap a UIKit view and make it available in SwiftUI.

```swift
struct MyTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: MyTextField

        init(parent: MyTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }

    @Binding var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}

struct ContentView: View {
    @State private var text = ""

    var body: some View {
        MyTextField(text: $text)
            .padding()
    }
}
```

## AK: Loops

**`for-in` Loop:**
Iterates over sequences like arrays, ranges, strings.

```swift
let numbers = [1, 2, 3, 4, 5]
for number in numbers {
    print(number)
}
// Output:
// 1
// 2
// 3
// 4
// 5
```

**`while` Loop:**
Executes as long as the condition is true.

```swift
var count = 0
while count < 5 {
    print(count)
    count += 1
}
// Output:
// 0
// 1
// 2
// 3
// 4
```

**`forEach` Loop:**

```swift
let numbers = [1, 2, 3, 4, 5]
numbers.forEach { number in
    print(number)
}
// Output:
// 1
// 2
// 3
// 4
// 5
```

**Labeled Statements with Loops:**
Used for controlling nested loops.

```swift
outerLoop: for i in 1...3 {
    for j in 1...3 {
        if j == 2 {
            continue outerLoop
        }
        print("i: \(i), j: \(j)")
    }
}
// Output:
// i: 1, j: 1
// i: 2, j: 1
// i: 3, j: 1
```

**Loop Control Statements (`break`, `continue`):**

* `break`: Exits the loop.
* `continue`: Skips the current iteration.

```swift
for i in 1...5 {
    if i == 3 {
        break
    }
    print(i)
}
// Output:
// 1
// 2
for i in 1...5 {
    if i == 3 {
        continue
    }
    print(i)
}
// Output:
// 1
// 2
// 4
// 5
```

## AK: Optionals

**`if let`**

```swift
if let name = optionalName {
    // Code
} else {
    // Code
}
```

**`guard let`**

```swift
func greet(user: User?) {
    guard let user = user else {
        print("User data is unavailable.")
        return
    }
    
    print("Hello, \(user.name)!")
}
```

**Multiple Optionals with `if let`**

```swift
if let user = user, let email = user.email, let website = user.website {
    // Code
} else {
    // Code
}
```

**Multiple Optionals with `guard let`**

```swift
func printUserDetails(user: User?) {
    guard let user = user, let email = user.email, let website = user.website else { return }
    print("Name: \(user.name), Email: \(email), Website: \(website)")
}
```

Optional Chaining

```swift
let city = user.address?.city
```

**Nil Coalescing Operator (`??`)**

```swift
let greeting = optionalGreeting ?? "Hello, World!"
```

### 1. Performing a Task Asynchronously

FORMAT THIS

#### GCD Approach

```swift
import Foundation

func fetchDataGCD() {
    DispatchQueue.global(qos: .background).async {
        let data = performNetworkCall()
        DispatchQueue.main.async {
            print("Data fetched: \(data)")
        }
    }
}

func performNetworkCall() -> String {
    Thread.sleep(forTimeInterval: 2)
    return "Fetched data from network"
}
```

#### Async/Await Approach

```swift
import Foundation

func fetchDataAsyncAwait() async {
    let data = await performNetworkCallAsync()
    print("Data fetched: \(data)")
}

func performNetworkCallAsync() async -> String {
    // Simulate network delay using Task.sleep
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    return "Fetched data from network"
}

// Usage
Task {
    await fetchDataAsyncAwait()
}
```

### 2. Delaying a Task

#### GCD Approach

```swift
import Foundation

func delayedTaskGCD() {
    let delay = DispatchTime.now() + 2.0
    DispatchQueue.main.asyncAfter(deadline: delay) {
        print("Task executed after 2 seconds delay")
    }
}
```

#### Async/Await Approach

```swift
import Foundation

func delayedTaskAsyncAwait() async {
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    print("Task executed after 2 seconds delay")
}

// Usage
Task {
    await delayedTaskAsyncAwait()
}
```

### 3. Using Dispatch Groups

#### GCD Approach

```swift
import Foundation

func performTasksInGroupGCD() {
    let dispatchGroup = DispatchGroup()

    DispatchQueue.global().async(group: dispatchGroup) {
        performTask1()
    }

    DispatchQueue.global().async(group: dispatchGroup) {
        performTask2()
    }

    dispatchGroup.notify(queue: .main) {
        print("Both tasks completed")
    }
}

func performTask1() {
    print("Task 1 started")
    Thread.sleep(forTimeInterval: 1)
    print("Task 1 completed")
}

func performTask2() {
    print("Task 2 started")
    Thread.sleep(forTimeInterval: 2)
    print("Task 2 completed")
}
```

#### Async/Await Approach

```swift
import Foundation

func performTasksInGroupAsyncAwait() async {
    async let task1 = performTask1Async()
    async let task2 = performTask2Async()
    
    // Await all tasks to complete
    await task1
    await task2
    print("Both tasks completed")
}

func performTask1Async() async {
    print("Task 1 started")
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    print("Task 1 completed")
}

func performTask2Async() async {
    print("Task 2 started")
    try? await Task.sleep(nanoseconds: 2_000_000_000)
    print("Task 2 completed")
}

// Usage
Task {
    await performTasksInGroupAsyncAwait()
}
```

### 4. Synchronous Execution

#### GCD Approach

```swift
import Foundation

func performSynchronousTaskGCD() {
    let backgroundQueue = DispatchQueue(label: "com.example.syncQueue")
    backgroundQueue.sync {
        print("Performing a synchronous task")
        Thread.sleep(forTimeInterval: 1)
    }
    print("Synchronous task completed")
}
```

#### Async/Await Approach

In async/await, performing truly synchronous work is not the main goal. However, if you want to simulate blocking until an async task is done (for example, in a command line tool or test), you can do this using `Task`:

```swift
import Foundation

func performSynchronousTaskAsyncAwait() async {
    print("Performing a synchronous-like task")
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    print("Synchronous-like task completed")
}

// Usage
Task {
    await performSynchronousTaskAsyncAwait()
}
```

### 5. Serial Queues

#### GCD Approach

```swift
import Foundation

func performSerialTasksGCD() {
    let serialQueue = DispatchQueue(label: "com.example.serialQueue")

    serialQueue.async {
        print("Task 1 started")
        Thread.sleep(forTimeInterval: 1)
        print("Task 1 completed")
    }

    serialQueue.async {
        print("Task 2 started")
        Thread.sleep(forTimeInterval: 1)
        print("Task 2 completed")
    }
}
```

#### Async/Await Approach

For async/await, tasks run sequentially when called within a single function because `await` waits for the task to complete before continuing.

```swift
import Foundation

func performSerialTasksAsyncAwait() async {
    print("Task 1 started")
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    print("Task 1 completed")

    print("Task 2 started")
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    print("Task 2 completed")
}

// Usage
Task {
    await performSerialTasksAsyncAwait()
}
```

### 6. Concurrent Queues

#### GCD Approach

```swift
import Foundation

func performConcurrentTasksGCD() {
    let concurrentQueue = DispatchQueue.global(qos: .userInitiated)

    concurrentQueue.async {
        print("Task 1 started")
        Thread.sleep(forTimeInterval: 1)
        print("Task 1 completed")
    }

    concurrentQueue.async {
        print("Task 2 started")
        Thread.sleep(forTimeInterval: 1)
        print("Task 2 completed")
    }
}
```

#### Async/Await Approach

Using `async let` allows tasks to run concurrently and wait for all of them to complete.

```swift
import Foundation

func performConcurrentTasksAsyncAwait() async {
    async let task1 = performTask1Async()
    async let task2 = performTask2Async()
    
    await (task1, task2)
    print("Both concurrent tasks completed")
}

// Usage
Task {
    await performConcurrentTasksAsyncAwait()
}
```

### Summary

The `async/await` syntax simplifies asynchronous code, making it more readable and maintainable compared to GCD. While GCD requires explicit queue management and can lead to callback hell, `async/await` allows you to write asynchronous code in a synchronous style, leading to better clarity and easier debugging. By transitioning to `async/await`, developers can take full advantage of Swift's modern concurrency model.