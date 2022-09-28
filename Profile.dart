import 'package:flutter/material.dart';

import 'auth_controller.dart';

class profile extends StatefulWidget {
  String email;
   profile({Key? key,required this.email}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF1FEFF),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0XFF15B3C2),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.30,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Color(0XFFF1FEFF),
                          onPressed: () {},
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          widget.email,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.55,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: OutlinedButton.icon(

                          style:OutlinedButton.styleFrom(fixedSize: Size(350, 50),backgroundColor:Color(0XFF15B3C2)),
                          onPressed: () {
                            AuthController.instance.logOut();
                          },
                          icon: Icon(Icons.logout_outlined, size: 20,color: Colors.black,),
                          label: Text("LOG OUT",style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    )
              ],
            ),
      ),
    );
  }
}
