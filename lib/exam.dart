import 'package:bad_zanko_pp/kurdishAppbar.dart';
import 'package:flutter/material.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key, required this.username});

  final String username;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  String redText = 'This is Red';
  String greenText = 'This is Green';
  String cyanText = 'This is Cyan';

  Color redColor = Colors.red;
  Color greenColor = Colors.green;
  Color cyanColor = Colors.cyan;

  double slideValue = 0;

  late String username;

  @override
  void initState() {
    super.initState();

    username = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newMethod(username),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Row()),
          Slider(
            value: slideValue,
            min: 0,
            max: 100,
            onChanged: (x) {
              setState(() {
                slideValue = x;

                redText = slideValue.toStringAsFixed(0);

                greenText = (slideValue * 2).toStringAsFixed(0);
                cyanText = (slideValue / 2).toStringAsFixed(0);
              });
            },
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                redText = '1';
                redColor = Colors.black45;
              });
            },
            onDoubleTap: () {
              setState(() {
                redText = 'This is Red';
                redColor = Colors.red;
              });
            },
            child: Container(
              width: 200,
              height: 150,
              color: redColor,
              alignment: Alignment.center,
              child: Text(
                redText,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                greenText = '2';
                greenColor = Colors.amber;
              });
            },
            onDoubleTap: () {
              setState(() {
                greenText = 'This is Green';
                greenColor = Colors.green;
              });
            },
            child: Container(
              width: 200,
              height: 150,
              color: greenColor,
              alignment: Alignment.center,
              child: Text(
                greenText,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                cyanText = '3';
                cyanColor = Colors.purple;
              });
            },
            onDoubleTap: () {
              setState(() {
                cyanText = 'This is Cyan';
                cyanColor = Colors.cyan;
              });
            },
            child: Container(
              width: 200,
              height: 150,
              color: cyanColor,
              alignment: Alignment.center,
              child: Text(
                cyanText,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          const Expanded(child: Row()),
        ],
      ),
    );
  }
}
