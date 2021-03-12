import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// description:
/// project:
/// @package: network
/// @author: dammyololade
/// created on: 3/11/21

class AppInterceptor extends Interceptor {
  String authToken;

  AppInterceptor(this.authToken);

  Future<FutureOr> onRequest(RequestOptions options) async {
    if (authToken.isNotEmpty) {
      options.headers.addAll({
        "Authorization": "Bearer " + authToken,
      });
    }
    return options;
  }

  Future<FutureOr> onResponse(Response response) async {
    return response;
  }
}
