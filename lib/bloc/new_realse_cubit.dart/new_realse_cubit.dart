import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/bloc/new_realse_cubit.dart/new_realse_states.dart';
import 'package:moviesapp/bloc/recommended_cubit.dart/recommended_cubit.dart';
import 'package:moviesapp/models/new_release_model.dart';

class NewRealseCubit extends Cubit<HomeNewRealseState> 
{
  NewRealseCubit() : super(NewRealseHomeInitial());
  NewRealseModel? newRealseModel;

   Future<void> getNewReleases()async
   {
    try {
      emit(HomeGetNewRealseLoading());
    Uri url=Uri.https(
      'api.themoviedb.org',
      '/3/movie/upcoming',
      {'api_key':'c090e316f95f6ded0c7c53ce03afd5d0'}
    );
    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
    
     newRealseModel=NewRealseModel.fromJson(json);
  emit(HomeGetNewRealseSucess());
 RecommendedCubit();
    } catch (e) {
      print(e);
      emit(HomeGetNewRealseError());
    }
   }


    
  
}