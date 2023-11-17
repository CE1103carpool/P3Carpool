import 'package:flutter/material.dart';

class Calificar extends StatefulWidget {
  late final String conductor;
  Calificar({super.key, required conductorNombre}) {
    conductor = conductorNombre;
  }

  @override
  State<Calificar> createState() => _MisCalificacionesState();
}

class _MisCalificacionesState extends State<Calificar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Calificar usuario"), Text(widget.conductor)],
        ),
      ),
    );
  }
}
