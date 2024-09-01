import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ladder/core/app/app.theme.dart';
import 'package:ladder/core/widgets/ladder.text.button.dart';
import 'package:ladder/core/widgets/ladder.textfield.dart';
import 'package:ladder/core/widgets/ladder.toast.dart';
import 'package:ladder/features/auth/state/auth.bloc.dart';
import 'package:ladder/features/auth/state/auth.event.dart';
import 'package:ladder/features/auth/state/auth.state.dart';
import 'package:ladder/features/settings/widgets/edit.profile.avatar.dart';
import 'package:ladder/features/settings/widgets/logout.dart';
import 'package:ladder/gen/colors.gen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _isFileSelected = false;
  late ImagePicker _imagePicker;
  XFile? xfile;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  void _handlePickImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _isFileSelected = true;
        xfile = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.onboardingBackground,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 40.h),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (_, state) => state.maybeMap(
                      orElse: () => null,
                      updateUserSuccess: (state) {
                        showToast("profile updated!");
                        _clearTextFields();
                        return;
                      },
                      error: (state) => showToast(state.message),
                    ),
                    builder: (_, state) => IgnorePointer(
                      ignoring: state.maybeWhen(
                        orElse: () => false,
                        updateUserLoading: () => true,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Logout(),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "change profile picture",
                              style: context.appTheme.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                color: ColorName.text,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Align(
                            alignment: Alignment.center,
                            child: LadderProfileAvatar(
                                handlePickImage: _handlePickImage, isFileSelected: _isFileSelected, path: xfile?.path),
                          ),
                          SizedBox(height: 48.h),
                          Text(
                            "Name",
                            style: context.appTheme.textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                              color: ColorName.text,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          LadderTextfield(
                            controller: context.read<AuthBloc>().updateUserNameController,
                            hintText: "name",
                            inputType: TextInputType.text,
                          ),
                          Text(
                            "password",
                            style: context.appTheme.textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                              color: ColorName.text,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          LadderTextfield(
                            controller: context.read<AuthBloc>().updateUserPasswordController,
                            hintText: "Password",
                            inputType: TextInputType.text,
                          ),
                          SizedBox(height: 69.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 56.w),
                            child: LadderTextButton(
                              onPressed: () => validateAndUpdateUser(context),
                              text: "Finish",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndUpdateUser(BuildContext context) {
    final name = context.read<AuthBloc>().updateUserNameController.value.text;
    final password = context.read<AuthBloc>().updateUserPasswordController.value.text;

    if (name.isEmpty || password.isEmpty) {
      showToast("all fields are required");
    } else {
      context.read<AuthBloc>().add(UpdateUserEvent(xfile?.path));
    }
  }

  void _clearTextFields() {
    context.read<AuthBloc>().updateUserNameController.clear();
    context.read<AuthBloc>().updateUserPasswordController.clear();
  }
}
    // 