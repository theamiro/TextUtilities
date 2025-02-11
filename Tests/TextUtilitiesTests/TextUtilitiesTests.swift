import XCTest
@testable import TextUtilities

final class TextUtilitiesTests: XCTestCase {
    @Capitalized private var firstName = "john"
    @Lowercased private var lastName = "DOE"
    @TitleCase private var title = "welcome JOHN DOe"
    @SentenceCase private var sentence = "thE qUiCk BrOwN fOx jUmPs OvEr ThE lAzY dOg"
    @CamelCase private var camel = "Property Wrappers"
    @SnakeCase private var snake = "thE qUiCk BrOwN fOx jUmPs OvEr ThE lAzY dOg"
    @KebabCase private var kebab = "thE qUiCk BrOwN fOx jUmPs OvEr ThE lAzY dOg"
    @Truncate(length: 10) private var trunk = "The quick brown fox jumps over the lazy dog"

    func testCapitalizedProperty() {
        XCTAssertEqual(firstName, "John")
    }

    func testLowercasedProperty() {
        XCTAssertEqual(lastName, "doe")
    }

    func testTitleCaseProperty() {
        XCTAssertEqual(title, "Welcome John Doe")
    }

    func testSentenceCaseProperty() {
        XCTAssertEqual(sentence, "The Quick Brown Fox Jumps Over The Lazy Dog")
    }
    
    func testCamelCaseProperty() {
        XCTAssertEqual(camel, "propertyWrappers")
    }

    func testSnakeCaseProperty() {
        XCTAssertEqual(snake, "the_quick_brown_fox_jumps_over_the_lazy_dog")
    }

    func testKebabCaseProperty() {
        XCTAssertEqual(kebab, "the-quick-brown-fox-jumps-over-the-lazy-dog")
    }

    @ReplacingOccurences(target: ".", replacement: "")
    private var username: String = "john.doe"

    func testReplacingOccurrences() {
        XCTAssertEqual(username, "johndoe")
    }

    @ReplacingOccurences(target: ".", replacement: "", count: 1)
    private var email: String = "john.doe@gmail.com"

    func testRestrictedReplacingOccurrences() {
        XCTAssertEqual(email, "johndoe@gmail.com")
    }

    func testTruncation() {
        XCTAssertEqual(trunk, "The quick ...")
    }

    @TrimCharacters(in: .punctuationCharacters)
    private var punctuatedSentence = "The quick brown fox jumps over the lazy dog!"
    func testTrimmingCharacters() {
        XCTAssertEqual(punctuatedSentence, "The quick brown fox jumps over the lazy dog")
    }

    @TextReversal
    var reversedText = "Hello world"
    func testReversingText() {
        XCTAssertEqual(reversedText, "dlrow olleH")
    }

    func testReversingDecodedText() throws {
        let jsonData = """
            {
                "message": "Hello world"
            }
            """.data(using: .utf8)!
        
        let response = try JSONDecoder().decode(TextReversalResponse.self, from: jsonData)
        XCTAssertEqual(response.message, "dlrow olleH")
    }

    @SHA256Hash var text = "Hello, CryptoKit!"
    func test256Hash() {
        XCTAssertEqual(text, "746e0151b9f045826c327b7a465b02e5fdf15d060eca2dcdd74827778aa1355b")
    }

    func test256HashDecoded() throws {
        let jsonData = """
            {
                "message": "Hello world"
            }
            """.data(using: .utf8)!
        
        let response = try JSONDecoder().decode(SHA256Response.self, from: jsonData)
        XCTAssertEqual(response.message, "64ec88ca00b268e5ba1a35678a1b5316d212f4f366b2477232534a8aeca37f3c")
    }
}

struct TextReversalResponse: Decodable {
    @TextReversal
    var message: String
}

struct SHA256Response: Decodable {
    @SHA256Hash
    var message: String
}
