import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _dividendeController = TextEditingController();
  final TextEditingController _diviseurController = TextEditingController();
  final Dio _dio = Dio();

  Future<void> effectuerDivision() async {
    final dividende = _dividendeController.text.trim();
    final diviseur = _diviseurController.text.trim();

    if (dividende.isEmpty || diviseur.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir les deux champs.')),
      );
      return;
    }

    final url =
        'https://examen-final-a24.azurewebsites.net/Exam2024/Division/$dividende/$diviseur';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200 && response.data['resultat'] != null) {
        final resultat = response.data['resultat'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Résultat : $resultat')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Réponse invalide du serveur.')),
        );
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Erreur du serveur : ${e.response?.data.toString() ?? 'inconnue'}',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Impossible de communiquer avec le serveur. Vérifiez votre connexion.',
            ),
          ),
        );
      }
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Une erreur inattendue est survenue.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Division API')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _dividendeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Dividende'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _diviseurController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Diviseur'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: effectuerDivision,
              child: const Text('Diviser'),
            ),
          ],
        ),
      ),
    );
  }
}
