
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_albin/models/models.dart';


class MoviesProvider extends ChangeNotifier {
  String _apiKey = '3bddcc641d78de6899df39a7a51c5f6e';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> OnDisplayedMovies=[];
  List<Movie> popularMovies=[];

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayedMovies();
    this.getPopularMovies();
  }

  getOnDisplayedMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': "1",
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse= NowPlayingResponse.fromJson(response.body);
    
    
    OnDisplayedMovies=nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async{
     
     var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': "1",
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse= PopularResponse.fromJson(response.body);
    
    
    popularMovies=[...popularMovies, ...popularResponse.results];
    print(popularMovies[0]);
    notifyListeners();
  }
}
