import 'package:equatable/equatable.dart';

class PayOrderApplication extends Equatable {
  final String brandName;
  final String locale;
  final String? landingPage;
  final String? userAction;
  final String returnUrl;
  final String cancelUrl;
  const PayOrderApplication({
    required this.brandName,
    required this.locale,
    this.landingPage,
    this.userAction,
    required this.returnUrl,
    required this.cancelUrl,
  });

  @override
  List<Object> get props => [
    brandName,
    locale,
    returnUrl,
    cancelUrl
  ];

  static PayOrderApplication fromJson(dynamic json) {
    return PayOrderApplication(
      brandName: json['brandName'],
      locale:json['locale'],
        landingPage:json['landingPage'],//LOGIN or BILLING,NO_PREFERENCE
        userAction:json['userAction'],//continue or pay now
        returnUrl:json['returnUrl'],
        cancelUrl:json['cancelUrl'],
    );
  }
  toJson() {
    return {
      "brand_name": brandName,
      "locale": locale,
      "landing_page":landingPage,
      "user_action":userAction,
      "return_url":returnUrl,
      "cancel_url":cancelUrl
    };
  }
}