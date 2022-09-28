import 'package:final_year_project/All_collective_page.dart';
import 'package:final_year_project/auth_controller.dart';
import 'package:flutter/material.dart';

class viewdataformain extends StatelessWidget {
  final snap;
  const viewdataformain({Key? key,required this.snap}) : super(key: key);

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

                },
                child: const Text('View'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
