import 'package:employee/pages/auth/new_login.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  late final NewLogin login;
  LoginForm({super.key, required NewLogin loginState}) {
    login = loginState;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Usuario:"),
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
                controller: login.userC,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  hintText: '2023000000',
                  icon: const Icon(Icons.perm_identity_rounded),
                  iconColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text("Contraseña:"),
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
                controller: login.pwsC,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  hintText: '************',
                  icon: const Icon(Icons.key),
                  iconColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
