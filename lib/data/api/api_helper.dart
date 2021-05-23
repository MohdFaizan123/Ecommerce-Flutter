import 'package:http/http.dart' as http;

class ApiHelper {
  final String baseUrl = "http://205.134.254.135/~mobile/MtProject/api/v1/";

  callApiWithPostMethod(
      {String url, Map<String, String> headers, dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    return response;
  }
}
