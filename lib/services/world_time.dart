import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  WorldTime({required this.location, required this.flag, required this.url});

  final String authority = 'worldtimeapi.org';

  String location =
      ""; // location name that will be display in UI //late or final
  String flag = ""; // url to an asset flag icon
  String url = ""; // location url for api endpoint
  String time = ""; // current time in that location
  late bool isDayTime;

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.http(authority, url));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      DateTime now = DateTime.parse(dateTime);

      String offset =
          data['utc_offset'].substring(1, 3); //to remove + sign and empty space
      now = now.add(Duration(hours: int.parse(offset)));

      if (now.hour > 6 && now.hour < 19) {
        isDayTime = true;
      } else {
        isDayTime = false;
      }

      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not fetch data!';
    }
  }
}
