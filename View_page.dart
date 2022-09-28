// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/viewfunction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snapshot/snapshot.dart';

class view_page extends StatefulWidget {
   view_page({Key? key}) : super(key: key);

  @override
  State<view_page> createState() => _view_pageState();
}

class _view_pageState extends State<view_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF1FEFF),
        appBar: AppBar(
          title: Text('Add Appointments'),
          backgroundColor: Color(0XFF15B3C2),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
        ),
    body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Lecturers").snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(
            ),

          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder:(context,index)=>viewfunction(
            snap: snapshot.data!.docs[index].data(),
          ),

         );

      },
    ),
        );
  }
}
