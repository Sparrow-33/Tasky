import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:first_mobile/controllers/task_controller.dart';
import 'package:first_mobile/services/notification_service.dart';
import 'package:first_mobile/services/theme_service.dart';
import 'package:first_mobile/ui/addTaskBar.dart';
import 'package:first_mobile/ui/theme.dart';
import 'package:first_mobile/ui/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../conf/db.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _addTaskBar(),
                  MyButton(label: "+ Add Task",
                      onTap: () async {
                      await Get.to(AddTaskBar());
                      _taskController.getTasks();
                      }
                  ),
                ],
              )),

         _addDateBar(),
         SizedBox(height: 20,),
         _showTasks(),
        ],
      ),
    );
  }

   _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Color.fromARGB(255, 68, 28, 248),
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: subHeadingStyle,
          ),
          Text(
            "Today",
            style: headingStyle,
          ),
        ],
      ),
    );
  }

   _appBar() {
    return AppBar(
      elevation: 0,
      // backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          NotificationService().displayNotification();
          print(Get.isDarkMode);
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/avatar.png",
          ),
          backgroundColor: Colors.white,
        ),
        SizedBox(width: 20)
      ],
    );
  }

  // _showTasks() {
  //    return Expanded(
  //        child:Obx(() {
  //          return ListView.builder(
  //              itemCount:_taskController.taskList.length,
  //
  //              itemBuilder: (_, context){
  //                print("HELLO LENGTH ${_taskController.taskList.length}");
  //             return Container(
  //               width: 100,
  //               height:50 ,
  //               color: Colors.cyan,
  //               margin: const EdgeInsets.only(bottom: 10),
  //             );
  //          });
  //        }),
  //    );
  // }
  _showTasks() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('task').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Text('Loading...');
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (_, index) {
              final task = snapshot.data?.docs[index].data() as Map<String, dynamic>;
              return Container(
                width: 100,
                height: 50,
                color: Colors.cyan,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(task!['title']),
              );
            },
          );
        },
      ),
    );
  }
}
