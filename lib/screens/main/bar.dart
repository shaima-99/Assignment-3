// TODO Complete the file, main/bar.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether the user has logged in or not).
//      This includes:
//        a. The app bar shows 'unknown user' logo and the 'Login' button if
//           the user has not logged in yet.
//
//        b. Otherwise (if the user has logged in), the app bar shows the user
//           photo and name, as well as the 'Logout' button.
//
//   2. Perform the following operations:
//        a. Login  - This operation will navigate to the '/login' route.
//        b. Logout - This will reset the 'user' state to 'null'.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'main_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  final MainScreenState _state;
  const Bar({state}) : _state = state;

  @override
  Widget build(BuildContext context) {
   if(_state.loginUser == true){ return AppBar(
      leading:
          CircleAvatar(backgroundImage: NetworkImage('${_state.user.photoUrl}')),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Todo List'),
          Text('_state.user.name', style: TextStyle(fontSize: 12.0)),
        ],
      ),
      actions: [IconButton(icon: Icon(Icons.login), onPressed: () => _onLogout())],
    );
  }
  else {
    return AppBar(
      leading:
          CircleAvatar(backgroundImage: AssetImage('assets/unknown_user.png')),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Todo List'),
          Text('User name goes here', style: TextStyle(fontSize: 12.0)),
        ],
      ),
      actions: [IconButton(icon: Icon(Icons.login), onPressed: () => _onLogin(context))],
    );
  
  }
}

void _onLogout() => _state.user = null;
 

  _onLogin(BuildContext context) async {

final _user = await Navigator.pushNamed(context, '/login');
if (_user != null){
  _state.user =_user;
  _state.loginUser = true;
}}}
