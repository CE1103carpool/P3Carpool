import 'package:flutter/material.dart';

class OrigenDestino extends StatelessWidget {
  final origen;
  final destino;
  const OrigenDestino(
      {super.key, required String this.origen, required String this.destino});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Origen:"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.background),
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                enabled: false,
                //controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  hintText: origen,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text("Destino:"),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.background,
              ),
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                  //controller: passwordController,
                  enabled: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      hintText: destino,
                      hintStyle: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
