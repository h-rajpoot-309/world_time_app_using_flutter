import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      continent: 'Europe',
      city: 'London',
      location: 'London',
      flag: 'uk.png',
    ),
    WorldTime(
      continent: 'Europe',
      city: 'Berlin',
      location: 'Athens',
      flag: 'greece.png',
    ),
    WorldTime(
      continent: 'Africa',
      city: 'Cairo',
      location: 'Cairo',
      flag: 'egypt.png',
    ),
    WorldTime(
      continent: 'Africa',
      city: 'Nairobi',
      location: 'Nairobi',
      flag: 'kenya.png',
    ),
    WorldTime(
      continent: 'America',
      city: 'Chicago',
      location: 'Chicago',
      flag: 'usa.png',
    ),
    WorldTime(
      continent: 'America',
      city: 'New_York',
      location: 'New York',
      flag: 'usa.png',
    ),
    WorldTime(
      continent: 'Asia',
      city: 'Seoul',
      location: 'Seoul',
      flag: 'south_korea.png',
    ),
    WorldTime(
      continent: 'Asia',
      city: 'Jakarta',
      location: 'Jakarta',
      flag: 'indonesia.png',
    ),
    WorldTime(
      continent: 'Asia',
      city: 'Karachi',
      location: 'Karachi',
      flag: 'pakistan.png',
    ),
  ];
  void updateTime(index) async {
    WorldTime temp = locations[index];
    await temp.getTime();
    Navigator.pop(context, {
      'location': temp.location,
      'flag': temp.flag,
      'time': temp.time,
      'isDayTime': temp.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a Location'),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location!),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/${locations[index].flag}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
