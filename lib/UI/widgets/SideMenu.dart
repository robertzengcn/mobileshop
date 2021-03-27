import 'package:flutter/material.dart';
import 'package:amigatoy/ListItem/notificationsData.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amigatoy/Blocs/blocs.dart';
//import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/UI/LoginOrSignup/LoginAnimation.dart';

class SideMenu extends StatefulWidget {
  @override
  _sidemenuState createState() => _sidemenuState();
}

class _sidemenuState extends State<SideMenu> {


  Widget build(BuildContext context) {
    return BlocBuilder<MenusBloc, MenusState>(
    builder: (context, state) {
      if(state is MenusEmpty){// is loading
        return Center(child: CircularProgressIndicator());
      }
    if(state is Menusloaded){
      final menusliders = state.lstMenu;
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Menu",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                  color: Colors.black54,
                  fontFamily: "Gotik"),
            ),
            iconTheme: IconThemeData(
              color: const Color(0xFF6991C7),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
              itemCount: menusliders.length,
              padding: const EdgeInsets.all(5.0),
              itemBuilder: (context, position) {
                return Container(
                      height: 88.0,
                      child: Column(
                        children: <Widget>[
                          Divider(height: 5.0),
                          ListTile(
                            title: Text(
                              '${menusliders[position].title}',
                              style: TextStyle(
                                  fontSize: 17.5,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top:6.0),
                              child: Container(
                                width: 440.0,
                                child: Text(
                                  '${menusliders[position].desc}',
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black38
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            leading: Column(
                              children: <Widget>[
                                Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(60.0)),
                                      image: DecorationImage(image: AssetImage('assets/img/Logo.png'),fit: BoxFit.cover)
                                  ),
                                )
                              ],
                            ),
//                            onTap: () => _onTapItem(context, menusliders[position]),
                          ),
                          Divider(height: 5.0),
                        ],
                      ),
                    );
//                );
              })
      );

    }
      return Center(child: CircularProgressIndicator());
    }
    );
  }
}
void _onTapItem(BuildContext context, Post post) {
  Scaffold
      .of(context)
      .showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
}







