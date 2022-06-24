import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import '../Utils/Global.dart';

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

    // debugPrint('${_kBaseURL}${endPoint}');

    final url = Uri.parse('${_kBaseURL}${endPoint}');
    try {
      showLoaderGetX();
      final response = await http.get(url);
      hideLoader();
      debugPrint('Response status: ${response.statusCode}');

      final Map parsed = json.decode(response.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      hideLoader();
      debugPrint('Exception is:-'+exception.toString());
      return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-'+error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> post({required String endPoint, required Map<String, dynamic> params}) async {
    if (!await _checkInternet()) {
      return null;
    }

    // debugPrint('${_kBaseURL}${endPoint}');
    // debugPrint(params.toString());

    final url = Uri.parse('${_kBaseURL}${endPoint}');
    try {
      showLoaderGetX();
      final response = await http.post(url, body: params);
      hideLoader();
      debugPrint('Response status: ${response.statusCode}');

      final Map parsed = json.decode(response.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      hideLoader();
      debugPrint('Exception is:-'+exception.toString());
      return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-'+error.toString());
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