// ignore_for_file: file_names
import 'package:http/http.dart';

import '../../widgets/login_form.dart';
import '../../widgets/page_tittle.dart';
import 'package:flutter/material.dart';

import '../../widgets/login_button.dart';
import 'dart:convert';

// ignore: must_be_immutable
class NewLogin extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var atuh;
  TextEditingController userC = TextEditingController();
  TextEditingController pwsC = TextEditingController();
  // ignore: no_leading_underscores_for_local_identifiers
  NewLogin(_authPageState, {super.key}) {
    atuh = _authPageState;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const PageTittle(titulo: "Iniciar Sesión"),
                  LoginForm(loginState: this),
                  LoginButton(this),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  authPageChange() {
    atuh.toggleScreens();
  }

  authAction(context) async {
    //atuh.loginStatus();
    try {
      Response response = await post(Uri.parse('https://rsjava.montero.tk/'),
          body: jsonEncode(<String, String>{
            "tipoConsulta": "login",
            "carne": userC.text,
            "password": pwsC.text,
          }));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        String result = data['respuesta'];
        if (result == "exito") {
          atuh.loginStatus();
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Credenciales incorrectas"),
              );
            },
          );
        }
      } else {
        print('failed');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Servidor sin conexión"),
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
