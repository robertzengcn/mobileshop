import 'dart:async';

// import 'package:meta/meta.dart';
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
  ///delete user token
  Future<void> deleteToken() async {
    /// delete from keystore/keychain
//    await Future.delayed(Duration(seconds: 1));
//     await userDao.deleteUserbytoken(token);

    await userApiClient.deleteUsertoken();
    return;
  }

  Future<void> persistToken(String token,String userexpired,String userName) async {
    /// write to keystore/keychain
    // await Future.delayed(Duration(seconds: 1));
    // return;
    String tokenstring=token+":"+userexpired;
    await userApiClient.saveUsertoken(tokenstring);
    await userApiClient.saveUsername(userName);
  }
  /// save user's name
  Future<void> saveUsername(String username) async {
    await userApiClient.saveUsername(username);
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
  /// login by google
  Future<User> loginbyGg(
      String username, String email) async {
    return userApiClient.loginbyGg(username, email);
  }

  ///get public key
  Future<String?> getUsertoken() async {
    return await userApiClient.getUsertoken();

  }
  ///get public key
  Future<String?> getUsername() async {
    return await userApiClient.getUsername();

  }
  ///register user
  Future<User> registerUser(String fullName,String email,String password) async {
    return await userApiClient.registerUser(fullName,email,password);
  }
  ///get user info
  Future<UserInfo> getUserinfo() async {
    return await userApiClient.getUserinfo();
  }
  ///update user info
  Future <bool> updateUserinfo(String name, String telephone) async{
    return await userApiClient.updateUserinfo(name, telephone);
  }

  ///update user account
  Future <bool> deleteUser() async{
    return await userApiClient.deleteAccount();
  }


}
