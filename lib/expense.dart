import 'package:expense_tacker_app/view/screen/splash/splash_screen.dart';
import 'package:expense_tacker_app/view/screen/home/home_page.dart';
import 'package:expense_tacker_app/view/screen/auth/login_screen.dart';
import 'package:expense_tacker_app/view_model/cubit/auth/auth_cubit.dart';
import 'package:expense_tacker_app/view_model/cubit/theme/theme_cubit.dart';
import 'package:expense_tacker_app/view_model/cubit/theme/theme_state.dart';
import 'package:expense_tacker_app/view_model/themes/dark_theme.dart';
import 'package:expense_tacker_app/view_model/themes/light_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  _ExpenseAppState createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  User? currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  void _checkUserStatus() async {
    await Future.delayed(const Duration(seconds: 4));

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        currentUser = user;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(),
            ),
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final isDark = context.read<ThemeCubit>().isDark;

              return MaterialApp(
                theme: ligtTheme,
                darkTheme: darkTheme,
                themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: isLoading
                    ? const SplashScreen()
                    : (currentUser != null && currentUser!.emailVerified
                        ? const HomePage()
                        : const LoginScreen()),
              );
            },
          ),
        );
      },
    );
  }
}
