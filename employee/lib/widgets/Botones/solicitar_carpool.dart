import 'package:flutter/material.dart';

class SolicitarCarpool extends StatelessWidget {
  late final dynamic homePage;
  SolicitarCarpool({super.key, required home}) {
    homePage = home;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              homePage.nextPage(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              decoration: BoxDecoration(
                color: const Color(0XFF312986),
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
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        color: Theme.of(context).colorScheme.background),
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
    );
  }
}
