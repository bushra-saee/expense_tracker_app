import 'package:expense_tacker_app/view/screen/auth/signUp_screen.dart.dart';
import 'package:expense_tacker_app/view/screen/home/home_page.dart';
import 'package:expense_tacker_app/view_model/cubit/auth/auth_cubit.dart';
import 'package:expense_tacker_app/view_model/cubit/auth/auth_state.dart';
import 'package:expense_tacker_app/view_model/utils/app_assets.dart';
import 'package:expense_tacker_app/view_model/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final authCubit = BlocProvider.of<AuthCubit>(context);
              return ListView(
                padding: EdgeInsets.all(25.sp),
                children: [
                  Image.asset(
                    AppAsset.logo,
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: authCubit.emailController,
                    decoration: const InputDecoration(
                      hintText: "Enter your email address",
                      labelText: "Email",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: authCubit.passwordController,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          authCubit.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          authCubit.togglePasswordVisibility();
                        },
                      ),
                    ),
                    obscureText: !authCubit.isPasswordVisible,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigation.push(context, const HomePage());
                      } else if (state is AuthFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Visibility(
                        visible: state is! AuthLoading,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            authCubit.login(
                              authCubit.emailController.text,
                              authCubit.passwordController.text,
                            );
                          },
                          child: const Text(
                            "Login",
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigation.push(context, const RegisterScreen());
                    },
                    child: const Text("Register"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
