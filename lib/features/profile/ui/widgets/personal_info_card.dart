



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoCard extends StatelessWidget {
  String? fullName;
  String? phoneNumber;


   PersonalInfoCard({
     this.fullName,
     this.phoneNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.h),
          bottomRight: Radius.circular(8.h),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
            leading: Text(
              "Full Name         :",
              style: TextStyle(fontSize: 16.h, color: Colors.black),
            ),
            title: Text( fullName ?? "NO Data",
                    style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700])),
          ),
            ListTile(
            leading: Text(
              "Phone Number :",
              style: TextStyle(fontSize: 16.h, color: Colors.black),
            ),
            title: Text( phoneNumber ?? "NO Data",
                    style: TextStyle(
                        fontSize: 18.h,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700])),
          ),
          
          ],
        ),
      ),
    );
  }
}
