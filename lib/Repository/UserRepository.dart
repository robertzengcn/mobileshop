import 'dart:async';

import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/dao/user_dao.dart';

class UserRepository {
  final UserApiClient userApiClient;
  final userDao = UserDao();
  UserRepository({required this.userApiClient})
      : assert(userApiClient != null);

  Future<User> authenticate({
    required String username,
    required String password,
  }) async {
//    await Future.delayed(Duration(seconds: 1));
    User futureUser=await userApiClient.loginAuth(username, password);
    return futureUser;
//    futureUser.then((news) {
//      print(news);
//    });
  }

  Future<void> deleteToken(String token) async {
    /// delete from keystore/keychain
//    await Future.delayed(Duration(seconds: 1));
    await userDao.deleteUserbytoken(token);
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<User?> hasToken() async {
    /// read from keystore/keychain
//    await Future.delayed(Duration(seconds: 1));
    User? user=await userDao.getToken();
    return user;
  }
  Future insertUser(User user) => userDao.createUser(user);

  Future getUserbytoken({required String token}) => userDao.getUserbytoken(token);
}
