import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

int counter = 0;

class _ChooseLocationState extends State<ChooseLocation> {
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
        body: ElevatedButton(
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            child: Text('counter is $counter')));
  }
}
