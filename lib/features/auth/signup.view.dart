import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/widgets/ladder.formfield.dart';
import 'package:ladder/core/widgets/ladder.text.button.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/features/auth/login.view.dart';
import 'package:ladder/features/auth/state/auth.bloc.dart';
import 'package:ladder/features/auth/state/auth.event.dart';
import 'package:ladder/features/auth/state/auth.state.dart';
import 'package:ladder/features/auth/validators/auth.validators.dart';
import 'package:ladder/features/auth/widgets/auth.text.dart';
import 'package:ladder/features/home/home.view.dart';
import 'package:ladder/gen/assets.gen.dart';
import 'package:ladder/gen/colors.gen.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: ColorName.onboardingBackground,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.images.loginBubbles.path,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (_, state) => state.maybeMap(
            orElse: () => null,
            error: (state) => showToast(state.message),
            signupSuccess: (state) {
              _clearTextfield(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeView()),
                (predicate) => true,
              );
              return;
            },
            userExists: (state) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeView()),
                (predicate) => true,
              );
              return;
            },
          ),
          builder: (_, state) => IgnorePointer(
            ignoring: state.maybeMap(
              orElse: () => false,
              signupLoading: (state) => true,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 120.h),
                    Text(
                      "Sign up",
                      style: theme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 32.h),
                    LadderFormField(
                      controller: context.read<AuthBloc>().signupNameController,
                      hintText: "Name",
                    ),
                    SizedBox(height: 24.h),
                    LadderFormField(
                      controller: context.read<AuthBloc>().signupEmailController,
                      hintText: "Email",
                      type: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 24.h),
                    LadderFormField(
                      controller: context.read<AuthBloc>().signupPasswordController,
                      hintText: "Password",
                      hasSuffixIcon: true,
                      obscureText: obscureText,
                      onToggleObscureText: toggleObscureText,
                    ),
                    SizedBox(height: 102.h),
                    LadderTextButton(
                      onPressed: () => validateAndSignup(context),
                      text: "Sign up",
                      isBusy: state.maybeMap(
                        orElse: () => false,
                        signupLoading: (state) => true,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    LadderAuthText(
                        text: "Log-in",
                        onTap: () {
                          _clearTextfield(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const Login()),
                            (predicate) => true,
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSignup(BuildContext context) {
    final name = context.read<AuthBloc>().signupNameController.value.text;
    final email = context.read<AuthBloc>().signupEmailController.value.text;
    final password = context.read<AuthBloc>().signupPasswordController.value.text;

    final result = AuthValidator.validateSignupFields(email: email, password: password, name: name);
    if (result.isValid) {
      context.read<AuthBloc>().add(SignupEvent());
    } else {
      showToast(result.message!);
    }
  }

  void _clearTextfield(BuildContext context) {
    context.read<AuthBloc>().signupNameController.clear();
    context.read<AuthBloc>().signupEmailController.clear();
    context.read<AuthBloc>().signupPasswordController.clear();
  }
}
