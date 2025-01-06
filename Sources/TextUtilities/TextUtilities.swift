// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

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
                wrappedValue = wrappedValue.localizedLowercase.split(separator: " ").map { $0.capitalized }.joined(separator: " ")
            } else {
                wrappedValue = wrappedValue.lowercased().split(separator: " ").map { $0.capitalized }.joined(separator: " ")
                
            }
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: " ").map { $0.capitalized }.joined(separator: " ")
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: " ").map { $0.capitalized }.joined(separator: " ")
            
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
                wrappedValue = wrappedValue.localizedLowercase.split(separator: " ").enumerated().map {
                    if $0.offset > 0 {
                        return $0.element.localizedCapitalized
                    }
                    return String($0.element)
                }.joined()
            } else {
                wrappedValue = wrappedValue.lowercased().split(separator: " ").enumerated().map {
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
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: " ").enumerated().map {
                if $0.offset > 0 {
                    return $0.element.localizedCapitalized
                }
                return String($0.element)
            }.joined()
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: " ").enumerated().map {
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
                wrappedValue = wrappedValue.localizedLowercase.split(separator: " ").map { $0.localizedCapitalized }.joined()
            } else {
                wrappedValue = wrappedValue.lowercased().split(separator: " ").map { $0.capitalized }.joined()
            }
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.split(separator: " ").map { $0.localizedCapitalized }.joined()
        } else {
            self.wrappedValue = wrappedValue.lowercased().split(separator: " ").map { $0.capitalized }.joined()
        }
        self.localized = localized
    }
}

@propertyWrapper
public struct SnakeCase {
    private let localized: Bool
    
    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.localizedLowercase.replacingOccurrences(of: " ", with: "_") : wrappedValue.lowercased().replacingOccurrences(of: " ", with: "_")
        }
    }
    
    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.replacingOccurrences(of: " ", with: "_")
        } else {
            self.wrappedValue = wrappedValue.lowercased().replacingOccurrences(of: " ", with: "_")
        }
        self.localized = localized
    }
}

@propertyWrapper
public struct KebabCase {
    private let localized: Bool

    public var wrappedValue: String {
        didSet {
            wrappedValue = localized ? wrappedValue.localizedLowercase.replacingOccurrences(of: " ", with: "-") : wrappedValue.lowercased().replacingOccurrences(of: " ", with: "-")
        }
    }

    public init(wrappedValue: String, localized: Bool = false) {
        if localized {
            self.wrappedValue = wrappedValue.localizedLowercase.replacingOccurrences(of: " ", with: "-")
        } else {
            self.wrappedValue = wrappedValue.lowercased().replacingOccurrences(of: " ", with: "-")
        }
        self.localized = localized
    }
}
