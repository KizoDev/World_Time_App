import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String? location; // location name for the ui
  String? time; // the time in the location
  String? flag; // url to asset flag icon
  String? url; //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url' as Uri);
      Map data = jsonDecode(response.body);

      // get property from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print(datetime);
      //create datatime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      time = now.toString();
    } catch (e) {
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}
