import 'package:Bezel/screens/consult/components/contract_card.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/headerComponents/search_header.dart';

class ConsultScreen extends StatelessWidget {
  static String routeName = "/consult";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      SizedBox(height: getProportionateScreenHeight(20)),
      SearchHeader(),
      SizedBox(height: getProportionateScreenHeight(15)),
      Expanded(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(14)),
          Container(
            height: getProportionateScreenWidth(6),
            width: double.infinity,
            color: Color.fromRGBO(206, 206, 206, 0.2),
          ),
          SizedBox(height: getProportionateScreenHeight(14)),
          TitleCard(text: 'Construction'),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/house.png",
              text: "Residential Construction"),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/market.png",
              text: "Commercial Construction"),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/survey.png",
              text: "Interior Contract Diagnosis"),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/ranking.png",
              text: "Construction Materials Ranking"),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/calculator.png",
              text: "Estimation Calculator"),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/tools.png", text: "Product Installation"),
          SizedBox(height: getProportionateScreenHeight(14)),
          Container(
            height: getProportionateScreenWidth(6),
            width: double.infinity,
            color: Color.fromRGBO(206, 206, 206, 0.2),
          ),
          SizedBox(height: getProportionateScreenHeight(14)),
          TitleCard(text: 'Moving / Cleaning'),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(image: "assets/icons/moving.png", text: "Moving"),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/clean.png", text: "Move In/Out Cleaning"),
          SizedBox(height: getProportionateScreenHeight(14)),
          Container(
            height: getProportionateScreenWidth(6),
            width: double.infinity,
            color: Color.fromRGBO(206, 206, 206, 0.2),
          ),
          SizedBox(height: getProportionateScreenHeight(14)),
          TitleCard(text: 'Real Estate'),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/checklist.png", text: "Property Checklist"),
          ContractCard(
              image: "assets/icons/apartments.png", text: "Construction Cases"),
          SizedBox(height: getProportionateScreenHeight(14)),
          Container(
            height: getProportionateScreenWidth(6),
            width: double.infinity,
            color: Color.fromRGBO(206, 206, 206, 0.2),
          ),
          SizedBox(height: getProportionateScreenHeight(14)),
          TitleCard(text: 'Professional Cleaning'),
          SizedBox(height: getProportionateScreenHeight(7)),
          ContractCard(
              image: "assets/icons/trash.png", text: "Move Out Trash Removal"),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      )))
    ]));
  }
}

class TitleCard extends StatelessWidget {
  const TitleCard({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(width: getProportionateScreenWidth(20)),
      Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
      )
    ]);
  }
}
