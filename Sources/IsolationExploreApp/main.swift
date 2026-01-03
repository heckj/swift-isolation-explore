import ArgumentParser
import IsolationExplore

@available(macOS 13.0, *)
@main
struct IsolationExploreApp: AsyncParsableCommand {
    func run() async throws {
        print("=== Swift Isolation Exploration ===\n")
        
        // Demonstrate basic isolation concepts
        await demonstrateIsolation()
        
        print("\n=== Actor Isolation Example ===")
        let counter = IsolatedCounter()
        
        // Multiple concurrent increments
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    await counter.increment()
                    print("Task \(i) incremented counter")
                }
            }
        }
        
        let finalCount = await counter.getCount()
        print("Final count: \(finalCount)")
        
        print("\n=== MainActor Isolation Example ===")
        let mainActorObj = MainActorIsolated()
        await mainActorObj.setValue("Exploring Swift Concurrency")
        let message = await mainActorObj.getValue()
        print("MainActor message: \(message)")
        
        print("\n=== Sendable Data Example ===")
        let data1 = SendableData(id: 1, name: "First")
        let data2 = SendableData(id: 2, name: "Second")
        
        await withTaskGroup(of: Void.self) { group in
            group.addTask {
                print("Task A: \(data1.name)")
            }
            group.addTask {
                print("Task B: \(data2.name)")
            }
        }
        
        print("\n=== Exploration Complete ===")
    }
}
