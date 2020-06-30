import 'package:disenos_app/src/pages/animaciones_page.dart';
import 'package:disenos_app/src/pages/circular_progress_page.dart';
import 'package:disenos_app/src/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';

// import 'package:disenos_app/src/pages/headers_page.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: CircularProgessPage()
    );
  }
}