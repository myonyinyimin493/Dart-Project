import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/Add_appointment.dart';
import 'package:final_year_project/All_collective_page.dart';
import 'package:final_year_project/View_page.dart';
import 'package:final_year_project/Viewdataformain.dart';
import 'package:final_year_project/viewfunction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home_page_le extends StatelessWidget {
  Home_page_le({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFF1FEFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0XFF15B3C2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => view_page()),
                            );
                          },
                          icon: Icon(Icons.calendar_month_outlined),
                          iconSize: 40,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Appointments"),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 50),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0XFF15B3C2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {

                          },
                          icon: Icon(Icons.edit),
                          iconSize: 40,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text("Update Booking"),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 65),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0XFF15B3C2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.cancel),
                          iconSize: 40,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: Text("Cancel"),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
                  'Today Appointment',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            SizedBox(height: 5,),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Booking").where("Date",isEqualTo: DateFormat('yyyy-MM-dd').format(DateTime.now())).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(
                    ),

                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  // physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder:(context,index)=>viewdataformain(
                    snap: snapshot.data!.docs[index].data(),
                  ),

                );

              },
            ),
          ],
        ),
      ),
    );
  }
}
