import 'package:bloc_api_call/Bloc/data_event.dart';
import 'package:bloc_api_call/Bloc/data_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Model/data_model.dart';
import '../Repo/repo.dart';
@immutable
class DataBloc extends Bloc<DataEvent, DataState>{
  final Repo repo;
  DataBloc(this.repo) : super(DataInitialState()) {
    on<DataEvent>((event, emit) async {
      if(event is LoadDataEvent){
        emit(DataLoadingState());
        List<Feed>? apiResult = await repo.getData();
        print(apiResult);
        if(apiResult == null){
          emit(DataErrorState());
        } else {
          emit(DataLoadedState(apiResult: apiResult));
        }
      }
    });
  }
}