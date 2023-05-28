import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapibloc/bloc/user_bloc.dart';
import 'package:restapibloc/bloc/user_event.dart';

import 'bloc/user_state.dart';
import 'model/user_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(),
        child: MaterialApp(
          // Application name
          title: 'Flutter Hello World',
          // Application theme data, you can set the colors for the application as
          // you want
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // A widget which will be started on application startup
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // @override
    // void initState() {
    //   initState();
    //   context.read<UserBloc>().add(GetAllUserList());
    // }

    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: const Text("BLOC"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInit) {
              context.read<UserBloc>().add(GetAllUserList());
            }
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserError) {
              return Center(child: Text(state.message));
            }
            if (state is UserDataLoaded) {
              return _view(context, state.userModelList);
            }

            return const Text("No Data ");
          },
        ));
  }

  Widget _view(BuildContext context, List<UserModel> userModelList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        UserModel userModel = userModelList[index];
        return ListTile(
          title: Text(userModel.name.toString()),
          subtitle: Text(userModel.email.toString()),
        );
      },
      itemCount: userModelList.length,
    );
  }
}
