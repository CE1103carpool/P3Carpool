import 'package:employee/pages/content/estado_Viaje.dart';
import 'package:employee/widgets/driver_card.dart';
import 'package:employee/widgets/origen_destino.dart';
import 'package:employee/widgets/page_tittle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SollicitarConductor extends StatefulWidget {
  const SollicitarConductor({super.key});

  @override
  State<SollicitarConductor> createState() => _SollicitarConductorState();
}

late bool ready;
late Color colorBotton;

class _SollicitarConductorState extends State<SollicitarConductor> {
  @override
  void initState() {
    super.initState();
    ready = false;
    colorBotton = Color.fromARGB(255, 122, 122, 130);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const PageTittle(titulo: "Preparando Viaje"),
              const OrigenDestino(origen: "CasaA", destino: "Empresa"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Información de Conductor",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const DriverCard(),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => VerViaje(context),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.1,
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        decoration: BoxDecoration(
                          color: colorBotton,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Cargando....",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                  color:
                                      Theme.of(context).colorScheme.background),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: MediaQuery.of(context).size.height * 0.08,
                              color: Theme.of(context).colorScheme.background,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  VerViaje(BuildContext context) {
    if (!ready) {
      setState(() {
        colorBotton = Color.fromARGB(255, 17, 17, 107);
        ready = !ready;
      });
    } else {
      /*print("hola");
      return http.post(
        Uri.parse('https://rstest2.montero.tk/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': "hola",
        }),
      );*/
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EstadoDelViaje(),
        ),
      );
    }
  }
}
