import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ladder/api/network/parse.networ.response.dart';
import 'package:ladder/api/platform/app.strings.dart';
import 'package:ladder/api/store/ladder.store.dart';
import 'package:ladder/api/utils/api.errors.dart';

abstract class NetworkService {
  Future<ParsedNetworkResponse> getHttp(
    String endpoint, {
    Map<String, dynamic>? data,
    dynamic headers,
  });
  Future<ParsedNetworkResponse> post(
    String endpoint, {
    Map<String, dynamic>? data,
    dynamic headers,
  });
  Future<ParsedNetworkResponse> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  });
  Future<ParsedNetworkResponse> put(
    String endpoint, {
    Map<String, dynamic>? data,
    dynamic headers,
    bool isPatch = false,
  });
}

class NetworkServiceImpl implements NetworkService {
  final Dio _dio;
  final HiveStore _hiveStore;

  NetworkServiceImpl(this._dio, this._hiveStore) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add authorization token
        if (!options.headers.containsKey('Authorization') ||
            options.headers['Authorization'].toString().contains('null')) {
          final token = await _hiveStore.readItem("accessToken", "accessToken");

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          RequestOptions options = error.response!.requestOptions;

          if (options.extra['retry'] == null) {
            options.extra['retry'] = true;

            try {
              final token = await refreshToken();
              if (token != null) {
                options.headers['Authorization'] = 'Bearer $token';

                // Retry the request with the new token
                final cloneRequest = await _dio.fetch(options);
                return handler.resolve(cloneRequest);
              } else {
                return handler.reject(DioException(
                  requestOptions: options,
                  error: 'Token refresh failed, please re-login.',
                ));
              }
            } catch (e) {
              // Handle refresh token failure
              return handler.reject(DioException(
                requestOptions: options,
                error: 'Token refresh failed: ${e.toString()}',
              ));
            }
          } else {
            return handler.reject(DioException(
              requestOptions: options,
              error: 'Token refresh failed or retry limit reached.',
            ));
          }
        } else {
          debugPrint(error.response?.statusCode.toString());
        }
        return handler.next(error);
      },
    ));
  }

  @override
  Future<ParsedNetworkResponse> delete(String endpoint, {Map<String, dynamic>? data, dynamic headers}) async {
    try {
      final response = await _dio.delete(endpoint, data: data, options: Options(headers: headers));
      return _handleApiResponse(response);
    } on DioException catch (e) {
      return _handleApiResponse(e.response, error: e);
    } catch (e) {
      return ParsedNetworkResponse(code: ApiErrors.failure, message: e.toString());
    }
  }

  @override
  Future<ParsedNetworkResponse> getHttp(String endpoint, {Map<String, dynamic>? data, dynamic headers}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: data, options: Options(headers: headers));
      return _handleApiResponse(response);
    } on DioException catch (e) {
      return _handleApiResponse(e.response, error: e);
    } catch (e) {
      return ParsedNetworkResponse(code: ApiErrors.failure, message: e.toString());
    }
  }

  @override
  Future<ParsedNetworkResponse> post(String endpoint, {Map<String, dynamic>? data, dynamic headers}) async {
    try {
      final response = await _dio.post(endpoint, data: data, options: Options(headers: headers));
      return _handleApiResponse(response);
    } on DioException catch (e) {
      return _handleApiResponse(e.response, error: e);
    } catch (e) {
      return ParsedNetworkResponse(code: ApiErrors.failure, message: e.toString());
    }
  }

  @override
  Future<ParsedNetworkResponse> put(
    String endpoint, {
    Map<String, dynamic>? data,
    dynamic headers,
    bool isPatch = false,
  }) async {
    try {
      final response = isPatch
          ? await _dio.patch(endpoint, data: data, options: Options(headers: headers))
          : await _dio.put(endpoint, data: data, options: Options(headers: headers));

      return _handleApiResponse(response);
    } on DioException catch (e) {
      return _handleApiResponse(e.response, error: e);
    } catch (e) {
      return ParsedNetworkResponse(code: ApiErrors.failure, message: e.toString());
    }
  }

  ParsedNetworkResponse _handleApiResponse(Response? response, {DioException? error}) {
    if (error?.type == DioExceptionType.sendTimeout && error?.error is SocketException) {
      return ParsedNetworkResponse(code: ApiErrors.noInternet, message: AppStrings.noInternetMessage);
    }

    if (response == null) {
      return ParsedNetworkResponse(code: ApiErrors.noResponse, message: AppStrings.noResponseMessage);
    }

    if (response.statusCode.toString().startsWith('2')) {
      // SMALL DEBUGGING
      // print(".......entered here or not");
      // print(".......... response has data or not ${response.data}");
      return ParsedNetworkResponse(data: response.data);
    }

    final parsedResponse = ParsedNetworkResponse(data: response.data, message: response.statusMessage);

    switch (response.statusCode) {
      case 400:
        parsedResponse.code = ApiErrors.badRequest;
        break;
      case 401:
        parsedResponse.code = ApiErrors.unauthenticated;
        break;
      case 403:
        parsedResponse.code = ApiErrors.notPermitted;
        break;
      case 404:
        parsedResponse.code = ApiErrors.notFound;
        break;
      case 422:
        parsedResponse.code = ApiErrors.validationFailed;
        break;
      case 500:
        parsedResponse.code = ApiErrors.serverError;
        break;
      default:
        parsedResponse.code = ApiErrors.unknown;
    }

    assert(parsedResponse.code != null);
    assert(parsedResponse.code is ApiErrors);

    assert(parsedResponse.message != null);
    assert(parsedResponse.message is String);

    return parsedResponse;
  }

  Future<String?> refreshToken() async {
    try {
      // fetch from hive to make a login request
      final email = await _hiveStore.readItem("email", "email");
      final password = await _hiveStore.readItem("password", "password");

      if (email != null && password != null) {
        final data = {"email": email, "password": password};
        final res = await post("/auth/login", data: data);

        if (res.data != null) {
          // update token
          final token = res.data!["accessToken"];
          await _hiveStore.saveItem(token, "accessToken", key: "accessToken");
          return token;
        } else {
          throw ApiFailure('Failed to obtain new access token');
        }
      } else {
        throw ApiFailure('Email or password is null');
      }
    } catch (e) {
      return null; // Return null to indicate failure
    }
  }
}
