abstract class AuthEvent {}

class SignupEvent extends AuthEvent {}

class SigninEvent extends AuthEvent {}

class UpdateUserEvent extends AuthEvent {
  String? profileFilePath;
  UpdateUserEvent(this.profileFilePath);
}

class SignoutEvent extends AuthEvent {}

class AppStartedEvent extends AuthEvent {}

class FetchUserProfileEvent extends AuthEvent {}
