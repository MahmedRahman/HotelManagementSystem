import 'package:appwrite/appwrite.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../constans/app_constants.dart';
import 'dart:math';

class AuthController extends GetxController {
  Client client = Client();
  Account? account;

  @override
  void onInit() async {
    _init();
    return super.onInit();
  }

  _init() {
    account = Account(client);
    client.setEndpoint(endpoint).setProject(projectId);
    _checkIsLoggedIn();
  }

  _checkIsLoggedIn() async {
    try {
      var res = await account!.get();
      print('IsLoggedIn => ${res.email}');
    } catch (e) {
      print('_checkIsLoggedIn error => $e');
    }
  }

  login(String email, String password) async {
    try {
      var result =
          await account!.createEmailSession(email: email, password: password);
      print('result user id => ${result.userId}');
    } catch (error) {
      print('login error => $error');
    }
  }

  createAccount(String name, String email, String password) async {
    try {
      var result = await account!.create(
          name: name,
          email: email,
          password: password,
          userId: getRandomString(36));
      print('account created => ${result.email}');
    } catch (error) {
      print('createAccount error => $error');
    }
  }

  var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
