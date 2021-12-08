import 'package:equatable/equatable.dart';

class PayerName extends Equatable {

  final String givenName;
  final String? surname;


  const PayerName({
      required this.givenName,
      this.surname,
  });
  @override
  List<Object> get props => [
    givenName,
  ];

  static PayerName fromJson(dynamic json) {
    String surname="";
    if(json['surname']!=null){
      surname=json['surname'];
    }
    return PayerName(
        givenName: json['given_name'],
      surname:surname,
    );
  }
  toJson() {
    return {
      "given_name": givenName,
      "surname": surname
    };
  }

}