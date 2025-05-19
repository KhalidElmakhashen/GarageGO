import 'package:flutter/material.dart';

class SpotDetailsCard extends StatelessWidget {
  final String garageName;
  final String location;
  final String avgPrice;
  final String slotNo;
  final String floorNO;
  final String buildingNo;
  final String vichelType;

  const SpotDetailsCard({
    required this.garageName,
    required this.location,
    required this.avgPrice,
    required this.slotNo,
    required this.floorNO,
    required this.buildingNo,
    required this.vichelType,
    super.key,
  });

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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Current Spot Details: ",
            //       style: TextStyle(
            //         color: Theme.of(context).colorScheme.primary,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     GestureDetector(child: Icon(Icons.qr_code_2_rounded,size: 30,color: Theme.of(context).colorScheme.surface,),onTap: () {

            //     },)
            //   ],
            // ),
            // Divider(
            //   height: 8,
            //   thickness: 2,
            //   color: Theme.of(context).colorScheme.surface,
            //   endIndent: MediaQuery.of(context).size.width / 2,
            // ),
            const Text(
              '• Garage Name ',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              '        $garageName',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[300],
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              '• Location ',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              '        $location',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue[300],
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      '• Slot No. ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '    $slotNo',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[300],
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '• Floor No. ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '    $floorNO',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[300],
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '• Building No. ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '    $buildingNo',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[300],
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
                    const Text(
                      '• Vichel Type ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '    $vichelType',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[300],
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      '• Avg. Price/hour',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      '    $avgPrice',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[300],
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
