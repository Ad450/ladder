import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/features/auth/state/auth.bloc.dart';
import 'package:ladder/features/auth/state/auth.event.dart';

import 'package:ladder/gen/colors.gen.dart';

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorName.white,
          title: Text(
            'Confirm Logout',
            style: context.appTheme.textTheme.displayMedium?.copyWith(
              fontSize: 25,
              color: ColorName.onBackground,
            ),
          ),
          content: Text(
            'All saved transactions would be deleted',
            style: context.appTheme.textTheme.displayMedium?.copyWith(
              fontSize: 20,
              color: ColorName.onBackground,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog and stay on the current page
                Navigator.pop(context);
              },
              child: const Text('Stop'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<AuthBloc>().add(SignoutEvent());
              },
              child: const Text('Continue'),
            ),
          ],
        );
      });
}
