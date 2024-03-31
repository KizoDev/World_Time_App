import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings?.arguments as Map;
    //print(data);

    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'night.webp';
    Color bgcolor =
        data['isDayTime'] ? Color.fromARGB(255, 23, 44, 84) : Colors.black12;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/day.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': double.tryParse("${result['time']}"),
                          'location': double.tryParse("${result['location']}"),
                          'isDayTime':
                              double.tryParse("${result['isDayTime']}"),
                          'flag': double.tryParse("${result['flag']}")

                          // 'time': result?['time'],
                          // 'location': result?['location'],
                          // 'isDayTime': result?['isDayTime'],
                          // 'flag': result?['flag']
                        };
                      });
                    },
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.pink,
                    ),
                    label: const Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.red),
                    )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                        style: const TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.amber))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66.0, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
