import 'dart:async';

import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';

class UserRepository {
  final UserApiClient userApiClient;
  UserRepository({required this.userApiClient})
      : assert(userApiClient != null);

  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
//    await Future.delayed(Duration(seconds: 1));
    User futureUser=await userApiClient.loginAuth(username, password);
    return futureUser.token;
//    futureUser.then((news) {
//      print(news);
//    });
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
