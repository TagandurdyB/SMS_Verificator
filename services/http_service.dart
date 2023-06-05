
import 'package:http/http.dart' as http;

class HttpService {
  static void postPhone(String phoneNumber) async {
    const String IP = "https://it.net.tm";
    const String api = "example.com/api/send-message";
    try {
      final url = Uri.parse('$IP/$api/$phoneNumber');
      final response =
          await http.post(url, body: {'phone_number': phoneNumber});
      if (response.statusCode == 200) {
        print('Message sent successfully. $phoneNumber');
      } else {
        print('Failed to send message. $phoneNumber');
      }
    } catch (e) {
      throw ('Error sending message: $e');
    }
  }
}
