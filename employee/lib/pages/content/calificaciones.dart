import 'package:flutter/material.dart';

class MisCalificaciones extends StatefulWidget {
  const MisCalificaciones({super.key});

  @override
  State<MisCalificaciones> createState() => _MisCalificacionesState();
}

class _MisCalificacionesState extends State<MisCalificaciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("mi promedio de calificacion es:"),
            Text("PROMEDIO ###")
          ],
        ),
      ),
    );
  }
}
