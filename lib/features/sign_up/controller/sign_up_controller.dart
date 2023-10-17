import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_selling_shop/common/global_loader/global_loader.dart';
import 'package:online_selling_shop/common/widgets/popup_messages.dart';
import 'package:online_selling_shop/features/sign_up/repo/sign_up_repo.dart';
import 'package:online_selling_shop/features/sign_up/view/sign_up.dart';

import '../provider/register_notifier.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({
    required this.ref,
  });

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your Name is Empty.");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your Name is too short");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your Mail is empty");
      return;
    }
    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo("Your password didnt match");
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("Your password didnt match");
      return;
    }
    //show loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    var context = Navigator.of(ref.context);
    try {
      final credential = await SignUpRepo.firebaseSignUp(email, password);
      if (kDebugMode) {
        print("PRINTING CREDENTIAL $credential");
      }
      if (credential.user != null) {
        print(
            "PRINTING CREDENTIAL REFRESH TOKEN :> ${credential.user!.refreshToken}");

        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);
        //get server photo url
        //set user photo url
        toastInfo("Verification e-mail sended.");
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo("PAssword is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo("Email has  already been registered.");
      } else if (e.code == 'user-not-found') {
        toastInfo("USer Not found");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
