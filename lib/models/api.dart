import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

int port = 5000;

class API {
  static Future<dynamic> _fetchHttpRequest(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load album');
    }
  }

  static Stream _fetchWebSocketStream(String url) {
    return IOWebSocketChannel.connect(Uri.parse(url)).stream;
  }

  static Stream fetchNetworkTableStream() {
    return _fetchWebSocketStream('ws://localhost:$port/networktables');
  }
}
