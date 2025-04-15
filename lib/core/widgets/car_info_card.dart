



import 'package:flutter/material.dart';

class CarInfoCard extends StatelessWidget {
  final String model;
  final String licensePlateNumbe;
  final String fuelType;
  final String year;
  final String transmission;
  final String insuranceStatus;
  final String lincenseExpiryDate;



  const CarInfoCard({
    required this.model,
    required this.licensePlateNumbe,
    required this.fuelType,
    required this.year,
    required this.insuranceStatus,
    required this.transmission,
    required this.lincenseExpiryDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Car Info: ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(child: Icon(Icons.directions_car,size: 30,color: Theme.of(context).colorScheme.surface,),onTap: () {
                  
                },)
              ],
            ),
            Divider(
              height: 8,
              thickness: 2,
              color: Theme.of(context).colorScheme.surface,
              endIndent: MediaQuery.of(context).size.width / 2,
            ),
            
           
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      '• Model ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $model',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Column(
                  children: [
                    Text(
                      '• Model Year',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $year',
                      style: const TextStyle(
                          fontSize: 14,
                          color:  Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),Text(
              '• License Plate Numbe ',
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              '        $licensePlateNumbe',
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '• Fuel Type ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $fuelType',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                                const Expanded(child: SizedBox()),
                const Expanded(child: SizedBox()),

                Column(
                  children: [
                    Text(
                      '• Transimission',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $transmission',
                      style: const TextStyle(
                          fontSize: 14,
                          color:  Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '• Insurance Status ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $insuranceStatus',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '• Lincense Expiry Date',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $lincenseExpiryDate',
                      style: const TextStyle(
                          fontSize: 14,
                          color:  Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}