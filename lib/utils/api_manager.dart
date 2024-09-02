import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:moviesapp/models/movie_details_model/movie_details_model.dart';
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

    static Future<MovieDetailsResponse> getContent(int id) async {
    var url =
        Uri.parse('https://api.themoviedb.org/3/movie/$id?language=en-US');
    var response = await http.get(
      url,
      headers: {
        'Authorization':
         'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMDkwZTMxNmY5NWY2ZGVkMGM3YzUzY2UwM2FmZDVkMCIsIm5iZiI6MTcyNTIxNTQzOC4wMDYxMDIsInN1YiI6IjY2ZDMyOTY0NGQxYzNlNGM4OTk2NWQyMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tvZBSR1ofxU0TWuekUIv_2DoLPTmo-91dxH2tZ8bPQ4', 
   'accept': 'application/json'
      },
    );
    var json = jsonDecode(response.body);
    var contentData = MovieDetailsResponse.fromJson(json);

    return contentData;
  }
}