import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AuthPayLoadModel {
  final String username;
  final String password;
  final String deviceType;
  final String deviceId;
  AuthPayLoadModel({
    required this.username,
    required this.password,
    required this.deviceType,
    required this.deviceId,
  });
}

class AccessToken {
  final String accToken;
  final String rfToken;
  final int exp; // Change type to int

  AccessToken({
    required this.accToken,
    required this.rfToken,
    required this.exp,
  });

  factory AccessToken.fromMap(Map<String, dynamic> map) {
    return AccessToken(
      accToken: map['accToken'],
      rfToken: map['rfToken'],
      exp: map['exp'] as int,
    );
  }
  @override
  String toString() {
    return 'AccessToken(accToken: $accToken, rfToken: $rfToken, exp: $exp)';
  }
}

class LoginResponse {
  final AccessToken tkn;
  final String? loginProxyId; // Change the type if needed
  final String? ssoTkn; // Change the type if needed
  final String? refId; // Change the type if needed
  final String? challengeDetail; // Change the type if needed

  LoginResponse({
    required this.tkn,
    this.loginProxyId,
    this.ssoTkn,
    this.refId,
    this.challengeDetail,
  });
  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      tkn: AccessToken.fromMap(map['tkn'] as Map<String, dynamic>),
      loginProxyId: map['loginProxyId'],
      ssoTkn: map['ssoTkn'],
      refId: map['refId'],
      challengeDetail: map['challengeDetail'],
    );
  }
  @override
  String toString() {
    return 'LoginResponse(tkn: $tkn, loginProxyId: $loginProxyId, ssoTkn: $ssoTkn, refId: $refId, challengeDetail: $challengeDetail)';
  }
}

class ApiResponse {
  final LoginResponse response;
  final Message message;

  ApiResponse({
    required this.response,
    required this.message,
  });

  ApiResponse copyWith({
    LoginResponse? response,
    Message? message,
  }) {
    return ApiResponse(
      response: response ?? this.response,
      message: message ?? this.message,
    );
  }

  @override
  String toString() => 'ApiResponse(response: $response, message: $message)';

  @override
  bool operator ==(covariant ApiResponse other) {
    if (identical(this, other)) return true;

    return other.response == response && other.message == message;
  }

  @override
  int get hashCode => response.hashCode ^ message.hashCode;

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      response: LoginResponse.fromMap(map['response'] as Map<String, dynamic>),
      message: Message.fromMap(map['message'] as Map<String, dynamic>),
    );
  }
}

class Message {
  final String code;
  final List<String>? messageList;

  Message({
    required this.code,
    this.messageList,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      code: json['code'],
      messageList: json['messageList'] != null
          ? List<String>.from(json['messageList'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'messageList': messageList,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      code: map['code'],
      messageList: map['messageList'] != null
          ? List<String>.from(map['messageList'])
          : null,
    );
  }

  @override
  String toString() {
    return 'Message(code: $code, messageList: $messageList)';
  }
}
