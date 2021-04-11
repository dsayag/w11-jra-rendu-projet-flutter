import 'package:dwmgex/screens/detail.dart';
import 'package:dwmgex/screens/home.dart';
import 'package:dwmgex/screens/login.dart';
import 'package:dwmgex/screens/profile.dart';
import 'package:dwmgex/screens/register.dart';

final routes = {
  '/register': (context) => RegisterPage(),
  '/login': (context) => LoginPage(),
  '/home': (context) => MyHomePage(),
  '/detail': (context) => DetailPage(title: 'Detail'),
  '/profile': (context) => ProfilePage(title: 'Profile'),
};
