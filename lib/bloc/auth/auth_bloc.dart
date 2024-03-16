// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

import 'package:internal_app/model/apimodel.dart';
import 'package:internal_app/model/auth_api_model.dart';

import '../../repository/api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiRepository apiRepository = ApiRepository();
  final _storage = const FlutterSecureStorage();
  AuthBloc() : super(AuthApiInitial()) {
    on<LoginEvent>(loginHandler);
    on<AuthSessionHandlingEvent>(authSessionHandler);
  }

  Future<void> loginHandler(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthApiPending());
    try {
      final credentials = AuthPayLoadModel(
          username: event.username,
          password: event.password,
          deviceType: "WEB",
          deviceId: "1234678");
      final Response<APIModel<LoginResponse>> response =
          await apiRepository.login(credentials);
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data?.response != null) {
        final APIModel<LoginResponse> res =
            response.data as APIModel<LoginResponse>;
        final AccessToken tkn = res.response.tkn;
        await _storage.write(key: "accToken", value: tkn.accToken);

        emit(AuthApifullfilled());
        emit(userIsLoggedIn());
      }
    } on DioException catch (err) {
      if (err.response != null && err.response?.statusCode == 401) {
        emit(AuthInvalidCredentials());
      } else {
        emit(AuthRejected(err));
      }
    }
  }

  Future<void> authSessionHandler(
      AuthSessionHandlingEvent event, Emitter<AuthState> emit) async {
    String? value = await _storage.read(key: "accToken");
    if (value != null) {
      emit(userIsLoggedIn());
    } else {
      emit(userIsNotLoggedIn());
    }
  }
}
