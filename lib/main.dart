import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/pages/sign_in/sign_in.dart';
import 'package:online_selling_shop/pages/welcome/welcome.dart';

import 'common/utils/appbar_styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392.7, 805.1),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.appThemeData,

            /* ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ), */
            initialRoute: "/",
            routes: {
              "/": (context) => Welcome(),
              "/signIn": (context) => const SignIn(),
            },
            // home:  Welcome(),
          );
        });
  }
}
