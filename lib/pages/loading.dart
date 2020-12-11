import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Getting the time and output the time
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async {
    WorldTime instance = WorldTime(location: 'Hong Kong', flag: 'hk.png', url: 'Asia/Hong_Kong');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      // home route can access the following data
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });   //push to home route and replace the current route
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
