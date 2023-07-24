import 'package:Bezel/screens/consult/components/contract_card.dart';
import 'package:Bezel/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SelectableTextPage extends StatefulWidget {
  @override
  _SelectableTextPageState createState() => _SelectableTextPageState();
}

class _SelectableTextPageState extends State<SelectableTextPage> {
  String? selectedAnswer;
  List<String> questions = [
    "Which type of building?",
    "When are you planning on remodeling?",
    "What is your planned budget?",
    "What is the address?"
  ];
  List<List<String>> options = [
    ["Apartment", "Townhouse", "House", "Condo", "Co-op"],
    ["Within 1 months", "Within 2 months", "Within 3 months", "Not Planned"],
    [
      "Below \$10,000",
      "Around \$10,000",
      "Around \$20,000",
      "Around \$30,000",
      "Around \$40,000",
      "More than \$50,000",
      "Not Sure"
    ],
    ["Hey jude"]
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Consulting Questionnaire'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questions[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Column(
                  children: options[index].map((option) {
                    if (index == 3) {
                      return buildAddressText(option);
                    } else {
                      return buildRadioText(option);
                    }
                  }).toList(),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Column(children: []),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: index != 0,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index = (index - 1).clamp(0, questions.length - 1);
                            selectedAnswer = null;
                          });
                        },
                        child: Text('Prev'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Do something with the selected answer
                        if (selectedAnswer != null) {
                          print('Selected answer: $selectedAnswer');
                        } else {
                          print('Please select an answer');
                        }
                        if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginSuccessScreen(),
                            ),
                          );
                        }
                        setState(() {
                          index = (index + 1).clamp(0, questions.length - 1);
                          selectedAnswer = null;
                        });
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildRadioText(String text) {
    return Row(
      children: [
        Radio<String>(
          value: text,
          groupValue: selectedAnswer,
          onChanged: (value) {
            setState(() {
              selectedAnswer = value;
            });
          },
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

Widget buildAddressText(String title) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(children: [
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Address line 1',
              hintText: 'Street number and name'),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Address line 2',
              hintText: 'Apartment unit / number'),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'City / State / Zip',
              hintText: 'City, state and zip code '),
        ),
        SizedBox(height: 20),
        Container(
          height: getProportionateScreenWidth(6),
          width: double.infinity,
          color: Color.fromRGBO(206, 206, 206, 0.2),
        ),
        SizedBox(height: 10),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  "What is you name and contact info?",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ))),
        SizedBox(height: 28),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Recipient name',
              hintText: 'Enter your name'),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Mobile number / Email',
              hintText: 'Enter your primary contact info'),
        ),
      ]));
}
