
import 'package:crm_project/Screens/drawer_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(243, 243, 243, 1)
      ),
      home: const DrawerPage()
    );
  }
}