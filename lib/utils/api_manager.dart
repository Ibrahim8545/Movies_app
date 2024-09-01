import 'dart:convert';

import 'package:http/http.dart'as http;
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
   
}