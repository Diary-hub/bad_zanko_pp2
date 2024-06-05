import 'dart:math';

import 'package:bad_zanko_pp/Components/custom_appbar.dart';
import 'package:bad_zanko_pp/helper/helper.dart';
import 'package:bad_zanko_pp/screens/home.dart';
import 'package:flutter/material.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key, required this.weight, required this.height, required this.isFemale});

  final double weight;
  final double height;
  final bool isFemale;

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  late double weight;
  late double height;
  late bool isFemale;
  double bmiResult = 0;
  @override
  void initState() {
    super.initState();

    weight = widget.weight;
    height = widget.height;
    isFemale = widget.isFemale;
    calculateBMI();
  }

  String getAdviceBasedOnBmi(double bmi) {
    if (bmi < 18.5) {
      return 'You are underweight. You might need to gain some weight.';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'You have a normal weight. Great job!';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'You are overweight. A little exercise would be good.';
    } else {
      return 'You are obese. Consultation with a healthcare provider would be beneficial.';
    }
  }

  void calculateBMI() {
    double bmi = weight / pow(height / 100, 2);

    setState(() {
      bmiResult = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.height;
    double sH = MediaQuery.sizeOf(context).width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HelperClass.getColor(isFemale),
        child: const Icon(Icons.repeat),
        onPressed: () {
          setState(() {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: CustomAppBar("Your BMI", HelperClass.getColor(isFemale)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const NetworkImage("https://cdn-icons-png.flaticon.com/512/5278/5278593.png"),
              width: sW * .3,
            ),
            SizedBox(height: sH * 0.04),
            Container(
              alignment: Alignment.center,
              width: sW * 0.55,
              decoration: BoxDecoration(
                color: HelperClass.getColor(isFemale).withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  getAdviceBasedOnBmi(bmiResult),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: sH * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HelperClass.getColor(isFemale).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Wight: ${weight.toStringAsFixed(0)} KG",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: HelperClass.getColor(isFemale).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Your Height: ${height.toStringAsFixed(0)} CM",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
