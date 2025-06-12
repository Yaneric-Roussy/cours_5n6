import 'package:dio/dio.dart';
import 'package:exercices_http/transfert_http.dart';

Future<List<Repo>> httpComplex(String nom) async {
  try {
    var response = await Dio()
        .get('https://api.github.com/users/$nom/repos');
    print(response);
    var listeJSON = response.data as List;
    var listeRepos = listeJSON.map((elementJSON) {
      return Repo.fromJson(elementJSON);
    }).toList();
    return listeRepos;
  } catch (e) {
    print(e);
    rethrow;
  }
}