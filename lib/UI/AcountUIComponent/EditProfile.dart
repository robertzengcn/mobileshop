import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:email_validator/email_validator.dart';

// /// Custom Text Header
// var _txtCustomHead = TextStyle(
//   color: Colors.black54,
//   fontSize: 17.0,
//   fontWeight: FontWeight.w600,
//   fontFamily: "Gotik",
// );

/// Custom Text Detail
// var _txtCustomSub = TextStyle(
//   color: Colors.black38,
//   fontSize: 13.5,
//   fontWeight: FontWeight.w500,
//   fontFamily: "Gotik",
// );

/// Declare example Credit Card
// String numberCC = "9867 - 2312 - 3212 - 4213";
// String nameCC = "Alissa Hearth";
// String cvvCC = "765";

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  Widget _scaffoldWidget() {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        title: Text(
          "Edit Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
              color: Colors.black54,
              fontFamily: "Gotik"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF6991C7)),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is queryUserinfosuccessstate) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30.0, left: 15.0),
                    //   child: Text(
                    //     "Card Information",
                    //     style: _txtCustomHead,
                    //   ),
                    // ),
                    edituserCard(userinfo: state.userinfo),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(top: 30.0, left: 15.0, bottom: 10.0),
                    //   child: Text(
                    //     "Transactions Details",
                    //     style: _txtCustomHead.copyWith(fontSize: 16.0),
                    //   ),
                    // ),
                    // transactionsDetail()
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQuery = MediaQuery.of(context);
    // return BlocProvider(
    //   create: (context) => UsersBloc(userRepository: new UserRepository())
    //     ..add(getUserinfoevent()),
    //   child:
    // );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UsersBloc(userRepository: new UserRepository())
              ..add(getUserinfoevent())),
        BlocProvider(
            create: (context) =>
                UpdateUserBloc(userRepository: new UserRepository(),
                )),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UpdateUserBloc, UpdateUserState>(
              listener: (context, state) {
            if (state is UpdateUsersuccessstate) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('update user info success')),
              );
            } else if (state is UpdateUserErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          }),
        ],
        child: _scaffoldWidget(),
      ),
    );
  }
}

class edituserCard extends StatefulWidget {
  final UserInfo userinfo;
  const edituserCard({Key? key, required this.userinfo}) : super(key: key);
  @override
  _edituserCardState createState() => _edituserCardState();
}

/// Constructor for Card
class _edituserCardState extends State<edituserCard> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: widget.userinfo.firstname + " " + widget.userinfo.lastname);
    final _telephoneController = TextEditingController(text:widget.userinfo.telephone);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Your name"),
                // initialValue:
                //     widget.userinfo.firstname + " " + widget.userinfo.lastname,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Email(CAN NOT CHANGE!)"),
                initialValue: widget.userinfo.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else {
                    bool emailValid = EmailValidator.validate(value);

                    if (!emailValid) {
                      return 'email address error';
                    }
                  }
                  return null;
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Your telephone"),
                // initialValue: widget.userinfo.telephone,
                controller: _telephoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your telephone';
                  }
                  return null;
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    BlocProvider.of<UpdateUserBloc>(context).add(
                        Updateinfoevent(
                            name: _nameController.text,
                            telephone: _telephoneController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Constructor for Transactions
// class transactionsDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // MediaQueryData mediaQuery = MediaQuery.of(context);
//     return Padding(
//       padding: const EdgeInsets.only(
//           top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(5.0)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 4.5,
//               spreadRadius: 1.0,
//             )
//           ],
//         ),
//         child: Column(
//           children: <Widget>[
//             dataTransaction(
//               date: "Jan 01",
//               item: "Buy Dress Red Valvet",
//               price: "\$ 50",
//             ),
//             dataTransaction(
//               date: "Feb 12",
//               item: "Buy Iphone X",
//               price: "\$ 1000",
//             ),
//             dataTransaction(
//               date: "Martch 21",
//               item: "Buy Mackbook Pro M21102 SSD 500 GB",
//               price: "\$ 2500",
//             ),
//             dataTransaction(
//               date: "Oct 16",
//               item: "Buy Case Handphone Hello Kity",
//               price: "\$ 50",
//             ),
//             dataTransaction(
//               date: "Dec 01",
//               item: "Buy Dress Blue ",
//               price: "\$ 50",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// Constructor for Transactions Data
// class dataTransaction extends StatelessWidget {
//   @override
//   String date, item, price;
//
//   dataTransaction(
//       {required this.date, required this.item, required this.price});
//
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(right: 10.0),
//                 child: Text(
//                   date,
//                   style: _txtCustomSub.copyWith(
//                       color: Colors.black38,
//                       fontSize: 11.0,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               Container(
//                 width: 130.0,
//                 child: Text(
//                   item,
//                   style: _txtCustomSub.copyWith(color: Colors.black54),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               Text(price,
//                   style: _txtCustomSub.copyWith(
//                     color: Colors.redAccent,
//                     fontSize: 16.0,
//                   )),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: Divider(
//             height: 0.5,
//             color: Colors.black12,
//           ),
//         ),
//       ],
//     );
//   }
// }
