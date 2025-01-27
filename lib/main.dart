import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String input = ''; // Entrada do usuário
  String result = '0'; // Resultado

  void buttonPressed(String text) {
    setState(() {
      if (text == '=') {
        try {
          result = (double.parse(input.split(RegExp(r'[\+\-x\÷]'))[0]) *
                  double.parse(input.split(RegExp(r'[\+\-x\÷]'))[1]))
              .toString();
        } catch (e) {
          result = 'Erro';
        }
      } else if (text == 'C') {
        input = '';
        result = '0';
      } else {
        input += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          width: 280,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 8,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Exibição dos resultados
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 6, 17, 39),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      input,
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 8),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 247, 248, 247),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              // Botões
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  ...['7', '8', '9', '÷', '4', '5', '6', 'x', '1', '2', '3', '-', '0', '.', '=', '+']
                      .map(
                    (text) => SizedBox(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => buttonPressed(text),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 20), // Números grandes
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => buttonPressed('C'),
                      child: Text(
                        'C',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

