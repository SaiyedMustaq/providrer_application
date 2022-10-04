// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
enum Method { POST, GET, PUT, DELETE, PATCH }

// ignore: constant_identifier_names
const BASE_URL = "https://reqres.in/api/";

class NetworkCall {
  static header() => {
        "Content-Type": "application/json",
      };
  final Dio _dio = Dio();
  late Response response;

  Future<Response> request({
    @required BuildContext? context,
    @required String? url,
    @required Method? method,
    Map<String, dynamic>? params,
  }) async {
    String callUrl = url!;
    if (kDebugMode) {
      print('URL WAS $callUrl');
    }
    Response response;
    Map<String, String> headers = {
      "accept": "text/plain",
    };

    try {
      if (method == Method.POST) {
        response = await _dio.post(
          callUrl,
          data: params,
        );
      } else if (method == Method.DELETE) {
        response = await _dio.delete(
          callUrl,
        );
      } else if (method == Method.PATCH) {
        response = await _dio.patch(
          callUrl,
        );
      } else {
        response = await _dio.get(
          callUrl,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('$e');
      }

      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      if (kDebugMode) {
        print('$e');
      }
      throw Exception("Bad response format");
    } on DioError catch (e) {
      if (kDebugMode) {
        print('$e');
      }
      throw Exception(e);
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
      throw Exception("Something wen't wrong");
    }
  }

  dynamic returnResponseJson(http.Response response, BuildContext? context) {
    log('${DateTime.now()}', name: 'Call Date Time');
    // ignore: prefer_typing_uninitialized_variables
    late var responseReturn;
    switch (response.statusCode) {
      case 200:
        responseReturn = jsonDecode(response.toString());
        log('STATUS 200 ==>>>> ${response.toString()}');
        return responseReturn;
      case 400:
        log('400 - - - -${response.statusCode}');
        throw '';
      case 401:
      case 403:
        log('401 403- - - -${response.statusCode}');
        responseReturn = jsonDecode(response.body);
        throw '';
      case 426:
        throw ('Error code : 426');
      case 500:
        responseReturn = jsonDecode(response.body);
        log('Error 500', error: response.body.toString(), name: '500');
        throw ('Error occurred while communicate with Status code :${response.statusCode} ');
      case 503:
        throw ('Error code : 503');
    }
  }

  getPhotos(int page, String search) async {
    response = await _dio.get(
        "https://api.pexels.com/v1/search?query=$search&per_page=10&page=$page",
        options: Options(headers: {
          'Authorization':
              'Bearer 563492ad6f91700001000001be35d0817762410abbb548e153642e4e'
        }));
    if (kDebugMode) {
      print(response.data);
    }
    return response.data;
  }

  getVideos(int page, String search) async {
    response = await _dio.get(
        "https://api.pexels.com/videos/search?query=$search&per_page=10&page=$page",
        options: Options(headers: {
          'Authorization':
              'Bearer 563492ad6f91700001000001be35d0817762410abbb548e153642e4e'
        }));
    if (kDebugMode) {
      print(response.data);
    }
    return response.data;
  }

  Future<Response> sendFile(String url, File file) async {
    var len = await file.length();
    var response = await _dio.post(url,
        data: file.openRead(),
        options: Options(headers: {
          Headers.contentLengthHeader: len,
        } // set content-length
            ));
    return response;
  }

  Future<Response> sendForm(
    String url,
    Map<String, dynamic> data,
    Map<String, File> files,
  ) async {
    Map<String, MultipartFile> fileMap = {};
    for (MapEntry fileEntry in files.entries) {
      File file = fileEntry.value;
      String fileName = file.path.split('').last;
      fileMap[fileEntry.key] = MultipartFile(
          file.openRead(), await file.length(),
          filename: fileName);
    }
    data.addAll(fileMap);
    var formData = FormData.fromMap(data);

    return await _dio.post(
      url,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
  }
}
