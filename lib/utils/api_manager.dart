import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/models/top_section_home_screen_model.dart';
class ApiManger
{

  //api.themoviedb.org', '/3/movie/popular'
 static Future<TopSectionHomeScreenModel>getTopSection()async
 {
  // api.themoviedb.org/3/movie/popular?language=en-US&page=1
   Uri url=Uri.https(
    'api.themoviedb.org',
    '/3/movie/popular',
    {'api_key':'c090e316f95f6ded0c7c53ce03afd5d0'}
    );
    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
print(response.body);
    TopSectionHomeScreenModel topSectionmodel=TopSectionHomeScreenModel.fromJson(json);
  return topSectionmodel; 
  
 }
   //https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1

   static Future<NewRealseModel> getNewReleases()async
   {
    Uri url=Uri.https(
      'api.themoviedb.org',
      '/3/movie/upcoming',
      {'api_key':'c090e316f95f6ded0c7c53ce03afd5d0'}
    );
    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
    print(response.body);
    NewRealseModel newRealseModel=NewRealseModel.fromJson(json);
    return newRealseModel;
   }
 static Future<NewRealseModel> getRecommendeds()async
   {
    Uri url=Uri.https(
      'api.themoviedb.org',
      '3/movie/top_rated',
      {'api_key':'c090e316f95f6ded0c7c53ce03afd5d0'}
    );
    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
    print(response.body);
    NewRealseModel newRecommededModel=NewRealseModel.fromJson(json);
    return newRecommededModel;
   }

   //https://api.themoviedb.org/?language=en-US&page=1
}