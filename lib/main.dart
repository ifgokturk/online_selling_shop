import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/routes/routes.dart';
import 'package:online_selling_shop/common/utils/constanst.dart';
import 'common/services/http_util.dart';
import 'common/utils/appbar_styles.dart';
import 'global.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  await Global.init();

  // var obj1 = HttpUtil();
  // var obj2 = HttpUtil();

  // if (obj1.hashCode == obj2.hashCode){
  //   print("it s singleton class");
  // }

  // HttpUtil().post("api/login", queryParameters: {
  //   'name': "sinem5",
  //   'email': "sinem5@bb2.com",
  //   'avatar': "2xyz.com",
  //   'type': 1,
  //   'open_id': "5xcvddd",
  //   'password': "123456"
  // });
  /* var item =
      Global.storageService.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ??
          "boşmuş";
  print("item bu : $item");

  if (item != "") {
    var newItem = jsonDecode(item);
    print(newItem['name']);
    print(item.runtimeType);
  }*/

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

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
            navigatorKey: navKey,
            title: 'Flutter Demo',
            theme: AppTheme.appThemeData,

            /* ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ), */
            initialRoute: "/",
            //  routes:routesMap(),
            onGenerateRoute: AppPages.generateRouteSettings,
            // home:  Welcome(),
          );
        });
  }
}
