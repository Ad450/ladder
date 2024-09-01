import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.state.providers.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/features/auth/signup.view.dart';

class Ladder extends StatelessWidget {
  const Ladder({super.key});

  final designSize = const Size(375, 812);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        dashboardBloc,
        expensesBloc,
        metricsBloc,
        authBloc,
      ],
      child: ScreenUtilInit(
        designSize: designSize,
        child: MaterialApp(
          home: const SignupView(),
          theme: AppTheme().materialLightTheme,
          title: "Ladder",
        ),
      ),
    );
  }
}
