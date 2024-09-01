import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/features/auth/signup.view.dart';
import 'package:ladder/features/auth/state/auth.bloc.dart';
import 'package:ladder/features/auth/state/auth.state.dart';
import 'package:ladder/features/settings/widgets/show.logout.confirmation.dart';
import 'package:ladder/gen/colors.gen.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) => state.maybeMap(
          orElse: () => null,
          signoutLoading: (state) => showToast("Logging out..."),
          signoutSuccess: (state) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const SignupView()),
              (predicate) => true,
            );
            return;
          },
          error: (state) => showToast(state.message)),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => showLogoutConfirmationDialog(context),
          child: Text(
            "Logout",
            style: context.appTheme.textTheme.displayLarge?.copyWith(
              fontSize: 20,
              color: ColorName.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
