import 'package:flutter/material.dart';

class DriverCard extends StatefulWidget {
  late final String tipoConductor;
  DriverCard({super.key, required String tipoViaje}) {
    tipoConductor = tipoViaje;
  }

  @override
  State<DriverCard> createState() => _DriverCardState();
}

class _DriverCardState extends State<DriverCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          children: [
            Text("Buscando conductores...."),
            Text(widget.tipoConductor)
          ],
        ),
      ),
    );
  }
}
