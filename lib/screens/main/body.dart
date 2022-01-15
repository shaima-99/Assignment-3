// TODO Complete the file, main/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with 'FutureBuilder' widget.
//      For todo items with the status has been 'done', they should be displayed
//      with the 'line through'. Otherwise, display it with normal text.
//
//   2. Perform the following operations:
//        a. Edit a todo - i.e., when the user tap a todo.
//           This operation will navigate to the '/edit' route.
//        b. Delete a todo - i.e. when the user long-press a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  get _todoList => null;

  get todo => null;



 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future:  _state.todoListFuture,
      builder: (context, snapshot){
if (snapshot.hasData){
  _state.todoList = snapshot.data;

  return _buildListview (context);
}
else{
 
  
  return Center (child: CircularProgressIndicator());
}
      }
    );
   
  }
  ListView _buildListview(BuildContext context){
    return ListView.separated(
      itemCount: _state.todoList.length,
      separatorBuilder: (context, index)=> Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => ListTile(
        title:  Text('${_state.todoList[index].title}',
        style: TextStyle(
          decoration:  _state.todoList[index].done == true
          ? TextDecoration.lineThrough
          : TextDecoration.none
        )
        ),
        subtitle: Text('${_state.todoList[index].description}'),
        onTap: ()=> onTap(context,index,_state.todoList[index]),
        onLongPress:() => _state.removeTodo(index),
      )
       );
  }

 void  onTap(BuildContext context, int index, todoList) async {
   final _todo = await Navigator.pushNamed(context, '/edit',
  arguments: _todoList[index]);
 
   if ( todo != null){
     _state.updateTodo();}
 }

 
}

