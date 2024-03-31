import 'package:flutter/material.dart';
import 'package:world_time_app/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'NG.jpeg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'FD.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'SP.png')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    print('initstate function ran');
  }

  @override
  Widget build(BuildContext context) {
    print('initstate function ran');
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {},
                title: Text(locations[index].location!),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}')),
              ),
            ),
          );
        },
      ),
    );
  }
}
