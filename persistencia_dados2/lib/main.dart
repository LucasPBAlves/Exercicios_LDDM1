import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Database _database;

  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  Future<void> _openDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'meu_banco_de_dados.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            email TEXT
          )
        ''');
      },
    );

    print('Banco de dados aberto');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _insertData,
          child: const Text('Inserir Dados'),
        ),
      ),
    );
  }

  Future<void> _insertData() async {
    final Map<String, dynamic> userData = {
      'nome': 'John Doe',
      'email': 'john@example.com',
    };

    await _database.insert('usuarios', userData);

    print('Dados inseridos');
  }
}
