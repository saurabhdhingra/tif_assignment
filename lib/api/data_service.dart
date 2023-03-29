import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tif_assignment/api/constants.dart';
import 'package:tif_assignment/models/event.dart';
import 'exceptions.dart';

class DataService {
  final ApiService service = ApiService();

  List<Event> decodeData(dynamic responseBody) {
    final parsed = responseBody.cast<Map<String, dynamic>>();
    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }

  Future fetchDataList() async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(service.backend + service.allEvents),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Connection': 'keep-alive'
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Request timed out.');
    }
    return decodeData(responseJson["content"]["data"]);
  }

  Future fetchSearchResult(String query) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse('${service.backend}${service.allEvents}?search=$query'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Connection': 'keep-alive'
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Request timed out.');
    }
    return decodeData(responseJson["content"]["data"]);
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
