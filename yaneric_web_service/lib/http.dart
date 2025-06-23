import 'package:dio/dio.dart';
import 'package:yaneric_web_service/artiste.dart';

Future<List<Artiste>> getArtists(String nom) async {
  try {
    final encodedNom = Uri.encodeComponent(nom.trim());
    final response = await Dio().get(
      'https://examen-intra-a23.azurewebsites.net/exam/artiste/recherche/$encodedNom',
    );

    print("🔵 Response: ${response.data}");

    if (response.data is List) {
      return (response.data as List)
          .map((json) => Artiste.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Unexpected response format: ${response.data}');
    }
  } catch (e) {
    print("💥 Error in getArtists: $e");
    rethrow;
  }
}
