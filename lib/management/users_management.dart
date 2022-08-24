import 'package:flutter/material.dart';
import 'package:user_list/services/user_service.dart';
import '../model/user_model.dart';

class UsersManagement extends ChangeNotifier {
  UsersManagement() {
    getAllUser();
  }

  UserService _service = UserService();
  List<User> users = <User>[];
  bool isLoading = false;

  getAllUser() async {
    _controlLoading();
    var response = await _service.getAllUsers();
    users = response!.toList();
    _controlLoading();
  }

  _controlLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
