import 'dart:convert';
import 'package:http/http.dart';

/// Method that makes use of the GET operator to make an http request
Future<dynamic> callGet({
  required String url,
  Map<String, String>? headers
}) async {
  final dynamic request = await _apiCall(
      get(
          Uri.parse(url),
          headers: headers
      )
  );
  return request;
}

/// Method that make an http request
Future<dynamic> _apiCall(Future<Response> serviceCall) async {
  try{
    final Response call = await serviceCall;
    final dynamic decodeResponse = jsonDecode(call.body);
    return decodeResponse;
  } on Exception catch (_) {
    return null;
  }
}