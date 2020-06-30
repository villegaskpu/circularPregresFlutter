import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgessPage extends StatefulWidget {
  CircularProgessPage({Key key}) : super(key: key);

  @override
  _CircularProgessPageState createState() => _CircularProgessPageState();
}

class _CircularProgessPageState extends State<CircularProgessPage> with SingleTickerProviderStateMixin{
  double porsentaje = 0.0;
  double nuevoPorsentaje = 0.0;
  AnimationController controller;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() { 
      // print('valor controller :${controller.value}');
      
      setState(() {
        porsentaje = lerpDouble(porsentaje, nuevoPorsentaje, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Container(
        height: 300,
        width: 300,
        padding: EdgeInsets.all(5.0),
        // color: Colors.red,
        child: CustomPaint(
          painter: _MiRadialPainter(porsentaje),
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.refresh),
      backgroundColor: Colors.pink,
      onPressed: () {
        porsentaje = nuevoPorsentaje;
        nuevoPorsentaje += 10;
        if (nuevoPorsentaje >=100){
          nuevoPorsentaje = 0;
          porsentaje = 0;
        }
        controller.forward(from: 0.0);
        setState(() {});
      } ,
    ),
    );
  }
}

class  _MiRadialPainter extends CustomPainter {
  final porsentaje;
  _MiRadialPainter(this.porsentaje);
  @override
  void paint(Canvas canvas, Size size) {
    // circulo completado 
    
    final paint = new Paint()
    ..strokeWidth = 4
    ..color       = Colors.grey
    ..style       = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius  = min(size.width*0.5, size.height*0.5); 

    canvas.drawCircle(center, radius, paint);

    // arco
    final paintArco = new Paint()
    ..strokeWidth = 10
    ..color       = Colors.pink
    ..style       = PaintingStyle.stroke;

    // parte que se debera ir llenando
    double arcAngule = 2*pi*(porsentaje/100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -pi/2, 
      arcAngule, 
      false, 
      paintArco
      );
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

} 