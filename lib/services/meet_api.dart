import 'package:http/http.dart' as http;
import 'package:clone/util/user.util.dart';

// final String MEETING_API_URL = 'http://<YOUR LOCAL IP>:8081/meeting';
final String MEETING_API_URL = 'https://cloneteams.herokuapp.com/meeting';

Future<http.Response> startMeeting() async {
  var userId = await loadUserId();
  var response = await http
      .post(Uri.parse('$MEETING_API_URL/start'), body: {'userId': userId});
  return response;
}

Future<http.Response> joinMeeting(String meetingId) async {
  var response =
      await http.get(Uri.parse('$MEETING_API_URL/join?meetingId=$meetingId'));
  if (response.statusCode >= 200 && response.statusCode < 400) {
    return response;
  }
  throw UnsupportedError('Not a valid meeting');
}
