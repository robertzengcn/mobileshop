import 'package:equatable/equatable.dart';

class RedirectUrls extends Equatable {
  final String return_url;
  final String cancel_url;
  const RedirectUrls({
    required this.return_url,
    required this.cancel_url,
  });
  @override
  List<Object> get props => [
    return_url,cancel_url
  ];
  toJson() {
    return {
      "return_url":return_url,
      "cancel": cancel_url,
    };
  }
}