import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.formfield.dart';
import 'package:ladder/core/widgets/ladder.text.button.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/features/auth/signup.view.dart';
import 'package:ladder/features/auth/state/auth.bloc.dart';
import 'package:ladder/features/auth/state/auth.event.dart';
import 'package:ladder/features/auth/state/auth.state.dart';
import 'package:ladder/features/auth/widgets/auth.text.dart';
import 'package:ladder/features/home/home.view.dart';
import 'package:ladder/gen/assets.gen.dart';
import 'package:ladder/gen/colors.gen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.onboardingBackground,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.images.loginBubbles.path,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (_, state) => state.maybeMap(
              orElse: () => null,
              error: (state) => showToast(state.message),
              signinSuccess: (state) {
                _clearTextfield(context);
                return Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeView()),
                  (predicate) => true,
                );
              },
            ),
            builder: (_, state) => IgnorePointer(
              ignoring: state.maybeMap(
                orElse: () => false,
                signupLoading: (state) => true,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Login",
                    style: context.appTheme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 32.h),
                  LadderFormField(
                    controller: context.read<AuthBloc>().signinEmailController,
                    hintText: "Email",
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24.h),
                  LadderFormField(controller: context.read<AuthBloc>().signinPasswordController, hintText: "Password"),
                  SizedBox(height: 24.h),
                  LadderTextButton(
                    onPressed: () => validateAndSignin(context),
                    text: "Login",
                    isBusy: state.maybeMap(
                      orElse: () => false,
                      signinLoading: (state) => true,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  LadderAuthText(
                    onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupView()),
                      (predicate) => true,
                    ),
                    gettingStarted: "Getting Started ? ",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSignin(BuildContext context) {
    final email = context.read<AuthBloc>().signinEmailController.value.text;
    final password = context.read<AuthBloc>().signinPasswordController.value.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      context.read<AuthBloc>().add(SigninEvent());
    } else {
      showToast("All fields are required");
    }
  }

  void _clearTextfield(BuildContext context) {
    context.read<AuthBloc>().signinEmailController.clear();
    context.read<AuthBloc>().signinPasswordController.clear();
  }
}
