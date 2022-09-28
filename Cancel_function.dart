import 'dart:collection';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/All_collective_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class cancelfunction extends StatelessWidget {
  final snap;
  cancelfunction({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 120,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 30,
                    // backgroundImage: NetworkImage(
                    //   'https://in.pinterest.com/pin/407716572518621090/',
                    // ),
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name - "+snap['Name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Date - "+snap['Date'],
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Start - "+snap['Start_time'],
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "End - "+snap['End_time'],
                          ),

                        ],
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      // padding: const EdgeInsets.all(10.0),
                      primary: Colors.white,
                      backgroundColor:Color(0XFF15B3C2) ,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      final Date = snap['Date'];
                      final Stime = snap['Start_time'];
                      final Etime = snap['End_time'];
                      final LeName = snap['Name'];
                      final ID=snap["Postid"];

                      Map<String, Object> data = new HashMap();
                      data["Name"]=LeName;
                      data["Start_time"]=Stime;
                      data["End_time"]=Etime;
                      data["Date"]=Date;
                      data["ID"]=ID;
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      firestore.collection("Lecturers").doc(ID).delete().then((value) => showAlertDialog(context));

                    },
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cancel Success"),
      content: Text("Your Appointment has been successfully cancelled."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
