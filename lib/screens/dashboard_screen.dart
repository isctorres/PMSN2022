import 'package:flutter/material.dart';
import 'package:practica1/screens/theme_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 226, 133, 26),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images6.alphacoders.com/860/thumb-1920-860645.png'),
                    fit: BoxFit.cover),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://eltallerdehector.com/wp-content/uploads/2022/07/cara-de-mario-bros-png.png'),
              ),
              accountName: Text(
                'Rubén Torres Frias',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              accountEmail: Text(
                'ruben.torres@itcelaya.edu.mx',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              leading: Image.asset('assets/hongo.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('Práctica 1'),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset('assets/hongo.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('Base de datos'),
              onTap: () {
                Navigator.pushNamed(context, '/task');
              },
            ),
            ListTile(
              leading: Image.asset('assets/hongo.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('Popular Movies'),
              onTap: () {
                Navigator.pushNamed(context, '/list');
              },
            ),
            ListTile(
              leading: Image.asset('assets/hongo.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('About us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Image.asset('assets/hongo.png'),
              trailing: Icon(Icons.chevron_right),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
            )
          ],
        ),
      ),
      body: ThemeScreen(),
    );
  }
}
