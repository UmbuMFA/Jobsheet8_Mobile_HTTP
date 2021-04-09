import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:jobsheet8_http/Models/movie.dart';

class HttpService {
  final String apiKey = '34a2a9f98a769af23824cccff6dd5370';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';

   Future<List> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
