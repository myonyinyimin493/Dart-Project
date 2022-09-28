import 'package:final_year_project/Add_appointment.dart';
import 'package:final_year_project/Home_page.dart';
import 'package:final_year_project/Profilelec.dart';
import 'package:final_year_project/View_page.dart';
import 'package:final_year_project/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Profile.dart';

class all_collective extends StatefulWidget {
    String email;
   all_collective({Key? key,required this.email}) : super(key: key);

  @override
  State<all_collective> createState() => _all_collectiveState();
}

class _all_collectiveState extends State<all_collective> {
  List pages=[
    Home_page(),
    add_appointment(),
    // profile(),
  ];
  int current=0;

  void onTap(int index){
    if(index==3){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => profilelec(email: widget.email.toString(),)),);
    }
    else{
      setState(()
      {
        current=index;
      }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              children: [
                Text("Welcome",style: TextStyle(fontSize: 30),textAlign: TextAlign.right),
                SizedBox(height: 10,),
                Text(widget.email,textAlign:TextAlign.right,style: TextStyle(fontSize: 15),),
              ],
            ),
          ],
        ),
        backgroundColor: Color(0XFF15B3C2),shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
          )
      ),
        toolbarHeight: 150,
      ),
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Color(0XFF15B3C2),
        selectedItemColor: Colors.black54,
        onTap: onTap,
        currentIndex: current,
        unselectedItemColor: Colors.black.withOpacity(0.9),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'Appointment'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }

}
