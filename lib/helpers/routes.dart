import 'package:flutter/cupertino.dart';
import 'package:white_matrix_ecommerce/screens/otp_screen.dart';
import 'package:white_matrix_ecommerce/screens/sign_in.dart';
import 'package:white_matrix_ecommerce/screens/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const ScreenSplash(),
        );
      case '/credentialSignIn':
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const CredentialSignIn(),
        );
      case '/otpVerification':
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => ScreenOtpVerification(),
        );
      default:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const CredentialSignIn(),
        );
    }
  }
}
