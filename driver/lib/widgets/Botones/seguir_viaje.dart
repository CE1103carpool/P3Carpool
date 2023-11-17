import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SeguirViaje extends StatelessWidget {
  late var home;
  SeguirViaje({super.key, required this.home});

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
            onTap: () => home.nextPage(context),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.height * 0.15,
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 10, 178, 85),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Empezar\nViaje",
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
