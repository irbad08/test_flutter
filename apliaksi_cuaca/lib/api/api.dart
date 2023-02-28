import 'dart:async';
import 'dart:convert';
import 'package:apliaksi_cuaca/api/modelApi.dart';
import 'package:http/http.dart' as http;
class RestApiCuacaWilayah {
  final _baseUrl =
      'https://ibnux.github.io/BMKG-importer/cuaca/501306.json';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body);
        List<CuacaWilayah> listFilm = iterable
            .map((e) => CuacaWilayah.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        print(iterable);
        return listFilm;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
class RestApiWilayah {
  final _baseUrl =
      'https://ibnux.github.io/BMKG-importer/cuaca/wilayah.json';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body);
        List<CuacaWilayah> listFilm = iterable
            .map((e) => CuacaWilayah.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        print(iterable);
        return listFilm;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}