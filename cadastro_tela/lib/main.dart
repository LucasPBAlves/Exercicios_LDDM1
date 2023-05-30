import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  double _fontSize = 16.0;
  bool _emailNotification = false;
  bool _cellphoneNotification = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        fontFamily: 'Roboto', // Defina a fonte desejada
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: _fontSize), // Aplique o tamanho da fonte a todos os textos da tela
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(height: 12.0),
              const TextField(
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
              ),
              const SizedBox(height: 12.0),
              const Text('Gênero'),
              Row(
                children: [
                  Radio(
                    value: 'Masculino',
                    groupValue: '',
                    onChanged: (value) {},
                  ),
                  const Text('Masculino'),
                  Radio(
                    value: 'Feminino',
                    groupValue: '',
                    onChanged: (value) {},
                  ),
                  const Text('Feminino'),
                ],
              ),
              const SizedBox(height: 12.0),
              const Text('Notificações'),
              Row(
                children: [
                  const Text('E-mail'),
                  Switch(
                    value: _emailNotification,
                    onChanged: (value) {
                      setState(() {
                        _emailNotification = value;
                      });
                    },
                  ),
                  const Text('Celular'),
                  Switch(
                    value: _cellphoneNotification,
                    onChanged: (value) {
                      setState(() {
                        _cellphoneNotification = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Text('Tamanho da fonte: ${_fontSize.toInt()}'),
              Slider(
                value: _fontSize,
                min: 12.0,
                max: 30.0,
                divisions: 18,
                label: _fontSize.toInt().toString(),
                onChanged: (value) {
                  setState(() {
                    _fontSize = value;
                  });
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(RegistrationScreen());
}
