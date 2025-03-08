import 'package:get/get.dart';
import 'package:bankcol/screens/login_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
    ),
    // Aquí agregaremos más rutas conforme creemos más pantallas
  ];

  static const INITIAL = '/login';
}