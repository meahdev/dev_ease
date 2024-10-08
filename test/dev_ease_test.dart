import 'package:dev_ease/dev_ease.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Extension Tests', () {
    test('convertHtmlEntities should replace known HTML entities', () {
      const String input = "&amp;&lt;&gt;&quot;&#39;";
      expect(input.convertHtmlEntities(), "&<>\"'");
    });

    test(
        'convertHtmlEntities should return original string for unknown entities',
        () {
      const String input = "&unknown;&nbsp;Hello";
      expect(input.convertHtmlEntities(), "&unknown; Hello");
    });

    test('convertHtmlEntities should handle null input', () {
      String? input;
      expect(input.convertHtmlEntities(), "");
    });

    test('removeDecimalZero should remove decimals if integer', () {
      const String input = "42.0";
      expect(input.removeDecimalZero(), "42");
    });

    test('removeDecimalZero should retain decimal if not integer', () {
      const String input = "42.5";
      expect(input.removeDecimalZero(), "42.5");
    });

    test('removeDecimalZero should handle invalid double input', () {
      const String input = "not_a_double";
      expect(input.removeDecimalZero(), "not_a_double");
    });

    test('toInt should convert valid double strings to integer', () {
      const String input = "42.9";
      expect(input.toInt(), 42);
    });

    test('toInt should return null for invalid input', () {
      const String input = "not_a_number";
      expect(input.toInt(), 0);
    });

    test('toDouble should convert valid string to double', () {
      const String input = "42.5";
      expect(input.toDouble(), 42.5);
    });

    test('toDouble should handle invalid double input', () {
      const String input = "invalid_double";
      expect(input.toDouble(), 0.0);
    });

    test('toCapitalize should capitalize the first letter', () {
      const String input = "hello";
      expect(input.toCapitalize(), "Hello");
    });

    test('toCapitalize should handle empty string', () {
      const String input = "";
      expect(input.toCapitalize(), "");
    });

    test('toCapitalizeSentence should capitalize all words', () {
      const String input = "hello world";
      expect(input.toCapitalizeSentence(), "Hello World");
    });

    test('toSnakeCase should convert space to snake_case', () {
      const String input = "hello world";
      expect(input.toSnakeCase(), "hello_world");
    });

    test('toKebabCase should convert space to kebab-case', () {
      const String input = "hello world";
      expect(input.toKebabCase(), "hello-world");
    });

    test('containsIgnoreCase should check for case-insensitive containment',
        () {
      const String input = "Hello World";
      expect(input.containsIgnoreCase("hello"), true);
    });

    test('containsIgnoreCase should return false for non-matching substring',
        () {
      const String input = "Hello World";
      expect(input.containsIgnoreCase("test"), false);
    });
  });

  group('ZeroAppender Extension Tests', () {
    test('appendZero should append zero for numbers between 1 and 9', () {
      expect(5.appendZero(), "05");
    });

    test('appendZero should not append zero for numbers outside 1-9', () {
      expect(10.appendZero(), "10");
    });
  });

  group('DateFormatExtension Tests', () {
    test('formatToCustomDate should convert string date to desired format', () {
      const String input = "2024-10-08";
      expect(
          input.formatToCustomDate(
              inputFormat: "yyyy-MM-dd", outputFormat: "dd/MM/yyyy"),
          "08/10/2024");
    });

    test('formatToCustomDate should return invalid for wrong format', () {
      const String input = "2024-10-08";
      expect(
          input.formatToCustomDate(
              inputFormat: "dd/MM/yyyy", outputFormat: "yyyy-MM-dd"),
          "Invalid date format");
    });

    test('formatToCustomDate should handle DateTime input', () {
      final dateTime = DateTime(2024, 10, 8);
      expect(
          dateTime.formatToCustomDate(
              inputFormat: "yyyy-MM-dd", outputFormat: "dd/MM/yyyy"),
          "08/10/2024");
    });

    test('formatUTCToLocal should convert UTC date to local time correctly',
        () {
      // The input UTC date string
      const String input = "2024-10-08 08:21:24";

      // Format the input string as if it's in UTC
      final result = input.formatUTCToLocal(
          inputFormat: 'yyyy-MM-dd HH:mm:ss',
          outputFormat: "dd MMM y - hh:mm a");

      // Assert the result is equal to the expected local date
      expect(result, "08 Oct 2024 - 01:51 PM");
    });

    test('formatUTCToLocal should return invalid for incorrect input', () {
      const String input = "invalid_date";
      expect(
          input.formatUTCToLocal(
              inputFormat: "yyyy-MM-dd", outputFormat: "dd/MM/yyyy"),
          "Invalid date format");
    });
  });
}
