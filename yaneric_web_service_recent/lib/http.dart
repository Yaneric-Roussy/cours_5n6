
//http://10.0.2.2:8080/exam/animaux/{continent}?famille={famille}
import 'package:dio/dio.dart';
import 'package:yaneric_web_service_recent/animal.dart';

final String baseURL = 'http://10.0.2.2:8080/exam/animaux';

Future<List<Animal>> lookupAnimals(String continent, String? famille) async {
  try{
    String actualURL = baseURL;
    if(famille != null || famille != ''){
      final encodedFamille = Uri.encodeComponent(famille!.trim());
      actualURL += '/$continent?famille=$famille';
    }
    else
      actualURL += '/$continent';

    final response = await Dio().get(actualURL);
    print("🔵 Response: ${response.data}");

    if (response.data is List) {
      return (response.data as List)
          .map((json) => Animal.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Unexpected response format: ${response.data}');
    }
  }catch (e){
    print("💥 Error in finding animals: $e");
    rethrow;
  }
}