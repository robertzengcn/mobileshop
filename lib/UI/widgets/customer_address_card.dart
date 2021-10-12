import 'package:flutter/material.dart';
import 'package:amigatoy/Models/models.dart';

Widget getCusterAdd(CustomerAddress customeradd, bool editor) {
  String showText=customeradd.streetAddress +
      ' ' +
      customeradd.city +
      ' ' +
      customeradd.state +
      ' ' +
      customeradd.telephone;
  if(customeradd.countriesName!=null){
    showText=showText+customeradd.countriesName.toString();
  }
  return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    ListTile(
      leading: Icon(Icons.album),
      title:
          Text('shipping to: ' + customeradd.firstName + customeradd.lastName),
      subtitle: Text(
          showText,
          overflow: TextOverflow.ellipsis),
    ),
    if (editor)
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            child: const Text('Edit'),
            onPressed: () {/* ... */},
          ),
          const SizedBox(width: 8),
        ],
      ),
  ]));
}
