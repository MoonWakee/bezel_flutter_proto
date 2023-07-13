import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
    required this.adIndex,
    required this.totalAds,
  }) : super(key: key);

  final int adIndex;
  final int totalAds;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var snackBar = SnackBar(
          content: Text('Summer Sale!!'),
          duration: Duration(milliseconds: 800),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(10),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 162, 223, 251),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Align(
                      child: Image.asset(
                        'assets/images/refrigerator.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      child: Image.asset(
                        'assets/images/micro.png',
                        width: 80,
                        height: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Align(
                  child: Image.asset(
                    'assets/images/vacuum.png',
                    width: 80,
                    height: 130,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Summer Sale!!\n",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(25),
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 0, 77, 210),
                            ),
                          ),
                          TextSpan(
                            text: "Home Appliances\n",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(12),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: "20%~60%",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 255, 73, 60),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 35,
            right: 35,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                  start: 15, end: 15, top: 3, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '${adIndex + 1}/$totalAds',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
