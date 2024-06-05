import 'package:bad_zanko_pp/helper/helper.dart';
import 'package:bad_zanko_pp/screens/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:bad_zanko_pp/Components/custom_appbar.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  bool isFemale = true;
  String maleImage =
      'https://cdn.iconscout.com/icon/free/png-256/free-man-person-avatar-user-boy-32054.png';
  String femaleImage = 'https://cdn-icons-png.flaticon.com/512/264/264735.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: isFemale ? (Colors.pink) : (Colors.cyan),
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SizeSelector(
                        isFemale: isFemale,
                      )));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: CustomAppBar('Select Your Gender', HelperClass.getColor(isFemale)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Row()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: !isFemale ? 1.0 : 0.4,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => setState(() {
                    isFemale = false;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    width: 150,
                    height: 150,
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(maleImage),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Opacity(
                opacity: isFemale ? 1.0 : 0.4,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => setState(() {
                    isFemale = true;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    width: 150,
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(femaleImage),
                        width: 200,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: Row()),
        ],
      ),
    );
  }
}
