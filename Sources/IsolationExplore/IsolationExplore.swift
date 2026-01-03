/// A simple actor for demonstrating actor isolation
@available(macOS 13.0, *)
public actor IsolatedCounter {
    private var count: Int = 0
    
    public init() {}
    
    /// Increment the counter (isolated to this actor)
    public func increment() {
        count += 1
    }
    
    /// Get the current count (isolated to this actor)
    public func getCount() -> Int {
        return count
    }
    
    /// Demonstrate nonisolated access
    nonisolated public func description() -> String {
        return "IsolatedCounter instance"
    }
}

/// A class demonstrating global actor isolation
@available(macOS 13.0, *)
@MainActor
public class MainActorIsolated {
    private var value: String = ""
    
    nonisolated public init() {}
    
    /// Set a value (isolated to MainActor)
    public func setValue(_ newValue: String) {
        value = newValue
    }
    
    /// Get the value (isolated to MainActor)
    public func getValue() -> String {
        return value
    }
}

/// A struct demonstrating Sendable conformance
public struct SendableData: Sendable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

/// Helper function to demonstrate isolation boundaries
@available(macOS 13.0, *)
public func demonstrateIsolation() async {
    let counter = IsolatedCounter()
    await counter.increment()
    let count = await counter.getCount()
    print("Counter value: \(count)")
    
    let mainActorObj = MainActorIsolated()
    await mainActorObj.setValue("Hello from MainActor")
    let value = await mainActorObj.getValue()
    print("MainActor value: \(value)")
    
    let data = SendableData(id: 1, name: "Example")
    print("Sendable data: \(data.name)")
}
