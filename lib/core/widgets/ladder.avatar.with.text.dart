import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/features/auth/state/auth.bloc.dart';
import 'package:ladder/features/auth/state/auth.event.dart';
import 'package:ladder/features/auth/state/auth.state.dart';
import 'package:ladder/gen/colors.gen.dart';

class LadderAvatarWithText extends StatefulWidget {
  const LadderAvatarWithText({required this.name, this.fontSize, this.radius, super.key});
  final String name;
  final double? radius;
  final double? fontSize;

  @override
  State<LadderAvatarWithText> createState() => _LadderAvatarWithTextState();
}

class _LadderAvatarWithTextState extends State<LadderAvatarWithText> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(FetchUserProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (_, state) {
        final profileImagePath = state.maybeMap(
          orElse: () => null,
          fetchUserProfileSuccess: (state) => state.profile.profilePath,
        );

        return Row(
          children: <Widget>[
            CircleAvatar(
              radius: widget.radius ?? 24,
              backgroundColor: ColorName.multiline,
              backgroundImage:
                  (profileImagePath != null && profileImagePath.isNotEmpty) ? FileImage(File(profileImagePath)) : null,
              child: (profileImagePath == null || profileImagePath.isEmpty)
                  ? const Icon(Icons.person, size: 20, color: ColorName.background)
                  : null,
            ),
            SizedBox(width: 8.w),
            Text(
              state.maybeMap(
                orElse: () => "username",
                fetchUserProfileSuccess: (state) => state.profile.name ?? "username",
              ),
              style: context.appTheme.textTheme.titleMedium?.copyWith(
                fontSize: widget.fontSize ?? 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        );
      },
    );
  }
}
