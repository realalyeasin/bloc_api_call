import 'package:flutter/cupertino.dart';
import '../Model/data_model.dart';

@immutable
abstract class DataState{}

class DataInitialState extends DataState{}

class DataLoadingState extends DataState{}

class DataLoadedState extends DataState{
  List<Feed> apiResult;
  DataLoadedState({required this.apiResult});
}

class DataErrorState extends DataState{}
