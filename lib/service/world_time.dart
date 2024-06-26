import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; // location name for the ui
  String? time; // the time in the location
  String? flag; // url to asset flag icon
  String? url; //location url for api endpoint
  bool? isDayTime; // is true or false

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      // get property from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      //set time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
