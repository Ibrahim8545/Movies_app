import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/bloc/top_section_cubit/states.dart';
import 'package:moviesapp/models/top_section_home_screen_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  TopSectionHomeScreenModel? topSectionHomeScreenModel;
  Future<void>getTopSection()async
 {
  try
  {
    emit(HomeGetTopSectionLoading());
     Uri url=Uri.https(
    'api.themoviedb.org',
    '/3/movie/popular',
    {'api_key':'c090e316f95f6ded0c7c53ce03afd5d0'}
    );
    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
 topSectionHomeScreenModel=TopSectionHomeScreenModel.fromJson(json);
 emit(HomeGetTopSectionSucess());
  }catch(e)
  {
    emit((HomeGetTopSectionLError()));
  }
  

  
 }
}