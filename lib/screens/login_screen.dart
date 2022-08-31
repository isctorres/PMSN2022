import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtUser = TextField(
    decoration: InputDecoration(
      hintText: 'Introduce el usuario',
      label: Text('Correo Electrónico'),
    ),
  );

  final txtPwd = TextField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Introduce el password',
      label: Text('Contraseña'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                'assets/mario_logo.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20,
                bottom: MediaQuery.of(context).size.width / 20,
              ),
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                children: [
                  txtUser,
                  SizedBox(
                    height: 15,
                  ),
                  txtPwd,
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 2,
              right: MediaQuery.of(context).size.width / 20,
              child: GestureDetector(
                onTap: () {
                  print('hola');
                },
                child: Image.asset('assets/bloque.png',
                    height: MediaQuery.of(context).size.width / 5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
