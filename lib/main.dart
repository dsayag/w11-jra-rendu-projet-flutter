import 'package:dwmgex/firebase.dart';
import 'package:dwmgex/routes.dart';
import 'package:dwmgex/screens/loading.dart';
import 'package:dwmgex/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Cas erreur de chargement
        if (snapshot.hasError) {
          return MaterialApp(home: Scaffold());
        }

        // Cas chargement réussi
        if (snapshot.connectionState == ConnectionState.done) {
          // Permet d'adapter les Widgets selon la taille de l'écran
          return ScreenUtilInit(
            designSize: Size(414, 815),
            builder: () => MaterialApp(
              title: 'Login page',
              theme: ThemeData(
                primarySwatch: Colors.indigo,
              ),
              home: LoginPage(),
              routes: routes,
              initialRoute:
                  firebaseAuth.currentUser != null ? '/home' : '/login',
            ),
          );
        }

        // Cas de chargement
        return LoadingScreen();
      },
    );
  }
}
