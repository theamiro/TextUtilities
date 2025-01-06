# TextUtility Library
<p align="left">
<img src="https://github.com/theamiro/TextUtilities/actions/workflows/build.yml/badge.svg" />
<img src="https://img.shields.io/badge/platform-iOS-brightgreen" />
<a href="https://github.com/kefranabg/readme-md-generator/blob/master/LICENSE">
    <img alt="License: MIT"  src="https://img.shields.io/badge/license-MIT-yellow.svg"  target="_blank" />
</a>
</p>

The **TextUtility** library for Swift provides a collection of `@propertyWrapper` implementations to transform and standardize string casing. These wrappers are designed to handle common text case transformations such as capitalization, lowercasing, uppercasing, and more, with optional localization support.

## Features
- Simplifies text case transformations with `@propertyWrapper` annotations.
- Supports standard and localized transformations.
- Handles various text cases:
  - Capitalized
  - Lowercased
  - Uppercased
  - Title Case
  - Sentence Case
  - Camel Case
  - Pascal Case
  - Snake Case
  - Kebab Case

---

## Installation
Add the `TextUtility` library to your Swift project using Swift Package Manager:

```swift
.package(url: "https://github.com/theamiro/TextUtilities.git", from: "1.0.0")
```

---

## Usage

### Example
```swift
import TextUtility

struct Example {
    @Capitalized var capitalizedText: String = "hello world"
    @Lowercased var lowercasedText: String = "Hello World"
    @Uppercased var uppercasedText: String = "hello world"
    @TitleCase var titleCasedText: String = "hello world"
    @SentenceCase var sentenceCasedText: String = "HELLO WORLD"
    @CamelCase var camelCasedText: String = "hello world"
    @PascalCase var pascalCasedText: String = "hello world"
    @SnakeCase var snakeCasedText: String = "hello world"
    @KebabCase var kebabCasedText: String = "hello world"
}

let example = Example()
print(example.capitalizedText) // "Hello world"
print(example.lowercasedText)  // "hello world"
print(example.uppercasedText)  // "HELLO WORLD"
print(example.titleCasedText)  // "Hello World"
print(example.sentenceCasedText) // "Hello world"
print(example.camelCasedText)  // "helloWorld"
print(example.pascalCasedText) // "HelloWorld"
print(example.snakeCasedText)  // "hello_world"
print(example.kebabCasedText)  // "hello-world"
```

---

## Wrappers Overview

### `@Capitalized`
Capitalizes the first letter of the string. Supports optional localization.
```swift
@Capitalized var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized capitalization.
- **Example**:
  ```swift
  @Capitalized var example = "hello world"
  print(example) // "Hello world"
  ```

### `@Lowercased`
Converts all characters to lowercase. Supports optional localization.
```swift
@Lowercased var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized lowercasing.
- **Example**:
  ```swift
  @Lowercased var example = "HELLO WORLD"
  print(example) // "hello world"
  ```

### `@Uppercased`
Converts all characters to uppercase. Supports optional localization.
```swift
@Uppercased var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized uppercasing.
- **Example**:
  ```swift
  @Uppercased var example = "hello world"
  print(example) // "HELLO WORLD"
  ```

### `@TitleCase`
Capitalizes the first letter of each word. Supports optional localization.
```swift
@TitleCase var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized title case.
- **Example**:
  ```swift
  @TitleCase var example = "hello world"
  print(example) // "Hello World"
  ```

### `@SentenceCase`
Capitalizes the first letter of the first word in the string. Supports optional localization.
```swift
@SentenceCase var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized sentence case.
- **Example**:
  ```swift
  @SentenceCase var example = "HELLO WORLD"
  print(example) // "Hello world"
  ```

### `@CamelCase`
Formats the string in camelCase. Supports optional localization.
```swift
@CamelCase var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized camelCase.
- **Example**:
  ```swift
  @CamelCase var example = "hello world"
  print(example) // "helloWorld"
  ```

### `@PascalCase`
Formats the string in PascalCase. Supports optional localization.
```swift
@PascalCase var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized PascalCase.
- **Example**:
  ```swift
  @PascalCase var example = "hello world"
  print(example) // "HelloWorld"
  ```

### `@SnakeCase`
Formats the string in snake_case. Supports optional localization.
```swift
@SnakeCase var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized snake_case.
- **Example**:
  ```swift
  @SnakeCase var example = "hello world"
  print(example) // "hello_world"
  ```

### `@KebabCase`
Formats the string in kebab-case. Supports optional localization.
```swift
@KebabCase var text: String
```
- **Parameters**:
  - `localized` (Bool): If true, applies localized kebab-case.
- **Example**:
  ```swift
  @KebabCase var example = "hello world"
  print(example) // "hello-world"
  ```

---

## Contributing
Contributions are welcome! If you have ideas for additional text casing utilities or enhancements, feel free to submit a pull request or open an issue.

---

## License
This library is available under the MIT License. See the LICENSE file for more information.
