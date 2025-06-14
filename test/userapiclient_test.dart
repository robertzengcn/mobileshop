import 'package:test/test.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/User.dart';

void main() {

  group('UserApi', ()
  {
    test('login by facebook', () async {
      final userApiclient = UserApiClient();
      // await userApiclient.downloadSecretkey();
      String username = "lining test";
      String email = "liningtest@testtest.com";
      String assessCode = "Uj87k^7Lrr8VUJryFtjO";
      String userId = "36589652236523";
      User newUser = await userApiclient.loginbyFb(
          username, email, assessCode, userId);
      print(newUser);
      // expect(counter.value, 1);
    });
    test('user login by google', () async {
      final userApiclient = UserApiClient();
     //await userApiclient.downloadSecretkey();
      String username = "lining test";
      String email = "pujingdadi@testtest.com";
      User newUser = await userApiclient.loginbyGg(
          username, email);
      print(newUser);
    });
  });
}