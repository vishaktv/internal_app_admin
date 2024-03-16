part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthApiInitial extends AuthState {}

final class AuthApiPending extends AuthState {}

final class AuthApifullfilled extends AuthState {}

final class AuthRejected extends AuthState {
  final DioException err;

  AuthRejected(this.err);
}

final class AuthInvalidCredentials extends AuthState {}

final class userIsLoggedIn extends AuthState {}

final class userIsNotLoggedIn extends AuthState {}
