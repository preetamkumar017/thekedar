import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thekedar/models/login/login_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  Future<Result> getData()
  async {
    Result result = Result();
    SharedPreferences sp = await SharedPreferences.getInstance();
    final resultJsonString = sp.getString('result');

    if (resultJsonString != null) {
      final resultJson = jsonDecode(resultJsonString);
       result = Result.fromJson(resultJson); // Assuming you have a fromJson() constructor in the Result class
      // Now, 'result' contains your deserialized Result object
    }
    return result ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Container(
              child: Text(snapshot.data!.mobileNo ?? ""),
            );
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
