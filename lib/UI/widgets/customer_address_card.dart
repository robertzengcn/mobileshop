import 'package:amigatoy/Arguments/AddressArguments.dart';
import 'package:flutter/material.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/CartUIComponent/Delivery.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';

Widget getCusterAdd(CustomerAddress customeradd, bool editor,context,bool asDefult) {
  String showText=customeradd.streetAddress +
      ' ' +
      customeradd.city +
      ' ' +
      customeradd.state;

  if(customeradd.zoneName!=null&&customeradd.zoneName!.length>0){
    showText=showText+' '+customeradd.zoneName!;
  }
  if(customeradd.countriesName!=null){
    showText=showText+' '+customeradd.countriesName.toString();
  }
  showText=showText+' '+customeradd.telephone;

  return Card(
    color: asDefult?Colors.white:Colors.deepOrangeAccent.withOpacity(0.3),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    ListTile(
      leading: Icon(Icons.album),
      title:
          Text('shipping to: ' + customeradd.firstName +' '+ customeradd.lastName),
      subtitle: Text(
          showText,
          textAlign: TextAlign.left),
    ),
    if (editor)
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            child: const Text('Edit'),
            onPressed: () {
              Navigator.pushNamed(context, Delivery.routeName,
                  arguments: AddressArguments(customeradd)
              );
             },
          ),
          const SizedBox(width: 8),
          if(asDefult)TextButton(
              child: const Text('Use it'),
              onPressed: () {
                BlocProvider.of<CustomerAddressBloc>(context)
                    .add(SetdefaultAddressEvent(customerAddid: customeradd.addressBookId!));
              },
            ),

        ],
      ),
  ]));
}
