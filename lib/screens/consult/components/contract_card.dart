import 'package:Bezel/size_config.dart';
import 'package:flutter/material.dart';

class ContractCard extends StatelessWidget {
  const ContractCard({Key? key, required this.image, required this.text})
      : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            var snackBar = SnackBar(
              content: Text(text),
              duration: Duration(milliseconds: 800),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 30,
            ),
            Image.asset(
              image,
              width: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ))
          ]),
        ));
  }
}
