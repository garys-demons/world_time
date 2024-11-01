import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
 const ChooseLocation({super.key});


 @override
 State<ChooseLocation> createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {


 List<WorldTime> locations = [
   WorldTime(location: 'Amsterdam', flag: 'netherlands.png', url: 'Europe/Amsterdam'),
   WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Berlin'),
   WorldTime(location: 'Auckland', flag: 'nz.png', url: 'Pacific/Auckland'),
   WorldTime(location: 'Bangkok', flag: 'thailand.png', url: 'Asia/Bangkok'),
   WorldTime(location: 'Brussels', flag: 'belgium.png', url: 'Europe/Brussels'),
   WorldTime(location: 'Budapest', flag: 'hungary.png', url: 'Europe/Budapest'),
   WorldTime(location: 'Buenos Aires', flag: 'argentina.png', url: 'America/Argentina/Buenos_Aires'),
   WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
   WorldTime(location: 'Calcutta', flag: 'india.png', url: 'Asia/Calcutta'),
   WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
   WorldTime(location: 'Costa Rica', flag: 'costa_rica.png', url: 'America/Costa_Rica'),
   WorldTime(location: 'Cuba', flag: 'cuba.png', url: 'Cuba'),
   WorldTime(location: 'Dubai', flag: 'uae.png', url: 'Asia/Dubai'),
   WorldTime(location: 'Helsinki', flag: 'finland.png', url: 'Europe/Helsinki'),
   WorldTime(location: 'Hong kong', flag: 'hongkong.png', url: 'Asia/Hong_kong'),
   WorldTime(location: 'Iran', flag: 'iran.png', url: 'Iran'),
   WorldTime(location: 'Istanbul', flag: 'turkey.png', url: 'Asia/Istanbul'),
   WorldTime(location: 'Jamaica', flag: 'jamaica.png', url: 'Jamaica'),
   WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
   WorldTime(location: 'Japan', flag: 'japan.png', url: 'Japan'),
   WorldTime(location: 'Jerusalem', flag: 'israel.png', url: 'Asia/Jerusalem'),
   WorldTime(location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi'),
   WorldTime(location: 'Kiev', flag: 'ukraine.png', url: 'Europe/Kiev'),
   WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
   WorldTime(location: 'Kuwait', flag: 'kuwait.png', url: 'Asia/Kuwait'),
   WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
   WorldTime(location: 'Los Angeles', flag: 'usa.png', url: 'America/Los_Angeles'),
   WorldTime(location: 'Luxembourg', flag: 'luxembourg.png', url: 'Europe/Luxembourg'),
   WorldTime(location: 'Madrid', flag: 'spain.png', url: 'Europe/Madrid'),
   WorldTime(location: 'Melbourne', flag: 'australia.png', url: 'Australia/Melbourne'),
   WorldTime(location: 'Minsk', flag: 'belarus.png', url: 'Europe/Minsk'),
   WorldTime(location: 'Monaco', flag: 'monaco.png', url: 'Europe/Monaco'),
   WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
   WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
   WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
   WorldTime(location: 'Poland', flag: 'poland.png', url: 'Poland'),
   WorldTime(location: 'Portugal', flag: 'portugal.png', url: 'Portugal'),
   WorldTime(location: 'Prague', flag: 'cr.png', url: 'Europe/Prague'),
   WorldTime(location: 'Qatar', flag: 'qatar.png.jpeg', url: 'Asia/Qatar'),
   WorldTime(location: 'Rome', flag: 'italy.png', url: 'Europe/Rome'),
   WorldTime(location: 'San Marino', flag: 'san_marino.png.jpeg', url: 'Europe/San_Marino'),
   WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
   WorldTime(location: 'Shanghai', flag: 'china.png', url: 'Asia/Shanghai'),
   WorldTime(location: 'Singapore', flag: 'singapore.png', url: 'Asia/Singapore'),
   WorldTime(location: 'Stockholm', flag: 'sweden.png', url: 'Europe/Sweden'),
   WorldTime(location: 'Sydney', flag: 'australia.png', url: 'Australia/Sydney'),
   WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
   WorldTime(location: 'Toronto', flag: 'canada.png', url: 'America/Toronto'),
   WorldTime(location: 'Vancouver', flag: 'canada.png', url: 'America/Vancouver'),
 ];


 void updateTime(index) async {
   WorldTime instance = locations[index];
   await instance.getTime();
   //  navigate to home screen
   Navigator.pop(context,{
     'location': instance.location,
   'flag': instance.flag,
   'time': instance.time,
   'isDayTime': instance.isDayTime,
   'date' : instance.date,
   });
 }


 @override
 Widget build(BuildContext context) {


   return Scaffold(
     backgroundColor: const Color.fromARGB(255, 123, 123, 123),
     appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 0, 0, 0),
       title: const Text('Choose a Location'),
       centerTitle: true,
       foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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
               title: Text(
                locations[index].location,
                style: TextStyle(
                  fontFamily: 'Roboto_Condensed-1',
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                ),
                ),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
           ),
         );
       },
     ),
     );
 }
}
