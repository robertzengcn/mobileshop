import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:http_auth/http_auth.dart';
import 'package:amigatoy/constants/application_constants.dart';
// import 'package:amigatoy/Models/Invoice.dart';
import 'package:amigatoy/Models/PaypalRequest.dart';

class PaypalServices {

//  String domain = "https://api.sandbox.paypal.com"; // for sandbox mode
//  String domain = "https://api.paypal.com"; // for production mode

  // change clientId and secret with your own, provided by paypal
//  String clientId = 'Ab4vS4vmfQFgUuQMH49F9Uy3L1FdNHtfGrASCyjNijm_EkHWCFM96ex0la-YFbwavw41R3rTKU3k_Bbm';
//  String secret = 'EDjvPfYgTYqdYWR2BfOiBW4dz_jeeuadqH7Z98pZMDvY33PcViiooqYFWVPFSGbfKBfNOb3LnroSI1hv';

  /// for getting the access token from Paypal
  Future<String> getAccessToken() async {
    try {
      var client = BasicAuthClient(paypalClientId, paypalSecret);
      var url = Uri.parse('$paypalDomain/v1/oauth2/token?grant_type=client_credentials');
      var response = await client.post(url);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body["access_token"];
      }else{
        throw Exception('get paypal AccessToken error');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// for creating the payment request with Paypal
  Future<Map<String, String>> createPaypalPayment(
      Object paypalrequest, accessToken) async {
    try {
       // Map<String, dynamic> invoiceJson=paypalrequest.toJson();
       // print(jsonEncode(invoiceJson));

      // invoiceJson['redirect_urls']['return_url']=paypalReturnUrl;
      // invoiceJson['redirect_urls']['cancel']=Uri.parse(paypalCancelUrl);
      var url = Uri.parse("$paypalDomain/v2/checkout/orders");
      // print(url);
      print(jsonEncode(paypalrequest));
      var response = await http.post(url,
          body: jsonEncode(paypalrequest),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = jsonDecode(response.body);
      print(body);
      if (response.statusCode == 201) {
        if (body["links"] != null && body["links"].length > 0) {
          List links = body["links"];

          String executeUrl = "";
          String approvalUrl = "";
          final item = links.firstWhere((o) => o["rel"] == "approve",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item["href"];
          }
          final item1 = links.firstWhere((o) => o["rel"] == "execute",
              orElse: () => null);
          if (item1 != null) {
            executeUrl = item1["href"];
          }
          return {"executeUrl": executeUrl, "approvalUrl": approvalUrl};
        }else{
          throw Exception(body["create paypal payment failure, link empty"]);
        }

      } else {
        throw Exception(body["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  // for executing the payment transaction
  Future<String> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(url,
          body: jsonEncode({"payer_id": payerId}),
          headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer ' + accessToken
          });

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body["id"];
      }else{
        throw Exception("excute payment failure, response code not equal 200");
      }

    } catch (e) {
      rethrow;
    }
  }
}