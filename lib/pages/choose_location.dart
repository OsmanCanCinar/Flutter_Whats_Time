import 'package:flutter/material.dart';
import 'package:tell_me_the_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: 'Istanbul',
        flag: 'turkey.jpg',
        url: '/api/timezone/Europe/Istanbul'),
    WorldTime(
        location: 'London', flag: 'uk.png', url: '/api/timezone/Europe/London'),
    WorldTime(
        location: 'Athens',
        flag: 'greece.png',
        url: '/api/timezone/Europe/Athens'),
    WorldTime(
        location: 'Cairo',
        flag: 'egypt.png',
        url: '/api/timezone/Africa/Cairo'),
    WorldTime(
        location: 'Nairobi',
        flag: 'kenya.png',
        url: '/api/timezone/Africa/Nairobi'),
    WorldTime(
        location: 'Chicago',
        flag: 'usa.png',
        url: '/api/timezone/America/Chicago'),
    WorldTime(
        location: 'New York',
        flag: 'usa.png',
        url: '/api/timezone/America/New_York'),
    WorldTime(
        location: 'Seoul',
        flag: 'south_korea.png',
        url: '/api/timezone/Asia/Seoul'),
    WorldTime(
        location: 'Jakarta',
        flag: 'indonesia.png',
        url: '/api/timezone/Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
