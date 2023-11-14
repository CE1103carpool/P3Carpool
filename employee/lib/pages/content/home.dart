import 'package:employee/widgets/page_tittle.dart';
import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';
import 'solicitar_conductor.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      drawer: const DrawerGlobal(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const PageTittle(titulo: "Bienvenido"),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Text(
                        "Configurar Viaje",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.07,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      "Puede viajar con amigos\no con conductores al azar",
                      textAlign: TextAlign.center,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: MediaQuery.of(context).size.width,
                        child: SelectorTipoViaje())
                  ],
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
                      onTap: () => SolicitarCarpool(context),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.15,
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.02),
                        decoration: BoxDecoration(
                          color: Color(0XFF312986),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Solicitar\nCarpool",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.04,
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
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.095,
      ),
    );
  }

  SolicitarCarpool(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SollicitarConductor(),
      ),
    );
  }
}

class SelectorTipoViaje extends StatefulWidget {
  const SelectorTipoViaje({super.key});

  @override
  State<SelectorTipoViaje> createState() => _SelectorTipoViajeState();
}

class _SelectorTipoViajeState extends State<SelectorTipoViaje> {
  String tipoSeleccionado = "vconamigos";

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
        segments: const [
          ButtonSegment(
              value: "vconamigos",
              label: Text("con amigos"),
              icon: Icon(Icons.people)),
          ButtonSegment(
              value: "valazar",
              label: Text("al azar"),
              icon: Icon(Icons.car_rental))
        ],
        selected: {
          tipoSeleccionado
        },
        onSelectionChanged: (Set newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            tipoSeleccionado = newSelection.first;
          });
        });
  }
}
