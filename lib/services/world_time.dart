import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {


 late String location; // location name for the UI
 late String time; // the time in that location
 late String flag; // url to an asset flag icon
 late String url; // location url for api endpoint
 bool isDayTime = true; // true or false if day time or night
 late String date;


 WorldTime({required this.location, required this.flag, required this.url});


 Future<void> getTime() async {


   try {
     // make the request
     final response = await http.get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url')).timeout(Duration(seconds: 10));


       Map data = jsonDecode(response.body);

      //  get properties from data
      String dateTimeString = data['dateTime'];
      date = data['date'];

     // Parse datetime and add offset
     DateTime now = DateTime.parse(dateTimeString);

       // set the time property
       isDayTime = (now.hour > 6 && now.hour < 20);
       time = DateFormat.jm().format(now);


   } catch (e) {
     // Handle any exceptions that may occur
     print('caught error: $e');
     time= 'could not get the time';
     isDayTime= false;
   }
 }


}


WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');