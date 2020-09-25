import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_login_rigester/activates/add_task.dart';
import 'package:intro_login_rigester/model/task.dart';
import 'package:intro_login_rigester/services/auth.dart';
import 'package:intro_login_rigester/widgets/todo_item.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeActivity> {
  List<Task> _todoList = [];
  AuthBase authBase = AuthBase();

  @override
  void initState() {
    _todoList = [
      Task(title: "Learn Dart Language", date: DateTime.now()),
      Task(
        title: "Learn Flutter Framework",
        date: DateTime.now(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: buildFloatingActionButton(context),
      appBar: buildAppBar(),
      body:  buildColumn(context),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: _addTask,
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: null)
      ],
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(context),
        buildToDoBody(),
      ],
    );
  }

  Padding buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.event_note,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "All",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "${_todoList.length} tasks",
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }

  Expanded buildToDoBody() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 30, top: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: ListView.builder(
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return TodoItem(
                task: _todoList[index],
                index: index,
                onChecked: buildChecked,
              );
            }),
      ),
    );
  }

  buildChecked(int index) {
    setState(() {
      _todoList[index].status = !_todoList[index].status;
    });
  }

  _addTask() async {
    Task _task = await Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true, builder: (context) => AddTask()));

    if (_task == null) {
      return;
    } else {
      setState(() {
        _todoList.add(_task);
      });
    }
  }

}
