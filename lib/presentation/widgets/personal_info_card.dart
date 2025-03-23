



import 'package:flutter/material.dart';

class PersonalInfoCard extends StatelessWidget {
  final String fullName;
  final String nationalId;
  final String gender;
  final String age;

  const PersonalInfoCard({
    required this.fullName,
    required this.nationalId,
    required this.gender,

    required this.age,
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
                  "Personal Info: ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(child: Icon(Icons.person_pin,size: 30,color: Theme.of(context).colorScheme.surface,),onTap: () {
                  
                },)
              ],
            ),
            Divider(
              height: 8,
              thickness: 2,
              color: Theme.of(context).colorScheme.surface,
              endIndent: MediaQuery.of(context).size.width / 2,
            ),
            Text(
              '• Full Name ',
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              '        $fullName',
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              '• National ID ',
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              '        $nationalId',
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
                      '• Age ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $age',
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
                      '• Gender',
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      '    $gender',
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
