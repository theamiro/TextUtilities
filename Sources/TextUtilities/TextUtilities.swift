// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

private let WHITESPACE: Character = " "
private let HYPHEN = "-"
private let UNDERSCORE = "_"

// MARK: - TextCasing
@propertyWrapper
public struct Capitalized {
    private let localized: Bool
    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.localizedCapitalized : wrappedValue.capitalized
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        self.wrappedValue = localized ? wrappedValue.localizedCapitalized : wrappedValue.capitalized
        self.localized = localized
    }
}

@propertyWrapper
public struct Lowercased {
    private let localized: Bool

    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.localizedLowercase : wrappedValue.lowercased()
        }
    }
    
    public init(wrappedValue: String, localized: Bool = false) {
        self.wrappedValue = localized ? wrappedValue.localizedLowercase : wrappedValue.lowercased()
        self.localized = localized
    }
}

@propertyWrapper
public struct Uppercased {
    private let localized: Bool

    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.localizedUppercase : wrappedValue.uppercased()
        }
    }

    public init(wrappedValue: String, localized: Bool) {
        self.wrappedValue = localized ? wrappedValue.localizedUppercase : wrappedValue.uppercased()
        self.localized = localized
    }
}

@propertyWrapper
public struct TitleCase {
    private let localized: Bool
    public var wrappedValue: String {
        didSet {
            if localized {
                wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).map { $0.capitalized }.joined(separator: String(WHITESPACE))
            } else {
                wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).map { $0.capitalized }.joined(separator: String(WHITESPACE))
            }
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).map { $0.capitalized }.joined(separator: String(WHITESPACE))
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).map { $0.capitalized }.joined(separator: String(WHITESPACE))
            
        }
        self.localized = localized
    }
}

@propertyWrapper
public struct SentenceCase {
    private let localized: Bool
    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.lowercased().localizedCapitalized : wrappedValue.lowercased().capitalized
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        self.wrappedValue = localized ? wrappedValue.lowercased().localizedCapitalized : wrappedValue.lowercased().capitalized
        self.localized = localized
    }
}

@propertyWrapper
public struct CamelCase {
    private let localized: Bool

    public var wrappedValue: String {
        didSet {
            if localized {
                wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).enumerated().map {
                    if $0.offset > 0 {
                        return $0.element.localizedCapitalized
                    }
                    return String($0.element)
                }.joined()
            } else {
                wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).enumerated().map {
                    if $0.offset > 0 {
                        return $0.element.capitalized
                    }
                    return String($0.element)
                }.joined()
            }
        }
    }

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
        self.localized = localized
    }
}

@propertyWrapper
public struct PascalCase {
    private let localized: Bool

    public var wrappedValue: String {
        didSet {
            if localized {
                wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).map { $0.localizedCapitalized }.joined()
            } else {
                wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).map { $0.capitalized }.joined()
            }
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: WHITESPACE).map { $0.localizedCapitalized }.joined()
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: WHITESPACE).map { $0.capitalized }.joined()
        }
        self.localized = localized
    }
}

@propertyWrapper
public struct SnakeCase {
    private let localized: Bool
    
    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.localizedLowercase.replacingOccurrences(of: String(WHITESPACE), with: UNDERSCORE) : wrappedValue.lowercased().replacingOccurrences(of: String(WHITESPACE), with: UNDERSCORE)
        }
    }
    
    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.replacingOccurrences(of: String(WHITESPACE), with: UNDERSCORE)
        } else {
            self.wrappedValue = wrappedValue.lowercased().replacingOccurrences(of: String(WHITESPACE), with: UNDERSCORE)
        }
        self.localized = localized
    }
}

@propertyWrapper
public struct KebabCase {
    private let localized: Bool

    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.localizedLowercase.replacingOccurrences(of: String(WHITESPACE), with: HYPHEN) : wrappedValue.lowercased().replacingOccurrences(of: String(WHITESPACE), with: HYPHEN)
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.replacingOccurrences(of: String(WHITESPACE), with: HYPHEN)
        } else {
            self.wrappedValue = wrappedValue.lowercased().replacingOccurrences(of: String(WHITESPACE), with: HYPHEN)
        }
        self.localized = localized
    }
}
