//
//  Helpers.swift
//  TextUtilities
//
//  Created by Michael Amiro on 11/02/2025.
//

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
