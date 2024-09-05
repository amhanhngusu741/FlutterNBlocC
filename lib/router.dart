import 'package:flutter/material.dart';
import 'package:childcaresoftware/screens/screens.dart';

class AppRouter {
  static const String HOME = 'home';
  static const String SPLASH = '/';
  static const String LOGIN = 'login';
  static const String ONBOARDING = 'introduction';
  static const String REGISTER = 'register';
  static const String FORGOT_PASSWORD = 'forgot_password';
  static const String VERIFY_CODE = 'verify_code';
  static const String NEW_PASSWORD = 'new_password';
  static const String PASSWORD_RESET_SUCCESS = 'password_reset_success';
  static const String ACTIVATE_VERIFY_CODE = 'activate_verify_code';
  static const String PROFILE = 'profile';
  static const String CHANGE_PASSWORD = 'change_password';
  static const String JOBS_DETAIL = 'jobs_detail';
  static const String PRODUCT_SEARCH = 'product_search';
  static const String BILLING = 'billing';

  static Route onGenerateRoute(RouteSettings settings) {
    Widget _screen;
    switch (settings.name) {
      case SPLASH:
        _screen = SplashScreen();
        break;
      case ONBOARDING:
        _screen = OnBoardingScreen();
        break;
      case LOGIN:
        _screen = LoginScreen();
        break;
      case HOME:
        _screen = HomeScreen();
        break;
      case REGISTER:
        _screen = RegisterScreen();
        break;
      case FORGOT_PASSWORD:
        _screen = ForgotPasswordScreen();
        break;
      case VERIFY_CODE:
        final VerifyCodeScreenArguments args = settings.arguments;
        _screen = VerifyCodeScreen(
          email: args.email,
        );
        break;
      case NEW_PASSWORD:
        final NewPasswordScreenArguments args = settings.arguments;
        _screen = NewPasswordScreen(
          email: args.email,
        );
        break;
      case PASSWORD_RESET_SUCCESS:
        _screen = PasswordResetSuccessScreen();
        break;
      case ACTIVATE_VERIFY_CODE:
        final email = settings.arguments as String;
        _screen = ActivateVerifyCodeScreen(email: email);
        break;
      case PROFILE:
        // final email = settings.arguments as String;
        _screen = ProfileScreen();
        break;
      case CHANGE_PASSWORD:
        _screen = ChangePasswordScreen();
        break;
      case BILLING:
        _screen = BillingScreen();
        break;

      default:
        _screen = null;
    }
    return MaterialPageRoute(builder: (context) => _screen);
  }
}
