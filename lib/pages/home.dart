import 'package:flutter/material.dart';


class Home extends StatefulWidget {
 const Home({super.key});


 @override
 State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {


 Map data = {};


 @override
 Widget build(BuildContext context) {


   final routeData = ModalRoute.of(context)?.settings.arguments;
   if (routeData != null && routeData is Map) {
     data = data.isNotEmpty ? data : routeData;
     // print(data);
   }


   //set background
   String bgImage = data['isDayTime'] ? 'Day.png' : 'night.png';


   return Scaffold(
     body: SafeArea(
       child: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/$bgImage'),
             fit: BoxFit.cover)
         ),
         child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
           child: Column(
             children: [
               TextButton.icon(
                 onPressed: () async {
                   dynamic result = await  Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'time': result['time'],
                       'location' : result['location'],
                       'isDayTime' : result['isDayTime'],
                       'flag' : result['flag'],
                       'date' : result['date'],
                     };
                   });
                 },
                 label: const Text(
                   'Edit Location',
                   style: TextStyle(
                     color: Color.fromARGB(255, 203, 203, 203),
                     fontFamily: 'Roboto_Condensed-1', 
                   ),
                   ),
                 icon: const Icon(
                   Icons.edit_location,
                   color: Color.fromARGB(255, 203, 203, 203),
                   ),
                 ),
                 SizedBox(height: 20.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       data['location'],
                       style: TextStyle(
                         fontSize: 30.0,
                         letterSpacing: 2.0,
                         color: Colors.white,
                         fontFamily: 'Roboto_Condensed-1',
                       ),
                     )
                   ],
                   ),
                   SizedBox(height: 20.0,),
                   Text(
                    data['date'],
                    style: TextStyle(
                      fontFamily: 'Roboto_Condensed-1',
                      fontSize: 30.0,
                      color: Colors.white,
                    ),),
                   Text(
                     data['time'],
                     style: TextStyle(
                       fontSize: 60.0,
                       color: Colors.white,
                       fontFamily: 'Roboto_Condensed-1',
                     ),
                   )
             ],
           ),
         ),
       )
       ),
   );
 }
}
