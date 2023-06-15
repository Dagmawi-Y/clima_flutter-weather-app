import 'package:flutter/material.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:http/http.dart' as http;

const apiKey = 'ac50e642c12519e8ff3ca1eca5cf431a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$apiKey';
    Uri uri = Uri.parse(url);
    http.Response response = (await http.get(uri)) as http.Response;
    if (response.statusCode == 200) {
      String data = response.body;
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    try {
      getData();
    } catch (e) {
      print(e);
    }
    return Scaffold();
  }
}
