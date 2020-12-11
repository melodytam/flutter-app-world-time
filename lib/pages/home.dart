import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  Map pData = {}; // hold current data;

  @override
  Widget build(BuildContext context) {

    // do not need to use setstate yet as this is used to declare the variable when the function run at the first time
    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;  // return a map of data (arguments passed to /home route from loading route
    print(data);

    // set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: [
                  FlatButton.icon(
                    onPressed: () async {

                      // assign data to pData (needed if no location is chosen)
                      pData = data;
                      // use a dynamic variable to store the location data of the selected location
                      dynamic result = await Navigator.pushNamed(context, '/location'); //navigate to a named route by pushing the route

                      setState(() {
                        data = (result?.isEmpty?? true) ? pData : result;
                      });


                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
