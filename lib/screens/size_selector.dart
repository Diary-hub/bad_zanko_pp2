import 'package:bad_zanko_pp/Components/custom_appbar.dart';
import 'package:bad_zanko_pp/helper/helper.dart';
import 'package:bad_zanko_pp/screens/final.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.isFemale});

  final bool isFemale;
  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late bool isFemale;

  double selectedValueWieght = 5.0;
  double selectedValueHeight = 50.0;

  @override
  void initState() {
    super.initState();
    isFemale = widget.isFemale;
  }

  @override
  Widget build(BuildContext context) {
    // double sH = MediaQuery.sizeOf(context).width;
    double sW = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HelperClass.getColor(isFemale),
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => FinalPage(
                        height: selectedValueHeight,
                        weight: selectedValueWieght,
                        isFemale: isFemale,
                      )));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: CustomAppBar("Edit Your Info", HelperClass.getColor(isFemale)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Row()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: SizedBox(
                        width: sW * 0.5,
                        child: Slider(
                          value: selectedValueWieght,
                          thumbColor: HelperClass.getColor(isFemale),
                          activeColor: HelperClass.getColor(isFemale),
                          inactiveColor: HelperClass.getColor(isFemale).withOpacity(0.2),
                          min: 5,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              selectedValueWieght = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          color: HelperClass.getColor(isFemale).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Wieght ${selectedValueWieght.toStringAsFixed(0)} KG"),
                      ),
                    )
                  ],
                ),
                Image(
                  image: NetworkImage(
                    HelperClass.getImage(isFemale),
                  ),
                  width: sW * 0.2,
                ),
                Column(
                  children: [
                    RotatedBox(
                      quarterTurns: -1,
                      child: SizedBox(
                        width: sW * 0.5,
                        child: Slider(
                          value: selectedValueHeight,
                          thumbColor: HelperClass.getColor(isFemale),
                          activeColor: HelperClass.getColor(isFemale),
                          inactiveColor: HelperClass.getColor(isFemale).withOpacity(0.2),
                          min: 50,
                          max: 300,
                          onChanged: (value) {
                            setState(() {
                              selectedValueHeight = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          color: HelperClass.getColor(isFemale).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Height ${selectedValueHeight.toStringAsFixed(0)} CM"),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Expanded(child: Row()),
          ],
        ),
      ),
    );
  }
}
