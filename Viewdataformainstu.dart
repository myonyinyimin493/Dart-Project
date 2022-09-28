import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/All_collective_page.dart';
import 'package:final_year_project/auth_controller.dart';
import 'package:flutter/material.dart';

class viewdataformainstu extends StatelessWidget {
  final snap;
  const viewdataformainstu({Key? key,required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 4,
      shadowColor: Colors.black,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: width*0.90,
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 30,
                //
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
                        "From-"+snap['Start_time']+" "+"To-"+snap['End_time'],
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                  // FirebaseFirestore.instance.collection(Proname).doc(Pdate).set(data,SetOptions(merge: true)).then((value) => message());
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  firestore.collection("Booking").add(data);
                  firestore.collection("Lecturers").doc(ID).delete();
                },
                child: const Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );

  }


}
