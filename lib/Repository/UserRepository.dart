import 'dart:async';

import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';
// import 'package:amigatoy/dao/user_dao.dart';

class UserRepository {
  UserApiClient userApiClient = new UserApiClient();
  // final userDao = UserDao();
  UserRepository();

  Future<User> authenticate({
    required String username,
    required String password,
  }) async {
//    await Future.delayed(Duration(seconds: 1));
    User futureUser = await userApiClient.loginAuth(username, password);
    return futureUser;
//    futureUser.then((news) {
//      print(news);
//    });
  }

  Future<void> deleteToken(String token) async {
    /// delete from keystore/keychain
//    await Future.delayed(Duration(seconds: 1));
//     await userDao.deleteUserbytoken(token);
    await userApiClient.deleteUsertoken();
    return;
  }

  Future<void> persistToken(String token,String userexpired) async {
    /// write to keystore/keychain
    // await Future.delayed(Duration(seconds: 1));
    // return;
    String tokenstring=token+":"+userexpired;
    await userApiClient.saveUsertoken(tokenstring);
  }

//   Future<String?> hasToken() async {
//     /// read from keystore/keychain
// //    await Future.delayed(Duration(seconds: 1));
//     User? user=await userDao.getToken();
//     if(user!=null){
//       return user.usertoken;
//     }else{
//       return null;
//     }
// //     return user;
// //      return userApiClient.getUsertoken();
//   }
//   Future insertUser(User user) => userDao.createUser(user);

  // Future <User?> getUserbytoken({required String token}) => userDao.getUserbytoken(token);

  ///download secret key
  Future<void> downloadPublickey() async {
    userApiClient.downloadSecretkey();
  }

  ///get public key
  Future<String?> getPublickey() async {
    return userApiClient.getSecretkey();
  }

  /// login by facebook
  Future<User> loginbyFb(
      String username, String email, String assessCode, String userId) async {
    return userApiClient.loginbyFb(username, email, assessCode, userId);
  }

  ///get public key
  Future<String?> getUsertoken() async {
    return await userApiClient.getUsertoken();

  }
}
