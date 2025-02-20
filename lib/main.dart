import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// inicializador do app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // remove o banner de debug
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  bool get isEmpity => _counter == 0;
  bool get isFull => _counter == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/imagem.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'está lotado' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 46,
                color: isFull ? Colors.red : Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 0, right: 20, bottom: 30),
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 80,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpity ? null : _decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpity ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(80, 40),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    'Saiu',
                  ),
                ),
                const SizedBox(width: 40),
                TextButton(
                  onPressed: isFull ? null : _increment,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(80, 40),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    style: TextStyle(color: Colors.black),
                    'Entrou',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
