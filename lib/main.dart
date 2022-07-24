import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infosumbar/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      MyApp(),
    ),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  MyApp({Key? key}) : super(key: key);
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(Get.width, 10),
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              dividerColor: Colors.grey[300],
              listTileTheme: const ListTileThemeData(
                iconColor: Colors.red,
                textColor: Colors.black,
              ),
              tabBarTheme: const TabBarTheme(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.red,
              ),
              useMaterial3: true,
              colorScheme: const ColorScheme(
                primary: Color(0xFFF44336),
                onPrimary: Colors.white,
                secondary: Colors.red,
                onSecondary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
                background: Colors.white,
                onBackground: Colors.black,
                error: Colors.red,
                onError: Colors.white,
                brightness: Brightness.light,
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute:
                snapshot.data != null && snapshot.data?.emailVerified == true
                    ? Routes.HOME //home
                    : Routes.INTRODUCTION_PAGE, //login
            getPages: AppPages.routes,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
