import 'package:employee/widgets/page_tittle.dart';
import 'package:employee/widgets/status_text.dart';
import 'package:flutter/material.dart';

class EstadoDelViaje extends StatefulWidget {
  const EstadoDelViaje({super.key});

  @override
  State<EstadoDelViaje> createState() => _EstadoDelViajeState();
}

class _EstadoDelViajeState extends State<EstadoDelViaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const PageTittle(titulo: "Estado del Viaje"),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const TextoDeEstado(titulo: "ETA:\n### SEGUNDOS"),
              const TextoDeEstado(titulo: "Pasajeros\nrecogidos: ###"),
              const Text("Lista de pasajeros"),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("item"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
