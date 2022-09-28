import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/Cancel_function.dart';
import 'package:flutter/material.dart';

class cancel_app extends StatefulWidget {
  const cancel_app({Key? key}) : super(key: key);

  @override
  State<cancel_app> createState() => _cancel_appState();
}

class _cancel_appState extends State<cancel_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF1FEFF),
      appBar: AppBar(
        title: Text('Cancel Appointments'),
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
            itemBuilder:(context,index)=>cancelfunction(
              snap: snapshot.data!.docs[index].data(),
            ),

          );

        },
      ),
    );
  }
}
