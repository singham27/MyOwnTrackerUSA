import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import 'dart:typed_data';



class API {
  API._privateConstructor();

  static final API instance = API._privateConstructor();

  final _kBaseURL = 'https://my-own-tracker-usa-backend.vercel.app/';

  Future<bool> _checkInternet() async {
    try {
      showLoaderGetX();
      var connectivityResult = await (Connectivity().checkConnectivity());
      hideLoader();
      if (connectivityResult == ConnectivityResult.mobile) {
        debugPrint('Mobile data is connected');
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        debugPrint('WiFi connected');
        return true;
      } else {
        debugPrint('Internet is not connected');
        'Internet is not connected'.showError();
        return false;
      }
    } catch (error) {
      debugPrint(error.toString());
      error.toString().showError();
      hideLoader();
      return false;
    }
  }

  Future<Map<String, dynamic>?> get({required String endPoint}) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('${_kBaseURL}${endPoint}');

    final headers = {
      'Authorization': 'Bearer $kTOKENSAVED'
    };

    try {
      showLoaderGetX();
      final response = await http.get(url, headers: headers);
      hideLoader();

      final Map parsed = json.decode(response.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      // hideLoader();
      // debugPrint('Exception is:-' + exception.toString());
      // return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> post({ required String endPoint,
      required Map<String, dynamic> params}) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('${_kBaseURL}${endPoint}');
    try {
      showLoaderGetX();
      final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer $kTOKENSAVED'
          },
          body: params);
      hideLoader();
      debugPrint('Response status: ${response.statusCode}');

      final Map parsed = json.decode(response.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      // hideLoader();
      // debugPrint('Exception is:-' + exception.toString());
      // return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> postImage({
    required String endPoint,
    required Map<String, dynamic> params,
    required String fileParams,
    required File file,
  }) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('${_kBaseURL}${endPoint}');
    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $kTOKENSAVED';

    params.forEach((key, value) {
      request.fields[key] = value;
    });

    try {
      showLoaderGetX();

      request.files
          .add(await http.MultipartFile.fromPath(fileParams, file.path));
      final response = await request.send();

      hideLoader();

      // print(response.stream);
      // print(response.statusCode);

      final res = await http.Response.fromStream(response);
      print(res.body);

      final Map parsed = json.decode(res.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      hideLoader();
      debugPrint('Exception is:-' + exception.toString());
      return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }

  postImageData(Uint8List imageData) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('${_kBaseURL}uploadImage');
    final request = http.MultipartRequest('POST', url);

    try {
      showLoaderGetX();

      // request.files.add(await http.MultipartFile.fromPath(fileParams, file.path));

      request.files.add(http.MultipartFile.fromBytes('image', imageData));
      final response = await request.send();

      hideLoader();

      // print(response.stream);
      // print(response.statusCode);

      final res = await http.Response.fromStream(response);
      print(res.body);

      final Map parsed = json.decode(res.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      hideLoader();
      debugPrint('Exception is:-' + exception.toString());
      return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-' + error.toString());
      return null;
    }

  }



}

class APIEndPoints {
  APIEndPoints._privateConstructor();

  static final APIEndPoints instance = APIEndPoints._privateConstructor();

  final kTwilioSendCode = 'twilio/sendCode';
  final kTwilioVerifyCode = 'twilio/verifyCode';
  final kSetPIN = 'users/setmpin';

  final kGetUser = 'users/getUser/';
  final kLogin = 'users/login';
  final kRealtimeExchangeRates = 'fixer/exr/';
  final kFixerConvert = 'fixer/convert';
  final kGetContent = 'contentApp/getContent/';
  final kGetExr = 'fixer/getExr';
}
