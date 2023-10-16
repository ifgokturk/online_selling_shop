import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_selling_shop/common/routes/app_route_names.dart';
import 'package:online_selling_shop/features/application/view/application.dart';
import 'package:online_selling_shop/features/home/view/home.dart';
import 'package:online_selling_shop/features/sign_in/view/sign_in.dart';
import 'package:online_selling_shop/features/sign_up/view/sign_up.dart';
import '../../features/welcome/view/welcome.dart';
import '../../global.dart';


class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    print("my route name is ${settings.name} and ${settings.arguments}");

    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      if (result.isNotEmpty) {
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const Application(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => const SignIn(),
              settings: settings,
            );
          }
        } else {
          if (kDebugMode) {
          print("app ran first time");
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
  }
    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({
    required this.path,
    required this.page,
  });
}
