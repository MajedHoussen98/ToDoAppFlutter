import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intro_login_rigester/model/task.dart';

class TodoItem extends StatelessWidget {
  Task task;
  int index;
  Function onChecked;
  TodoItem({this.task, this.index, this.onChecked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: Theme.of(context).textTheme.headline2,
      ),
      subtitle: Text(
        DateFormat("MMM d hh:mm").format(task.date),
        style: Theme.of(context).textTheme.headline4,
      ),
      trailing: Checkbox(
        value: task.status,
        onChanged: (_) => onChecked(index),
        activeColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
