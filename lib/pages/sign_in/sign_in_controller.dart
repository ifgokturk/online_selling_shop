import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_selling_shop/common/entities/entities.dart';
import 'package:online_selling_shop/common/global_loader/global_loader.dart';
import 'package:online_selling_shop/pages/sign_in/notifiers/sign_in_notifier.dart';

import '../../common/widgets/popup_messages.dart';

class SignInController {
  WidgetRef ref;

  SignInController({required this.ref});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    debugPrint('email .adreess is $email');
    debugPrint('password is $password');

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your Mail is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password didnt match");
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user == null) {
        toastInfo("USer Not found");
      }
      if (!credential.user!.emailVerified) {
        toastInfo("You must verify email adress first");
      }

      var user = credential.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();

        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        debugPrint("logged in");
        debugPrint("LOgin ID :${loginRequestEntity.open_id}");
      } else {
        toastInfo("Login Error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo("user not found");
      } else if (e.code == 'wrong-password') {
        toastInfo("your password şs wrong");
      }
     } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // we need to talk server
    // have local storage
  //redirect to new page
  }

}
