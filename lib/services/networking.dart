import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final Uri url;

  Future getData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // Process the response data
      var data = response.body;
      return data;
    } else {
      // Handle the error
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
