import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ladder/api/usecases/check.auth.status.dart';
import 'package:ladder/api/usecases/fetch.user.profile.dart';
import 'package:ladder/api/usecases/signin.dart';
import 'package:ladder/api/usecases/signout.dart';
import 'package:ladder/api/usecases/signup.dart';
import 'package:ladder/api/utils/helpers.dart';
import 'package:ladder/features/auth/state/auth.event.dart';
import 'package:ladder/features/auth/state/auth.state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Signin signin;
  final Signup signup;
  final Signout signout;
  // final UpdateUser updateUser;
  final CheckAuthStaus checkAuthStaus;
  final FetchUserProfile fetchUserProfile;

  final signinEmailController = TextEditingController();
  final signinPasswordController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupNameController = TextEditingController();
  final updateUserNameController = TextEditingController();
  final updateUserPasswordController = TextEditingController();

  AuthBloc({
    required this.signin,
    required this.signup,
    required this.signout,
    // required this.updateUser,
    required this.checkAuthStaus,
    required this.fetchUserProfile,
  }) : super(const AuthState.initial()) {
    on<SignupEvent>(_signupUser);
    on<SigninEvent>(_signinUser);
    // on<UpdateUserEvent>(_updateUser);
    on<SignoutEvent>(_signout);
    on<AppStartedEvent>(_checkAuthStatus);
    on<FetchUserProfileEvent>(_fetchUserProflie);
  }

  void _signinUser(SigninEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.signinLoading());

    final result = await signin(
      SigninParam(
        email: signinEmailController.value.text,
        password: signinPasswordController.value.text,
      ),
    );

    result.fold(
      (l) => emit(AuthState.error(l.message)),
      (r) => emit(const AuthState.signinSuccess()),
    );
  }

  void _signupUser(SignupEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.signupLoading());

    final result = await signup(
      SignupParam(
        email: signupEmailController.value.text,
        name: signupNameController.value.text,
        password: signupPasswordController.value.text,
      ),
    );

    result.fold(
      (l) => emit(AuthState.error(l.message)),
      (r) => emit(const AuthState.signupSuccess()),
    );
  }

  void _signout(SignoutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.signoutLoading());

    final result = await signout(const NoParam());

    result.fold(
      (l) => emit(AuthState.error(l.message)),
      (r) => emit(const AuthState.signoutSuccess()),
    );
  }

  // void _updateUser(UpdateUserEvent event, Emitter<AuthState> emit) async {
  //   emit(const AuthState.updateUserSuccess());

  //   final result = await updateUser(
  //     UpdateUserParam(
  //       name: updateUserNameController.value.text,
  //       profileFilePath: event.profileFilePath,
  //     ),
  //   );

  //   result.fold(
  //     (l) => emit(AuthState.error(l.message)),
  //     (r) => emit(const AuthState.updateUserSuccess()),
  //   );
  // }

  void _checkAuthStatus(AppStartedEvent event, Emitter<AuthState> emit) async {
    final result = await checkAuthStaus(const NoParam());

    result.fold(
      (l) => emit(const AuthState.newUser()),
      (r) => emit(const AuthState.userExists()),
    );
  }

  void _fetchUserProflie(FetchUserProfileEvent event, Emitter<AuthState> emit) async {
    final result = await fetchUserProfile(const NoParam());

    result.fold(
      (l) => emit(AuthState.error(l.message)),
      (r) => emit(AuthState.fetchUserProfileSuccess(r)),
    );
  }
}
