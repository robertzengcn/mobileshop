import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/constants/application_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class UserApiClient{

//  final http.Client httpClient;
  UserApiClient() ;
  String _mobilepublickey="mobilepublickey";
  String _usertokenkey="usertokenkey";

  final storage = new FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  final options = IOSOptions(accessibility: IOSAccessibility.first_unlock);

  @override
  Future <User> loginAuth(String username,String password) async{
    var url = Uri.parse('$appServerUrl/loginAuth');
    http.Response response = await http.post(
      url,
      body: {'email': username, 'password': password},
      headers: {
        'Application-Id': '$appId',
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to fetch data from the REST API');
    }
      var responseJson = json.decode(response.body);
      if(responseJson['status']==true){
        if(responseJson['data']['data']!=null){
          responseJson['data']['user']=await this.decodeToken(responseJson['data']['data']);
        }
        print(responseJson['data']['user']);
        return User.fromJson(responseJson['data']['user']);
      }else{
        throw Exception(responseJson['msg']);
      }

  }

  @override
  ///get secret public key for mobile
  Future <void> downloadSecretkey() async{
    var url = Uri.parse('$appServerUrl/getPublickey');
    http.Response response = await http.get(
      url,
      headers: {
        'Application-Id': '$appId',
      },
    );
    if (response.statusCode != 200) {
      throw Exception("get public key internet error");
    }
      var responseJson = json.decode(response.body);
      if (responseJson['status']!=true) {
        throw Exception("get public key status error");
      }
      // final storage = new FlutterSecureStorage();
    // AndroidOptions _getAndroidOptions() => const AndroidOptions(
    //   encryptedSharedPreferences: true,
    // );
    //   final options = IOSOptions(accessibility: IOSAccessibility.first_unlock);
      await storage.write(key: _mobilepublickey,
          value: responseJson['data']['data'],
          iOptions: options,
        aOptions: _getAndroidOptions()
      );
  }
  ///get secret key
  Future <String?> getSecretkey() async{
    return await storage.read(key: _mobilepublickey,
        iOptions: options,
        aOptions: _getAndroidOptions()
    );
  }
  ///get user token
  Future <String?> getUsertoken() async{

    String? tokenStr= await storage.read(key: _usertokenkey,
        iOptions: options,
        aOptions: _getAndroidOptions()
    );
    if (tokenStr != null && tokenStr.length > 0) {
      List<String> tokenArr = tokenStr.split(":");

      if (int.parse(tokenArr[1]) > DateTime.now().millisecondsSinceEpoch) {
        return tokenArr[0];
      } else {
        return null;
      }
    }
  }
  ///save user token
  Future <void> saveUsertoken(String token) async{
    await storage.write(key: _usertokenkey,
        value: token,
        iOptions: options,
        aOptions: _getAndroidOptions()
    );
  }

  ///save user token
  Future <void> deleteUsertoken() async{
    await storage.delete(key: _usertokenkey,
        iOptions: options,
        aOptions: _getAndroidOptions()
    );
  }

  ///decode the encrypted token
  Future <Map<String,dynamic>> decodeToken(String encryptedToken) async {
    String? publicKey=await this.getSecretkey();
    if(publicKey==null){
      throw Exception("public key not exist");
    }
    // print(publicKey);
    // print("11111111111111111");
    try {
      final key = RSAPublicKey(publicKey);
      // Verify a token
      final jwt = JWT.verify(encryptedToken, key);
      // print("222222222222");
      // print('Payload: ${jwt.payload}');
      return jwt.payload;

      // );
      return jwt.payload;
    } on JWTExpiredError {
      print('jwt expired');
      throw Exception("jwt expired");
    } on JWTError catch (ex) {
      print(ex.message); // ex: invalid signature
      throw Exception(ex.message);
    }
  }

  @override
  ///user login by fb
  Future <User> loginbyFb(String username,String email,String assessCode,String userId) async{
    var url = Uri.parse('$appServerUrl/loginfb');
    final jwt = JWT(
        {'username':username,
          'email': email,
          'accessToken': assessCode,
          'userId':userId}
    );
    // Sign it (default with HS256 algorithm)
    String fbdatastring = jwt.sign(SecretKey(MobileSecretKey));
    http.Response response = await http.post(
      url,
      body: {'data':fbdatastring},
      headers: {
        'Application-Id': '$appId',
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to login in by facebook from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      // print(responseJson['data']['data']);
      if(responseJson['data']['data']!=null){
        responseJson['data']['user']=await this.decodeToken(responseJson['data']['data']);
      }
      // print(responseJson['data']['user']);
      return User.fromJson(responseJson['data']['user']);
    }else{
      throw Exception(responseJson['msg']);
    }

  }

  @override
  ///user login by google
  Future <User> loginbyGg(String username,String email) async{
    var url = Uri.parse('$appServerUrl/logingg');
    final jwt = JWT(
        {'username':username,
          'email': email}
    );
    // Sign it (default with HS256 algorithm)
    String fbdatastring = jwt.sign(SecretKey(MobileSecretKey));
    http.Response response = await http.post(
      url,
      body: {'data':fbdatastring},
      headers: {
        'Application-Id': '$appId',
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to login in by facebook from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      // print(responseJson['data']['data']);
      if(responseJson['data']['data']!=null){
        responseJson['data']['user']=await this.decodeToken(responseJson['data']['data']);
      }
      // print(responseJson['data']['user']);
      return User.fromJson(responseJson['data']['user']);
    }else{
      throw Exception(responseJson['msg']);
    }

  }

  @override
  ///user login by fb
  Future <User> registerUser(String fullName,String email,String password) async{
    var url = Uri.parse('$appServerUrl/register');
    final jwt = JWT(
        {'fullname':fullName,
          'email': email,
          'password':password}
    );
    // Sign it (default with HS256 algorithm)
    String fbdatastring = jwt.sign(SecretKey(MobileSecretKey));
    http.Response response = await http.post(
      url,
      body: {'data':fbdatastring},
      headers: {
        'Application-Id': '$appId',
      },
    );

    if (response.statusCode != 200) {

      throw Exception('Unable to register user from the REST API');
    }
    var responseJson = json.decode(response.body);
    if(responseJson['status']==true){
      // print(responseJson['data']['data']);
      if(responseJson['data']['data']!=null){
        responseJson['data']['user']=await this.decodeToken(responseJson['data']['data']);
      }
      // print(responseJson['data']['user']);
      return User.fromJson(responseJson['data']['user']);
    }else{
      throw Exception(responseJson['msg']);
    }

  }
}