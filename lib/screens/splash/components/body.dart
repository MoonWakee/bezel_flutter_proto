import 'package:flutter/material.dart';
import 'package:Bezel/constants.dart';
import 'package:Bezel/screens/sign_in/sign_in_screen.dart';
import 'package:Bezel/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  late PageController _pageController;

  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Map<String, String>> splashData = [
    {
      "text":
          "\nInterested in Interior styling?\n\nWelcome to the inspirational community,\nwhere you can discover trending interiors!\nInspire others with your own style!",
      "image": "assets/images/splash_post.jpeg"
    },
    {
      "text":
          "\nTired of asking / looking up items?\n\nFind your insight,\nClick on the item,\nBuy in discounted price,\nit's that simple!",
      "image": "assets/images/splash_market.jpeg"
    },
    {
      "text":
          "\nInterior remodeling costs. It's discreet work.\n\nDon't pay, Consult free with us,\nRest assured with Bezel-man service\nwhere we assure our quality service with warranty!",
      "image": "assets/images/splash_contract.jpeg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 1),
                    DefaultButton(
                      text: currentPage != splashData.length - 1
                          ? "Continue"
                          : "Get Started",
                      press: () {
                        if (currentPage != splashData.length - 1) {
                          _pageController.nextPage(
                            duration: kAnimationDuration,
                            curve: Curves.ease,
                          );
                        } else {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        }
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
