import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practica1/firebase/email_authentication.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtConUser = TextEditingController();
  TextEditingController txtConPwd = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final EmailAuthentication _emailAuth = EmailAuthentication();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      controller: txtConUser,
      decoration: InputDecoration(
        hintText: 'Introduce el usuario',
        label: Text('Correo Electrónico'),
      ),
      //onChanged: (value) {},
    );

    final txtPwd = TextField(
      controller: txtConPwd,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Introduce el password',
        label: Text('Contraseña'),
      ),
    );

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
                onTap: () async {
                  var ban = await _emailAuth.signInWithEmailAndPassword(
                      email: txtConUser.text, password: txtConPwd.text);
                  if (ban == true) {
                    if (_auth.currentUser!.emailVerified)
                      Navigator.pushNamed(context, '/dash');
                    else
                      print('Usuario no validado');
                  } else {
                    print('Credenciales invalidas');
                  }
                },
                child: Image.asset('assets/bloque.png',
                    height: MediaQuery.of(context).size.width / 5),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 50,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20),
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  children: [
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.github,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.google,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width / 1.8,
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
