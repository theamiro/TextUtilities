// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import CryptoKit

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

// MARK: - Text Transformation

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

/// A property wrapper that truncates a string to a specified length with an optional ellipsis.
///
/// The `Truncate` property wrapper allows you to limit the length of a string, optionally appending an ellipsis (`"..."`) if the truncation occurs.
///
/// ## Usage Example:
/// ```swift
/// struct Article {
///     @Truncate(length: 50) var summary: String
/// }
///
/// let article = Article(summary: "This is a very long text that should be truncated to fit a certain display size.")
/// print(article.summary)
/// // Output: "This is a very long text that should be truncate..."
/// ```
///
/// ## Notes:
/// - The default truncation length is 200 characters.
/// - The default behavior is to append `"..."` if the string is truncated.
/// - If the provided string is shorter than the truncation length, it remains unchanged.
///
/// ## Parameters:
/// - `wrappedValue`: The original string value to be truncated.
/// - `length`: The maximum length of the string (default is `200`).
/// - `showEllipsis`: Whether to append an ellipsis (`"..."`) if truncation occurs (default is `true`).
///
/// ## Limitations:
/// - Truncation occurs at the character level; it doesn't handle word-bound truncation.
@propertyWrapper
public struct Truncate {
    /// The maximum length to which the string should be truncated.
    private var length: Int

    /// A flag indicating whether an ellipsis should be shown if truncation occurs.
    private var showEllipsis: Bool

    /// The truncated or original string value.
    public var wrappedValue: String
    /// Initializes the `Truncate` property wrapper.
    ///
    /// - Parameters:
    ///   - wrappedValue: The original string to be truncated.
    ///   - length: The maximum length of the truncated string (default is `200`).
    ///   - showEllipsis: Whether to append `"..."` if truncation occurs (default is `true`).
    public init(wrappedValue: String, length: Int = 200, showEllipsis: Bool = true) {
        self.wrappedValue = "\(wrappedValue.prefix(length))\(showEllipsis ? "..." : "")"
        self.length = length
        self.showEllipsis = showEllipsis
    }
}

/// A property wrapper that trims leading and trailing characters from a string using a specified character set.
///
/// The `TrimCharacters` property wrapper helps clean up string values by removing undesired characters
/// (such as whitespace, punctuation, or custom characters) from both the beginning and the end of the string.
///
/// ## Usage Example:
/// ```swift
/// struct UserInput {
///     @TrimCharacters(in: .whitespacesAndNewlines) var text: String
/// }
///
/// var input = UserInput(text: "  Hello, World!  ")
/// print(input.text)  // Output: "Hello, World!"
/// ```
///
/// ## Parameters:
/// - `wrappedValue`: The initial string value to be trimmed.
/// - `characterSet`: The set of characters to trim (default is `CharacterSet.whitespaces`).
///
/// ## Notes:
/// - The default character set trims whitespace only.
/// - You can use standard `CharacterSet` values like `.punctuationCharacters`, `.symbols`, or `.letters` for custom trimming.
///
/// ## Example with Custom Character Set:
/// ```swift
/// struct CustomTrim {
///     @TrimCharacters(in: .punctuationCharacters) var message: String
/// }
///
/// var custom = CustomTrim(message: "...Hello World!!!")
/// print(custom.message)  // Output: "Hello World"
/// ```
@propertyWrapper
public struct TrimCharacters {
    /// The set of characters to trim from the string.
    var characterSet: CharacterSet

    /// The trimmed string value.
    public var wrappedValue: String

    /// Initializes the property wrapper with a string value and character set for trimming.
    ///
    /// - Parameters:
    ///   - wrappedValue: The initial string value.
    ///   - characterSet: The set of characters to trim (default is `.whitespaces`).
    public init(wrappedValue: String, in characterSet: CharacterSet = .whitespaces) {
        self.characterSet = characterSet
        self.wrappedValue = wrappedValue.trimmingCharacters(in: characterSet)
    }
}

/// A property wrapper that automatically reverses the text of a `String` value when assigned or decoded.
///
/// You can use `@TextReversal` on any `String` property to reverse the order of its characters.
/// This property wrapper also conforms to `Decodable`, allowing it to be used with `Codable` models.
///
/// ## Usage Example:
/// ```swift
/// struct Message: Decodable {
///     @TextReversal var text: String
/// }
///
/// let jsonData = #"{ "text": "hello" }"#.data(using: .utf8)!
/// let decoder = JSONDecoder()
/// if let message = try? decoder.decode(Message.self, from: jsonData) {
///     print(message.text) // Output: "olleh"
/// }
/// ```
///
/// ## Notes:
/// - The `wrappedValue` stores the reversed text.
/// - When decoding from a JSON string, the text will also be automatically reversed.
@propertyWrapper
public struct TextReversal: Decodable {
    /// The reversed string value managed by this property wrapper.
    public var wrappedValue: String

    /// Creates a new instance by reversing the given string value.
    ///
    /// - Parameter wrappedValue: The original string value to be reversed.
    public init(wrappedValue: String) {
        self.wrappedValue = String(wrappedValue.reversed())
    }

    /// Decodes a `String` value from the given decoder and automatically reverses it.
    ///
    /// - Parameter decoder: The decoder to read the data from.
    /// - Throws: An error if the decoding process fails.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.wrappedValue = try String(container.decode(String.self).reversed())
    }
}

/// A property wrapper that automatically hashes a `String` value using SHA-256.
///
/// The `SHA256Hash` property wrapper allows you to securely hash string values at initialization or during decoding.
/// The computed hash is stored as the `wrappedValue`.
///
/// ## Usage Example:
/// ```swift
/// struct User: Decodable {
///     @SHA256Hash var password: String
/// }
///
/// let jsonData = #"{ "password": "my_secret_password" }"#.data(using: .utf8)!
/// let decoder = JSONDecoder()
/// if let user = try? decoder.decode(User.self, from: jsonData) {
///     print(user.password) // Output: "SHA-256 hash of the original password"
/// }
/// ```
///
/// ## Notes:
/// - This property wrapper uses Apple's `CryptoKit` for hashing, so it requires iOS 13.0+, macOS 10.15+, and similar platform requirements.
/// - The output hash is in hexadecimal format.
///
/// ## Platform Requirements:
/// Available on macOS 10.15 and later.
@available(macOS 10.15, *)
@propertyWrapper
public struct SHA256Hash: Decodable {
    /// The hashed string value computed using SHA-256.
    public var wrappedValue: String

    /// Initializes a new instance with a SHA-256 hashed value of the provided string.
    ///
    /// - Parameter wrappedValue: The original string to be hashed.
    public init(wrappedValue: String) {
        self.wrappedValue = SHA256.hash(data: Data(wrappedValue.utf8)).compactMap({ String(format: "%02hhx", $0) }).joined()
    }

    /// Decodes a `String` value from the given decoder and hashes it using SHA-256.
    ///
    /// - Parameter decoder: The decoder to read the string data from.
    /// - Throws: An error if the decoding process fails.
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.wrappedValue = try SHA256.hash(data: Data(container.decode(String.self).utf8)).compactMap({ String(format: "%02hhx", $0) }).joined()
    }
}
