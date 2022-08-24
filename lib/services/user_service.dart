import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../model/user_model.dart';

abstract class IUserService {
  final _dio =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  final String _path = '/posts';
  final String _endPoint = '/posts?id=';
  Future<List<User>?> getAllUsers();
  Future<List<User>?> getUserById(int? id);
}

class UserService extends IUserService {
  @override
  Future<List<User>?> getAllUsers() async {
    try {
      var response = await _dio.get(_path);
      if (response.statusCode == HttpStatus.ok) {
        var userList =
            (response.data as List).map((e) => User.fromJson(e)).toList();
        return userList;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<User>?> getUserById(int? id) async {
    try {
      var response = await _dio.get(_endPoint + id.toString());
      print(response.data.toString());
      print(id);
      if (response.statusCode == HttpStatus.ok) {
        var user =
            (response.data as List).map((e) => User.fromJson(e)).toList();
        return user;
      }
    } on DioError catch (e) {
      log(e.toString());
    }
  }
}
