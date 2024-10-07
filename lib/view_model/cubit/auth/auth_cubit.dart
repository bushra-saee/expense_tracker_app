import 'package:expense_tacker_app/view_model/cubit/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static AuthCubit of(context) => BlocProvider.of<AuthCubit>(context);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthPasswordVisibilityChanged());
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    if (password != confirmPassword) {
      emit(AuthFailure('Passwords do not match.'));
      return;
    }

    emit(AuthLoading());

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure('Registration failed. Please try again.'));
    }
  }
}
