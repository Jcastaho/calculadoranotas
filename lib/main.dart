import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Notas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _total = 0;
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();
  final _numero3 = TextEditingController();
  final _numero4 = TextEditingController();
  String aprueba = "";
  void _calcular() {
    setState(() {
      _total = double.parse(_numero1.text) + double.parse(_numero2.text)+ double.parse(_numero3.text) + double.parse(_numero4.text);
      _total = _total / 4;

      if(_total >= 3.0){
        aprueba = "Gano";
      }else{
        aprueba = "Perdio";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            const Text("Calculadora de notas",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _numero1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la nota 1",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _numero2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la nota 2 ",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _numero3,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la nota 3",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _numero4,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ingrese la nota 4",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular();
                    },
                    child: Text("Calcular promedio"),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text('La nota final es: $_total',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          color: Colors.indigo)),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text("$aprueba",
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 25,
                          color: Colors.indigo)),
                ],
              ))
            ]),
      ),
    );
  }
}
//control alt shif + L
