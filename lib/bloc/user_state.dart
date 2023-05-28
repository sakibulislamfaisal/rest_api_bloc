import 'package:equatable/equatable.dart';
import 'package:restapibloc/model/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInit extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserDataLoaded extends UserState {
  List<UserModel> userModelList;
  UserDataLoaded(this.userModelList);

  @override
  // TODO: implement props
  List<Object?> get props => [userModelList];
}

class UserError extends UserState {
  String message;
  UserError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
