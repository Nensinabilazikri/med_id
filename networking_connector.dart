import 'package:Batch_256/utilities/networking/networking_response.dart';
import 'package:http/http.dart' as http;

class NetworkingConnector {
  // GET request
  Future<NetworkingResponse> getRequest(
      String url, String path, Map<String, String> headerRequest) async {
    try {
      var urlGet = url.indexOf('https') != -1
          ? Uri.https(url.substring(url.indexOf('//') + 2), path)
          : Uri.http(url.substring(url.indexOf('//') + 2), path);
      var response = await http.get(urlGet, headers: headerRequest);

      print('NetworkingResponse :' + response.body);
      return NetworkingSuccess(response.body, response.statusCode);
    } catch (exception) {
      print('NetworkingExcepiton : ' + exception.toString());
      return NetworkingException(exception.toString());
    }
  }

// POST Request
  Future<NetworkingResponse> postRequest(
      String url, Map<String, String> headerRequest, String bodyRequest) async {
    try {
      var response = await http.post(Uri.parse(url),
          headers: headerRequest, body: bodyRequest);
      print('NetworkingResponse :' + response.body);
      return NetworkingSuccess(response.body, response.statusCode);
    } catch (exception) {
      print('NetworkingExcepiton : ' + exception.toString());
      return NetworkingException(exception.toString());
    }
  }
}
