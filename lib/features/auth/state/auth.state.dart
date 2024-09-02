import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ladder/api/models/profile.model.dart';

part 'auth.state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;

  const factory AuthState.signupLoading() = _AuthStateSignupLoading;
  const factory AuthState.signinLoading() = _AuthStateSigninLoading;

  const factory AuthState.signupSuccess() = _AuthStateSignupSuccess;
  const factory AuthState.signinSuccess() = _AuthStateSigninSuccess;

  const factory AuthState.signoutLoading() = _AuthStateSignoutLoading;
  const factory AuthState.signoutSuccess() = _AuthStateSignoutSuccess;

  const factory AuthState.updateUserSuccess() = _AuthStateUpdateUserSuccess;
  const factory AuthState.updateUserLoading() = _AuthStateUpdateUserLoading;

  const factory AuthState.error(String message) = _AuthStateError;

  const factory AuthState.userExists() = _AuthStateUserExists;
  const factory AuthState.newUser() = _AuthStateNewUser;

  const factory AuthState.fetchUserProfileSuccess(ProfileModel profile) = _AuthStateFetchUserProfileSuccess;
  const factory AuthState.fetchUserProfileLoading() = _AuthStateFetchUserProfileLoading;
}
