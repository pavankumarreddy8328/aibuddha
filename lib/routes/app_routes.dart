import 'package:aibuddha/bindings/bindings_export.dart';
import 'package:aibuddha/screens/screens_export.dart';

import 'package:get/get.dart';

class AppRoutes{
  AppRoutes._();

  static final routes = [
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(name: HomeScreen.routeName, page: () => HomeScreen(),
    binding: HomeBinding()),
   
  ];
}