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
}
