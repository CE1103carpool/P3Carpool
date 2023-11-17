import 'package:flutter/material.dart';
import '../../widgets/Botones/seguir_viaje.dart';
import '../../widgets/Botones/solicitar_carpool.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_tittle.dart';
import 'estado_viaje.dart';
import 'solicitar_conductor.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

late bool viajeEnProgreso;

class _InicioState extends State<Inicio> {
  String tipoSeleccionado = "vconamigos";
  late final EstadoDelViaje estadoViaje = EstadoDelViaje(home: this);
  late final SollicitarConductor solicitar = SollicitarConductor(home: this);
  TextEditingController asientos = TextEditingController();
  @override
  void initState() {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text("Espacios disponibles:"),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.075,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.background,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          child: TextField(
                            controller: asientos,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              hintText: '0',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SeguirViaje(home: this),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      // onTap: () => VerViaje(context),
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
                              "Ver mis calificaciones",
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
        ),
      ),
    );
  }

  nextPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => !viajeEnProgreso ? solicitar : estadoViaje,
      ),
    );
  }

  viajeProgreso() {
    setState(() {
      viajeEnProgreso = !viajeEnProgreso;
    });
    nextPage(context);
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
