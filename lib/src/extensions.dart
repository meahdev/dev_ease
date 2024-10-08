part of '../dev_ease.dart';

extension GetString on String? {

  String convertHtmlEntities() {
    if (this == null) return '';
    final entities = {
      "&amp;": "&",
      "&#33;": "!",
      "&quot;": '"',
      "&#39;": "'",
      "&#039;": "'",
      "&lt;": '<',
      "&gt;": '>',
      "&#47;": '/',
      "&nbsp;": ' ',
      "&copy;": '©',
      "&excl;": "!",
      "&#64;": "@",
      "&commat;": "@",
      "&#35;": "#",
      "&num;": "#",
      "&#36;": "\$",
      "&dollar;": "\$",
      "&#37;": "%",
      "&percnt;": "%",
      "&ast;": "*",
      "&#42;": "*",
      "&lpar;": "(",
      "&#40;": "(",
      "&rpar;": ")",
      "&#41;": ")",
      "&semi;": ";",
      "&#59;": ";",
      "&colon;": ":",
      "&#58;": ":",
      "&#34;": '"',
      "&#63;": "?",
      "&quest;": "?",
      "&sol;": "/"
    };
    final regExp = RegExp(r'&[^;]+;');

    // Replace using the entities map
    return this!.replaceAllMapped(regExp, (match) {
      final entity = match.group(0); // This can be null
      return entities[entity ?? ''] ?? entity ?? ''; // Provide a default value
    });
  }

  String removeDecimalZero() {
    // Return an empty string if the input is null
    if (this == null) return '';

    // Attempt to parse the string as a double
    try {
      final double value = double.parse(this!);

      // Check if the value is an integer
      if (value % 1 == 0) {
        // Return the integer representation as a string
        return value.toInt().toString();
      }

      // If it's not an integer, return the original string
      return this!;
    } catch (e) {
      // Handle the case where the string is not a valid double
      return this!; // Return the original string if parsing fails
    }
  }

  /// Converts the string to an integer.
  int? toInt() {
    // Return null if the input is null
    if (this == null) return null;

    try {
      // Attempt to parse as a double first, then convert to int
      return double.parse(this!).toInt();
    } catch (e) {
      // Handle the exception by returning a default value or logging the error
      return 0; // You might consider logging the error for debugging purposes
    }
  }

  /// Converts the string to a double.
  double? toDouble() {
    // Return null if the input is null
    if (this == null) return null;

    try {
      return double.parse(this!);
    } catch (e) {
      // Handle the exception by returning a default value or logging the error
      return 0.0; // You might consider logging the error for debugging purposes
    }
  }

  String toCapitalize() {
    // Return an empty string if the input is null or empty
    if (this == null || this!.isEmpty) return '';

    // Capitalize the first letter and append the rest of the string
    return '${this![0].trim().toUpperCase()}${this!.substring(1)}';
  }
  String toCapitalizeSentence() {
    if (this == null) return '';
    return this!.split(' ').map((word) {
      return word.toCapitalize();
    }).join(' ');
  }

  String toSnakeCase() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'\s+'), '_').toLowerCase();
  }

  String toKebabCase() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'\s+'), '-').toLowerCase();
  }

  bool containsIgnoreCase(String str) {
    if (this == null) return false;
    return this!.toLowerCase().contains(str.toLowerCase());
  }

}

/// Appending Zero if the value is between 1-9
extension ZeroAppender on int {
  String appendZero() {
    return (this >= 1 && this <= 9) ? '0$this' : '$this';
  }
}


extension DateFormatExtension on Object? {
  /// Converts a date string or DateTime object from the specified input format to the specified output format.
  String formatToCustomDate({
    required String inputFormat,
    required String outputFormat,
  }) {
    // Return 'Invalid input' if the input is null
    if (this == null) {
      return '';
    }

    DateTime? parsedDate; // Make it nullable

    // Check if the input is a DateTime
    if (this is DateTime) {
      parsedDate = this as DateTime; // Safe cast
    }
    // Check if the input is a String
    else if (this is String) {
      // Attempt to parse the date string using the provided input format
      try {
        parsedDate = DateFormat(inputFormat).parseStrict(toString());
      } catch (e) {
        return 'Invalid date format';
      }
    }
    // If the input is neither a String nor a DateTime
    else {
      return 'Invalid date';
    }

    // Format the parsed DateTime to the desired output format
    return DateFormat(outputFormat).format(parsedDate);
  }

  /// Converts a UTC date string or DateTime object to local date and time in a specified output format.
  String formatUTCToLocal({
    required String inputFormat,
    required String outputFormat,
  }) {
    // Return an empty string if the input is null
    if (this == null) {
      return '';
    }

    DateTime? parsedDate;

    // Check if the input is a DateTime
    if (this is DateTime) {
      parsedDate = this as DateTime;
    }
    // Check if the input is a String
    else if (this is String) {
      // Attempt to parse the date string using the provided input format
      try {
        parsedDate = DateFormat(inputFormat).parse(toString(), true);
      } catch (e) {
        return 'Invalid date format';
      }
    } else {
      return 'Invalid input type'; // Handle cases where input is neither String nor DateTime
    }

    // Convert the parsed UTC date to local time
    DateTime localDate = parsedDate.toLocal(); // Safe to use ! here because parsedDate is guaranteed to be non-null

    // Format the local date to the desired output format
    return DateFormat(outputFormat).format(localDate);
  }
}