import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _users = [];

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      setState(() {
        _users = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        bottomNavigationBar: BottomNavigationBar(
      
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Datos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Apellidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            label: 'Configuracion',
          ),
        ],
      ),
        body: _users.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user['name'],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Email: ${user['email']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Phone: ${user['phone']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Website: ${user['website']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class Ejemplo extends StatelessWidget {
  const Ejemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        bottomNavigationBar: BottomNavigationBar(
      
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Datos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Apellidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            label: 'Configuracion',
          ),
        ],
      ),
        body: Container()
      ),
    );
  }
}