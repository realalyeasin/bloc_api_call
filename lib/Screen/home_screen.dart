import 'package:bloc_api_call/Bloc/data_bloc.dart';
import 'package:bloc_api_call/Bloc/data_event.dart';
import 'package:bloc_api_call/Bloc/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/data_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if(state is DataInitialState){
              context.read<DataBloc>().add(LoadDataEvent());
              return const Center(child: CircularProgressIndicator(),);
            } else if(state is DataLoadingState){
              return const Center(child: CircularProgressIndicator(),);
            } else if(state is DataLoadedState){
              return HomeUI(state.apiResult);
            } else if(state is DataErrorState){
              return const Center(child: Text('Something went wrong'),);
            } return const Center(child: Text('Something went wrong'),);
          })
    );
  }
  Widget HomeUI(List<Feed> apiResult){
    return ListView.builder(
      itemCount: apiResult.length,
      itemBuilder: (BuildContext, index){
        final Feed feed = apiResult[index];
        return Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: InkWell(
          onTap: (){},
          child: Container(
            child: Column(
              children: [
                Text(feed.meta!.code.toString())
              ],
            ),
          ),
        ),
        );
      },
    );
  }
}
