import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/bloc/recommended_cubit.dart/state.dart';
import 'package:moviesapp/models/new_release_model.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit() : super(RecommendedInitial());
  NewRealseModel? newRecommededModel;
   Future<void> getRecommendeds()async
   {
    try {
      emit(RecommendedLoading());
       Uri url=Uri.https(
      'api.themoviedb.org',
      '3/movie/top_rated',
      {'api_key':'c090e316f95f6ded0c7c53ce03afd5d0'}
    );
    http.Response response=await http.get(url);
    var json=jsonDecode(response.body);
 print(response.body);
    newRecommededModel=NewRealseModel.fromJson(json);
    emit(RecommendedSucess());
    } catch (e) {
      emit(RecommendedError());
    }

   }
    

}