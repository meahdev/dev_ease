
---

# dev_ease

This library was created to make development easier and promote code reuse by providing a set of string manipulation utilities. It aims to simplify common operations, allowing developers to focus more on building features rather than repetitive tasks.

## Features

### 1. `convertHtmlEntities`
Converts HTML entities in a string into their respective characters. This is useful when dealing with HTML content that uses special character encodings like `&amp;` for `&`.

**Usage:**
```dart
String htmlString = "Hello &amp; welcome!";
print(htmlString.convertHtmlEntities()); 
// Output: Hello & welcome!
```

### 2. `removeDecimalZero`
Removes unnecessary decimal points from numbers represented as strings. If the number is a whole number (e.g., `"123.00"`), it converts it to `"123"`.

**Usage:**
```dart
String number = "123.00";
print(number.removeDecimalZero()); 
// Output: 123
```

### 3. `toInt`
Converts a string to an integer. If the string cannot be parsed to a valid number, it returns `0`.

**Usage:**
```dart
String value = "42";
print(value.toInt()); 
// Output: 42
```

### 4. `toDouble`
Converts a string to a double. If the string cannot be parsed to a valid number, it returns `0.0`.

**Usage:**
```dart
String value = "42.5";
print(value.toDouble()); 
// Output: 42.5
```

### 5. `toCapitalize`
Capitalizes the first letter of a string.

**Usage:**
```dart
String sentence = "hello world";
print(sentence.toCapitalize()); 
// Output: Hello world
```

### 6. `toCapitalizeSentence`
Capitalizes the first letter of each word in a string.

**Usage:**
```dart
String sentence = "hello world";
print(sentence.toCapitalizeSentence()); 
// Output: Hello World
```

### 7. `toSnakeCase`
Converts a string to snake_case by replacing spaces with underscores and converting to lowercase.

**Usage:**
```dart
String sentence = "Hello World";
print(sentence.toSnakeCase()); 
// Output: hello_world
```

### 8. `toKebabCase`
Converts a string to kebab-case by replacing spaces with hyphens and converting to lowercase.

**Usage:**
```dart
String sentence = "Hello World";
print(sentence.toKebabCase()); 
// Output: hello-world
```

### 9. `containsIgnoreCase`
Checks if the string contains another string, ignoring case sensitivity.

**Usage:**
```dart
String sentence = "Hello World";
print(sentence.containsIgnoreCase("world")); 
// Output: true
```

### 10. `appendZero`
Appends a leading zero to single-digit numbers (from `1` to `9`), ensuring consistent formatting.

**Usage:**
```dart
int number = 7;
print(number.appendZero()); 
// Output: 07
```

### 11. `formatToCustomDate`
Converts a date string or `DateTime` object from one format to another.

**Usage:**
```dart
String date = "2023-10-08";
print(date.formatToCustomDate(inputFormat: 'yyyy-MM-dd', outputFormat: 'dd/MM/yyyy'));
// Output: 08/10/2023
```

### 12. `formatUTCToLocal`
Converts a UTC date string or `DateTime` object to local date and time in a specified format.

**Usage:**
```dart
String utcDate = "2023-10-08T12:00:00Z";
print(utcDate.formatUTCToLocal(inputFormat: 'yyyy-MM-ddTHH:mm:ssZ', outputFormat: 'dd/MM/yyyy hh:mm a'));
// Output: 08/10/2023 12:00 PM
```

---

## Contact

If you have any suggestions for additional methods or features to include, please feel free to reach out at [muhmmdshabeer@gmail.com](mailto:muhmmdshabeer@gmail.com).

---

