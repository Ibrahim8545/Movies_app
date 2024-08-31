import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:moviesapp/models/top_section_home_screen_model.dart';
class ApiManger
{
 static Future<TopSectionHomeScreenModel>getTopSection()async
 {
   Uri url=Uri.https(
    'api.themoviedb.org/',
    '/3/movie/popular?language=en-US&page=100');

    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);

    TopSectionHomeScreenModel topSectionmodel=TopSectionHomeScreenModel.fromJson(json);
  return topSectionmodel; 
  
 }
   
}