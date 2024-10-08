// The Swift Programming Language
// https://docs.swift.org/swift-book

@preconcurrency import old

//class File {
//    func read() -> String { "" }
//}

func someFunction(
    files: [File]
) async throws {
    await withTaskGroup(of: Void.self) { group in
        for file in files {
            group.addTask {
                let c = file.read()
                print(c)
            }
        }
    }
}

func someFunctionWorkaround(
    files: [File]
) async throws {
    let workaroundAddTask: (
        _ file: sending File,
        _ group: inout TaskGroup<Void>
    ) -> Void = { file, group in
        group.addTask {
            let c = file.read()
            print(c)
        }
    }
    
    await withTaskGroup(of: Void.self) { group in
//        for i in files.indices {
//            workaroundAddTask(files[i], &group)
//        }
        for file in files {
            workaroundAddTask(file, &group)
        }
    }
}
