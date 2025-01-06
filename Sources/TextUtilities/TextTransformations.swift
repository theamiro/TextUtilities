//
//  Transformations.swift
//  TextUtilities
//
//  Created by Michael Amiro on 06/01/2025.
//

import Foundation

/// A property wrapper that replaces occurrences of a target substring or character with a specified replacement in a string.
///
/// The wrapper supports replacing all occurrences or limiting replacements to a specific count.
///
/// Usage:
/// ```swift
/// struct Example {
///     @ReplacingOccurrences(target: "hello", replacement: "hi")
///     var message: String
/// }
///
/// var example = Example(message: "hello world, hello Swift!")
/// print(example.message) // Output: "hi world, hi Swift!"
/// ```
///
/// - Parameters:
///   - wrappedValue: The original string value.
///   - target: The substring or character to replace. Must conform to `StringProtocol`.
///   - replacement: The substring or character to use as the replacement. Must conform to `StringProtocol`.
///   - count: The maximum number of replacements to perform. Defaults to `0` (replaces all occurrences).
///
/// - Behavior:
///   - If `count > 0`: Replaces up to `count` occurrences of the target with the replacement.
///   - If `count == 0`: Replaces all occurrences of the target with the replacement.

@propertyWrapper
public struct ReplacingOccurences {
    private var target: any StringProtocol
    private var replacement: any StringProtocol
    private var count: Int

    public var wrappedValue: String

    /// Initializes a new `ReplacingOccurrences` property wrapper.
    ///
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - target: The substring or character to replace.
    ///   - replacement: The substring or character to use as the replacement.
    ///   - count: The maximum number of replacements to perform. Defaults to `0` (replaces all occurrences).
    init(wrappedValue: String, target: any StringProtocol, replacement: any StringProtocol, count: Int = 0) {
        self.target = target
        self.replacement = replacement
        self.count = count
        if count > 0 {
            var internalCount = 0
            self.wrappedValue = wrappedValue.map { character in
                if internalCount < count, character.lowercased() == target.lowercased() {
                    internalCount += 1
                    return String(replacement)
                } else {
                    return String(character)
                }
            }.joined()
        } else {
            self.wrappedValue = wrappedValue.replacingOccurrences(of: target, with: replacement)
        }
    }
}
