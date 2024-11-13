import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:user_github_borwita/utils/ssl_pinning.dart';

class ApiClient extends IOClient {
  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    return await SslPinning.initIOClient().then((value) => value.get(url));
  }
}
