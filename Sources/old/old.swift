//
//  old.swift
//  concurrencybug
//
//  Created by Alex on 8/10/24.
//

// publicly non-sendable
public struct File {
    public let storage = ""
    
    public init() {}
    
    public func read() -> String {
        return storage
    }
}
