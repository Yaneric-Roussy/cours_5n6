import 'package:dio/dio.dart';

import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class SingletonDio {
  static var cookiemanager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookiemanager);

    return dio;
  }

  static Future<void> signUpAndGetCookie() async {
    await getDio().post('http://10.0.2.2:8080/id/inscription',
        data: '{nom: "yan${DateTime.now()}", motDePasse: "123456", confirmationMotDePasse: "123456"}');
  }
}
