
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peliculas_albin/models/models.dart';


class MoviesProvider extends ChangeNotifier {
  String _apiKey = '3bddcc641d78de6899df39a7a51c5f6e';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> OnDisplayedMovies=[];
  List<Movie> popularMovies=[];

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayedMovies();
    this.getPopularMovies();
  }
  Future <String> _getJsonData(String endpoint,[int page=1 ])async{
    
    var url = Uri.https(_baseUrl,endpoint , {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayedMovies() async {
    final jsonData =await this._getJsonData('3/movie/now_playing');

    final nowPlayingResponse= NowPlayingResponse.fromJson(jsonData);
    
    
    OnDisplayedMovies=nowPlayingResponse.results;
    notifyListeners();
  }
    
  getPopularMovies() async{
    _popularPage++;

     final jsonData =await this._getJsonData('3/movie/popular',_popularPage);
     final popularResponse =PopularResponse.fromJson(jsonData);
     
    
    
    
    popularMovies=[...popularMovies, ...popularResponse.results];
    
    notifyListeners();
  }
}
