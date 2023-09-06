import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_selling_shop/pages/sign_in/notifiers/sign_in_state.dart';

//stateNotifier saves state
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());

  void onUserEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onUserPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  return SignInNotifier();
});
