import 'package:employee/widgets/Botones/seguir_viaje.dart';
import 'package:employee/widgets/page_tittle.dart';
import 'package:flutter/material.dart';
import '../../widgets/Botones/solicitar_carpool.dart';
import '../../widgets/drawer.dart';
import 'solicitar_conductor.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

late bool viajeEnProgreso;

class _InicioState extends State<Inicio> {
  String tipoSeleccionado = "vconamigos";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viajeEnProgreso = false;
  }

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
                        child: SelectorTipoViaje(homeP: this))
                  ],
                ),
              ),
              viajeEnProgreso
                  ? SeguirViaje(home: this)
                  : SolicitarCarpool(home: this),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.095,
      ),
    );
  }

  nextPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SollicitarConductor(homeP: this),
      ),
    );
  }

  viajeProgreso() {
    setState(() {
      viajeEnProgreso = !viajeEnProgreso;
    });
  }
}

class SelectorTipoViaje extends StatefulWidget {
  late final _InicioState homeState;
  SelectorTipoViaje({super.key, required _InicioState homeP}) {
    homeState = homeP;
  }
  @override
  State<SelectorTipoViaje> createState() => _SelectorTipoViajeState();
}

class _SelectorTipoViajeState extends State<SelectorTipoViaje> {
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
          widget.homeState.tipoSeleccionado
        },
        onSelectionChanged: (Set newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            widget.homeState.tipoSeleccionado = newSelection.first;
          });
        });
  }
}
