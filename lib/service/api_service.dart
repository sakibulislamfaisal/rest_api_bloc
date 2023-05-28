import 'package:dio/dio.dart';
import 'package:restapibloc/model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getData() async {
    List<UserModel> userDataList = [];
    final Dio _dio = Dio();
    try {
      Response response =
          await _dio.get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        data.forEach((element) {
          UserModel userModel = UserModel.fromJson(element);
          userDataList.add(userModel);
        });
        // print(userDataList);
        return userDataList;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
