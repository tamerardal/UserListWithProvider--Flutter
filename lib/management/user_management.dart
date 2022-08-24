import 'package:flutter/cupertino.dart';
import '../model/user_model.dart';
import '../services/user_service.dart';

class UserManagement extends ChangeNotifier {
  int id;
  UserService _service = UserService();
  List<User> user = <User>[];
  bool isLoading = false;
  UserManagement({
    required this.id,
  }) {
    getUserById(id);
  }

  getUserById(int? id) async {
    _controlLoading();
    var response = await _service.getUserById(id);
    user = response!.toList();
    _controlLoading();
  }

  _controlLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
