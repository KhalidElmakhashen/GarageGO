// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarInfoCard extends StatelessWidget {
  String? carModel;
  String? plateNumber;
  String? carType;

  CarInfoCard({
    Key? key,
    this.carModel,
    this.plateNumber,
    this.carType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Text(
                "Car Model        :",
                style: TextStyle(fontSize: 16.h, color: Colors.black),
              ),
              title: Text(carModel ?? "NO Data",
                  style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700])),
            ),
            ListTile(
              leading: Text(
                "Plate Number  :",
                style: TextStyle(fontSize: 16.h, color: Colors.black),
              ),
              title: Text(plateNumber ?? "NO Data",
                  style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700])),
            ),
            ListTile(

              leading: Text(
                "Car Type          :",
                style: TextStyle(fontSize: 16.h, color: Colors.black),
              ),
              title: Text(carType ?? "NO Data",
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
