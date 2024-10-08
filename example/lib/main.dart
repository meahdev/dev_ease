import 'package:dev_ease/dev_ease.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dev Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? htmlString = """
Hello &amp; welcome to &lt;Flutter&gt;! We are excited to have you here. 
This tutorial covers various topics, including:
- Understanding &quot;Widgets&quot; and how to create them.
- Working with data using &lt;ListView&gt; and &lt;GridView&gt;.
- Implementing &lt;Drawer&gt; navigation for a better user experience.
- Learning about state management solutions like &lt;Provider&gt; and &lt;Bloc&gt;.
If you have any questions, feel free to ask! &copy; 2024 Flutter Community.
""";

  String? decimalString = "12.00";
  String? intString = "42";
  String? capitalString = "hello";
  String? sentenceString = "hello world from flutter";
  String? snakeCaseString = "Hello World";
  String? kebabCaseString = "Hello World";
  String? dateString = "10/25/2023";
  DateTime date = DateTime(2024, 12, 25);
  String utcDateString = "2024-01-15 18:00:00";
  int number =1;
  double doubleNumber =20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextCombo(
              text: htmlString ?? "",
              convertedText: htmlString.convertHtmlEntities(),
              title: "Html Entities",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: decimalString ?? "",
              convertedText: decimalString.toDouble().toString(),
              title: "String to Double Parse",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: intString ?? "",
              convertedText: intString.toInt().toString(),
              title: "String to Int Parse",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: capitalString ?? "",
              convertedText: capitalString.toCapitalize().toString(),
              title: "Uppercase the word",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: sentenceString ?? "",
              convertedText: sentenceString.toCapitalizeSentence().toString(),
              title: "Uppercase the sentence",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: snakeCaseString ?? "",
              convertedText: snakeCaseString.toSnakeCase().toString(),
              title: "Snake Case",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: kebabCaseString ?? "",
              convertedText: kebabCaseString.toKebabCase().toString(),
              title: "Kebab Case",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: dateString ?? "",
              convertedText: dateString.formatToCustomDate(
                  inputFormat: 'MM/dd/yyyy', outputFormat: "MMMM dd, yyyy"),
              title: "Custom Date Conversion with String Type",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: date.toString() ?? "",
              convertedText: date.formatToCustomDate(
                inputFormat: 'yyyy-MM-dd',
                outputFormat: "MMMM dd, yyyy",
              ),
              title: "Custom Date Conversion with Date Type",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: utcDateString,
              convertedText: utcDateString.formatUTCToLocal(
                  inputFormat: 'yyyy-MM-dd HH:mm:ss',
                  outputFormat: "dd MMM y - hh:mm a"),
              title: "UTC Timezone to Local Timezone",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: number.toString(),
              convertedText: number.appendZero(),
              title: "Append Zero",
            ),
            const SizedBox(
              height: 12,
            ),
            TextCombo(
              text: doubleNumber.toString(),
              convertedText: doubleNumber.toString().removeDecimalZero(),
              title: "Remove Unwanted Zero",
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class TextCombo extends StatelessWidget {
  const TextCombo(
      {super.key,
      required this.text,
      required this.convertedText,
      required this.title});

  final String title;
  final String text;
  final String convertedText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  convertedText,
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
