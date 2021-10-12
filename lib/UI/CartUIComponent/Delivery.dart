import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/UI/CartUIComponent/CartLayout.dart';
import 'package:amigatoy/Blocs/blocs.dart';
import 'package:amigatoy/Repository/repository.dart';
import 'package:amigatoy/Models/models.dart';

class delivery extends StatefulWidget {
  @override
  _deliveryState createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CountriesBloc>(create: (context) {
            //加载产品的评论
            return CountriesBloc(
                customerAddressRepository: CustomerAddressRepository())
              ..add(QueryCountriesEvent());
          }),
          BlocProvider<ZonesBloc>(create: (context) {
            return ZonesBloc(
                customerAddressRepository: CustomerAddressRepository())
              ..add(QueryZoneEvent(countId: 223));
          }),
          BlocProvider<CustomerAddressBloc>(create: (context) {
            //加载产品的评论
            return CustomerAddressBloc(
                customerAddressRepository: CustomerAddressRepository());
          }),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<CountriesBloc, CountriesState>(
                listener: (context, state) {
              if (state is QueryCountriesErrorState) {
                var snackbar = SnackBar(
                  content: Text("query countries list failure"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            }),
            BlocListener<CustomerAddressBloc, CustomerAddressState>(
                listener: (context, state) {
              if (state is AddCustomerAddsuccessState) {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new cart()));
              }else if(state is CustomerAddressErrorState){
                var snackbar = SnackBar(
                  content: Text(state.error),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            }),
          ],
          child: DeliveryWrapper(),
        ));
  }
}

class DeliveryWrapper extends StatefulWidget {
  @override
  _DeliveryWrapperState createState() => _DeliveryWrapperState();
}

class _DeliveryWrapperState extends State<DeliveryWrapper> {
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool _showState = false;
  List<Zones?> _zoneList = [];
  int? _zoneId;
  int _countriesId = 223;
  List<Countries> _countriesList = [];
  String _firstName = "";
  String _lastName = "";
  String? _company;
  String _streetAddress = "";
  String? _postcode = "";
  String _city = "";
  String _state = "";
  String _telephone = "";

  InputDecoration _getInputdect(String inputName) {
    return InputDecoration(
        border: UnderlineInputBorder(),
        labelText: inputName,
        hintStyle: TextStyle(color: Colors.black54));
  }

  ///show countries list
  Widget _countrieslist() {
    return DropdownButton<int>(
      isExpanded: true,
      value: _countriesId,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      hint: Container(
        //and here
        child: Text(
          "Countries",
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.end,
        ),
      ),
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int? newValue) {
        setState(() {
          if (newValue != null) {
            setState(() {
              _countriesId = newValue;
            });
            BlocProvider.of<ZonesBloc>(context)
                .add(QueryZoneEvent(countId: _countriesId));
          }
        });
      },
      items: _countriesList.map<DropdownMenuItem<int>>((map) {
        return DropdownMenuItem<int>(
          value: map.countriesId,
          child: Text(map.countriesName),
        );
      }).toList(),
    );
  }

  ///zone list
  Widget _getZonelist() {
    return DropdownButton<int>(
      isExpanded: true,
      value: _zoneId,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      hint: Container(
        //and here
        child: Text(
          "Select State/Province/Region",
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.end,
        ),
      ),
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int? newValue) {
        setState(() {
//          dropdownValue = newValue!;
          _zoneId = newValue;
        });
      },
      items: _zoneList.map<DropdownMenuItem<int>>((map) {
        if (map != null) {
          return DropdownMenuItem<int>(
            value: map.zone_id,
            child: Text(map.zone_name),
          );
        } else {
          return DropdownMenuItem<int>(
            value: 0,
            child: Text('Please choose State/Province/Region'),
          );
        }
      }).toList(),
    );
  }

  ///delivery app page
  Widget _scaffoldDiv() {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Icon(Icons.arrow_back)),
        elevation: 0.0,
        title: Text(
          "Add shipping address",
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: BlocListener<ZonesBloc, ZonesState>(
                listener: (context, state) {
                  if (state is Zonesloadedstate) {
                    setState(() {
                      _zoneList = state.zones;
                      if (_zoneList.length > 0) {
                        _showState = true;
                      } else {
                        _showState = false;
                      }
                    });
                  }
                },
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Where are your ordered items shipped ?",
                        style: TextStyle(
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.0,
                            color: Colors.black54,
                            fontFamily: "Gotik"),
                      ),
                      Padding(padding: EdgeInsets.only(top: 50.0)),
                      TextFormField(
                        decoration: _getInputdect('First Name'),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter First Name';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          if (value != null) {
                            setState(() {
                              _firstName = value;
                            });
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      TextFormField(
                        decoration: _getInputdect('Last Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Last Name';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          if (value != null) {
                            setState(() {
                              _lastName = value;
                            });
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      _countrieslist(),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      if (!_showState)
                        TextFormField(
                          decoration: _getInputdect('State'),
                        ),
                      if (_showState) _getZonelist(),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      TextFormField(
                        decoration: _getInputdect('Phone'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Phone';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          if (value != null) {
                            setState(() {
//                              print(304);
                              _telephone = value;
                            });
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      TextFormField(
                        decoration: _getInputdect('City'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter City';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          if (value != null) {
                            setState(() {
                              _city = value;
                            });
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      TextFormField(
                        decoration: _getInputdect('Street Address'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Street Address';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          if (value != null) {
                            setState(() {
                              _streetAddress = value;
                            });
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      TextFormField(
                        decoration: _getInputdect('postal code'),
                        onSaved: (String? value) {
                          if (value != null) {
                            setState(() {
                              _postcode = value;
                            });
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 50.0)),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );

                            CustomerAddress customerAdd=CustomerAddress(
                                city: _city,
                                company: _company,
                                firstName: _firstName,
                                lastName: _lastName,
                                countryId: _countriesId,
                                state: _state,
                                streetAddress: _streetAddress,
                                telephone: _telephone,
                              postcode: _postcode
                            );

                            BlocProvider.of<CustomerAddressBloc>(context).add(
                                AddCustomerAddressEvent(
                                    customerAddress:customerAdd
                                ));
                          }
//                      Navigator.of(context).pushReplacement(PageRouteBuilder(
//                          pageBuilder: (_, __, ___) => payment()));

//                      BlocProvider.of<CustomerAddressBloc>(context).add(
//                          );
                        },
                        child: Container(
                          height: 55.0,
                          width: 300.0,
                          decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          child: Center(
                            child: Text(
                              "Save Address",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.5,
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, countriesstate) {
      if (countriesstate is QueryCountriesSuccessState) {
        _countriesList = countriesstate.countries;
//            BlocBuilder<ZonesBloc, ZonesState>(
//              builder: (context, zonesstate) {
//              if(zonesstate is Zonesloadedstate){
//                _zoneList=zonesstate.zones;
//              }
        return _scaffoldDiv();
//            }
//            );
      }
      return Container();
    });
  }
}
