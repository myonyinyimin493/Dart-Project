import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class add_app_stu extends StatefulWidget {
  const add_app_stu({Key? key}) : super(key: key);

  @override
  State<add_app_stu> createState() => _add_app_stuState();
}

class _add_app_stuState extends State<add_app_stu> {
  TimeOfDay time =TimeOfDay(hour: 10, minute: 30);
  TextEditingController _date = TextEditingController();
  TextEditingController _sttime = TextEditingController();
  TextEditingController _edtime = TextEditingController();
  TextEditingController _name = TextEditingController();
  String Postid= const Uuid().v1();
  void _saveInfo(){
    final Proname= _name.text;
    final Pdate = _date.text;
    final Psttime = _sttime.text;
    final Pedtime = _edtime.text;
    final UID= Postid;
    // FirebaseFirestore db = FirebaseFirestore.getInstance();
    if(Proname==null || Pdate==null || Psttime==null || Pedtime==null){

      AlertDialog(title: Text("Please Complete the Text Boxes"),);

    }
    else{
      Map<String, Object> data = new HashMap();
      data["Name"]=Proname;
      data["Start_time"]=Psttime;
      data["End_time"]=Pedtime;
      data["Date"]=Pdate;
      data["Postid"]=UID;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.collection("Reservation").doc(UID).set(data).then((value) => message());

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF1FEFF),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  label: Text("Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _date,
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded),
                  label: Text("Select Date"),
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickeddate != null) {
                    setState(() {
                      _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _sttime,
                decoration: InputDecoration(
                  icon: Icon(Icons.access_time),
                  label: Text("Start Time"),
                ),
                onTap: () async {
                  TimeOfDay? pickedtime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                  );

                  if (pickedtime != null) {
                    setState(() {
                      _sttime.text = TimeOfDay.now().format(context).toString();
                    });
                  }
                  else{

                    _sttime.text=pickedtime as String;

                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: _edtime,
                decoration: InputDecoration(
                  icon: Icon(Icons.access_time),
                  label: Text("End Time"),
                ),
                onTap: () async {
                  TimeOfDay? pickedtime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                  );

                  if (pickedtime != null) {
                    setState(() {
                      _edtime.text = TimeOfDay.now().format(context).toString();
                    });
                  }
                  else{
                    _edtime.text=pickedtime as String;
                  }
                },
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: 200,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.white),),
                color: Color(0XFF15B3C2),
                onPressed: ()=> _saveInfo(),
              ),
            )
          ],
        ),
      ),
    );
  }
  void message(){
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Successful Message'),
        content: const Text('Your reservation have been successful processed'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK') ,
            child: const Text('OK'),
          ),
        ],
      ),
    );

  }
}
