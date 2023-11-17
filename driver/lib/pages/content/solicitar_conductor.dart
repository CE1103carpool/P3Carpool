import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../widgets/driver_card.dart';
import '../../widgets/origen_destino.dart';
import '../../widgets/page_tittle.dart';

class SollicitarConductor extends StatelessWidget {
  late final dynamic tipoH;
  SollicitarConductor({super.key, required home}) {
    tipoH = home;
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
                    "Confuguración",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
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
                          color: Colors.blue,
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

  buscarConductor() async {
    bool banderaConductor = false;
    while (!banderaConductor) {
      try {
        http.Response resp = await http.post(
          Uri.parse('https://rstest2.montero.tk/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "tipoConsulta": "buscarCarro",
          }),
        );

        if (resp.statusCode == 200) {
          var data = jsonDecode(resp.body.toString());
          String result = data['respuesta'];
          if (result == "exito") {
            banderaConductor = true;
            tipoH.viajeProgreso();
          } else {
            sleep(const Duration(milliseconds: 500));
          }
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  VerViaje(BuildContext context) {
    tipoH.viajeProgreso();
  }
}
