import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intro_login_rigester/model/task.dart';
import 'package:intro_login_rigester/widgets/original_button.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController _controller = TextEditingController();
  DateTime _taskDateTime = DateTime.now();
  Task _newTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "New Task",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context, null);
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 40),
                  child: TextField(
                    controller: _controller,
                    minLines: 4,
                    maxLines: 6,
                    decoration: InputDecoration(
                        hintText: "What are you planning",
                        fillColor: Colors.white),
                  ),
                ),
                FlatButton(
                  onPressed: _pickDate,
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat("MMM d hh:mm").format(_taskDateTime),
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: OriginalButton(
              text: "Add new task",
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  _newTask = Task(title: _controller.text, date: _taskDateTime);
                  Navigator.pop(context, _newTask);
                }
              },
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.white,
              onPrimary: Theme.of(context).primaryColor,
              surface: Theme.of(context).primaryColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.deepPurple,
          ),
          child: child,
        );
      },
    );

    if (date == null) {
      return;
    }

    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.white,
              onPrimary: Theme.of(context).primaryColor,
              surface: Theme.of(context).primaryColor,
              onSurface: Colors.white,
            ),
          ),
          child: child,
        );
      },
    );

    setState(() {
      _taskDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time == null ? _taskDateTime.hour : time.hour,
          time == null ? _taskDateTime.minute : time.minute);
    });
  }
}
