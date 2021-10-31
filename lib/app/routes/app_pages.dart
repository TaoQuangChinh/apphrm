import 'package:get/get.dart';

import 'package:apphrm/app/modules/home/bindings/home_binding.dart';
import 'package:apphrm/app/modules/home/views/home_view.dart';
import 'package:apphrm/app/modules/login/bindings/login_binding.dart';
import 'package:apphrm/app/modules/login/views/login_view.dart';
import 'package:apphrm/app/modules/screen_saver/bindings/screen_saver_binding.dart';
import 'package:apphrm/app/modules/screen_saver/views/screen_saver_view.dart';
import 'package:apphrm/app/modules/signup/bindings/signup_binding.dart';
import 'package:apphrm/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SCREEN_SAVER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SCREEN_SAVER,
      page: () => ScreenSaverView(),
      binding: ScreenSaverBinding(),
    ),
  ];
}
