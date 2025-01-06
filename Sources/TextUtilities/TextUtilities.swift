// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

private let WHITESPACE: Character = " "
private let HYPHEN = "-"
private let UNDERSCORE = "_"

private typealias TextCaseCodable = TextCaseEncodable & TextCaseDecodable

// MARK: - TextCasing
/// A property wrapper that ensures a string is always Capitalized.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct Capitalized: TextCaseCodable {
    public var wrappedValue: String
    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        self.wrappedValue = localized ? wrappedValue.localizedCapitalized : wrappedValue.capitalized
    }
}

/// A property wrapper that ensures a string is always lowercased.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct Lowercased: TextCaseCodable {

    public var wrappedValue: String

    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        self.wrappedValue = localized ? wrappedValue.localizedLowercase : wrappedValue.lowercased()
    }
}

/// A property wrapper that ensures a string is always UPPERCASED.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct Uppercased: TextCaseCodable {
    public var wrappedValue: String

    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool) {
        self.wrappedValue = localized ? wrappedValue.localizedUppercase : wrappedValue.uppercased()
    }
}

/// A property wrapper that ensures a string is always TitleCased.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct TitleCase: TextCaseCodable {
    public var wrappedValue: String

    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).map { $0.capitalized }.joined(separator: String(WHITESPACE))
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).map { $0.capitalized }.joined(separator: String(WHITESPACE))
            
        }
    }
}

/// A property wrapper that ensures a string is always Sentence cased.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct SentenceCase: TextCaseCodable {
    public var wrappedValue: String

    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        self.wrappedValue = localized ? wrappedValue.lowercased().localizedCapitalized : wrappedValue.lowercased().capitalized
    }
}

/// A property wrapper that ensures a string is always camelCased.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).

@propertyWrapper
public struct CamelCase: TextCaseCodable {

    public var wrappedValue: String

    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).enumerated().map {
                if $0.offset > 0 {
                    return $0.element.localizedCapitalized
                }
                return String($0.element)
            }.joined()
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).enumerated().map {
                if $0.offset > 0 {
                    return $0.element.capitalized
                }
                return String($0.element)
            }.joined()
        }
    }
}

/// A property wrapper that ensures a string is always PascalCased.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct PascalCase: TextCaseCodable {

    public var wrappedValue: String

    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).map { $0.localizedCapitalized }.joined()
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).map { $0.capitalized }.joined()
        }
    }
}

// A property wrapper that ensures a string is always snake_cased.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct SnakeCase: TextCaseCodable {

    public var wrappedValue: String

    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.replacingOccurrences(of: String(WHITESPACE), with: UNDERSCORE)
        } else {
            self.wrappedValue = wrappedValue.lowercased().replacingOccurrences(of: String(WHITESPACE), with: UNDERSCORE)
        }
    }
}

// A property wrapper that ensures a string is always kebab-cased.
/// - Parameters:
///   - localized: Whether to apply a locale-sensitive transformation (default is `false`).
@propertyWrapper
public struct KebabCase: TextCaseCodable {
    public var wrappedValue: String
    /// Initializes the wrapper with an initial value and localization option.
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - localized: Whether to apply locale-sensitive uppercasing (default is `false`).
    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.replacingOccurrences(of: String(WHITESPACE), with: HYPHEN)
        } else {
            self.wrappedValue = wrappedValue.lowercased().replacingOccurrences(of: String(WHITESPACE), with: HYPHEN)
        }
    }
}

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
    public init(wrappedValue: String, target: any StringProtocol, replacement: any StringProtocol, count: Int = 0) {
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

protocol TextCaseDecodable: Decodable {
    init(wrappedValue: String, localized: Bool)
}

protocol TextCaseEncodable: Encodable {
    var wrappedValue: String { get set }
}

extension TextCaseEncodable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

extension TextCaseDecodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self.init(wrappedValue: value, localized: false)
    }
}
