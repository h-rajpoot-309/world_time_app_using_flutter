import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart' as intl;

class WorldTime {
  String? location;
  String? time;
  String? flag; // flag url
  String? url; //api endpoint
  String? continent;
  String? city;
  bool? isDayTime;

  WorldTime({this.location, this.flag, this.continent, this.city});

  Future<void> getTime() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          'https://timeapi.io/api/timezone/zone?timeZone=$continent%2F$city',
        ),
        headers: {'Accept': 'application/json'},
      );
      Map data = jsonDecode(response.body);
      //print(data);

      String dateTime = data['currentLocalTime'];
      DateTime now = DateTime.parse(dateTime);

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = intl.DateFormat.jm().format(now);
    } catch (e) {
      print('Error Caught: $e');
      time = 'Could not get Time';
    }
  }
}
