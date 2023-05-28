import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapibloc/bloc/user_event.dart';
import 'package:restapibloc/bloc/user_state.dart';
import 'package:restapibloc/model/user_model.dart';
import 'package:restapibloc/service/api_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInit()) {
    List<UserModel> userModelList = [];
    ApiService _apiservice = ApiService();
    on<GetAllUserList>(
      (event, emit) async {
        try {
          emit(UserLoading());
          userModelList = await _apiservice.getData();
          emit(UserDataLoaded(userModelList));
        } catch (e) {
          emit(UserError(e.toString()));
        }
      },
    );
  }
}
