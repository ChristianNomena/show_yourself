import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:show_yourself/components/round_button.dart';
import 'package:show_yourself/screens/take_picture_screen.dart';
import 'package:http/http.dart' as http;

import 'loading_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = false;

  void updateLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  void initState() {
    super.initState();
    this.getDataFromInternet();
  }

  void getDataFromInternet() async {
    updateLoading(true);

    final response = await http.get(
      "https://challenge-yourself-app.herokuapp.com/show_yourself_app.php",
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['message']);
      updateLoading(false);
    } else {
      print("Connection refusée");
    }
  }

  void getPictureCam() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: firstCamera),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? LoadingScreen() : homeScreenPage();
  }

  Widget homeScreenPage() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Show Yourself"),
      ),
      body: Center(
        child: RoundButton(
          // =============== Eto ilay camera n tokony hipoitra ===============
          onPressed: getPictureCam,
        ),
      ),
    );
  }
}
