import 'package:flutter/widgets.dart';
import 'package:Bezel/screens/cart/cart_screen.dart';
import 'package:Bezel/screens/complete_profile/complete_profile_screen.dart';
import 'package:Bezel/screens/details/details_screen.dart';
import 'package:Bezel/screens/forgot_password/forgot_password_screen.dart';
import 'package:Bezel/screens/home/home_screen.dart';
import 'package:Bezel/screens/login_success/login_success_screen.dart';
import 'package:Bezel/screens/navigator/navigator_screen.dart';
import 'package:Bezel/screens/otp/otp_screen.dart';
import 'package:Bezel/screens/profile/profile_screen.dart';
import 'package:Bezel/screens/sign_in/sign_in_screen.dart';
import 'package:Bezel/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  NavigatorScreen.routeName: (context) => NavigatorScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
