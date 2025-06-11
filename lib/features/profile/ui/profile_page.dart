import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/extensions.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/core/routing/routes.dart';
import 'package:legarage/core/widgets/image_back_ground_container.dart';
import 'package:legarage/features/profile/logic/get_cars_cubit/get_cars_cubit.dart';
import 'package:legarage/features/profile/logic/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:legarage/features/profile/ui/widgets/profile_page_lisnter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<int> getUserId() async {
    String saveId =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
    return int.parse(saveId);
  }

  @override
  void initState() {
    super.initState();
    getUserId().then((userid) {
        context.read<GetUserDataCubit>().getUserData(userid).whenComplete(() {});
        context.read<GetCarsCubit>().getCars(userid).whenComplete(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await SharedPrefHelper.clearAllSecuredData();
                context.pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  (Route<dynamic> route) => false,
                  predicate: (Route<dynamic> route) => false,
                );
              },
              icon: Icon(
                Icons.logout_sharp,
                color: Color(0xFF1F3171),
              ))
        ],
        title: const Text(
          'Profile Page',
          style: TextStyle(color:Color(0xFF1F3171)),
        ),
        backgroundColor: Colors.transparent,
      ),

      // Body
      body:  const Stack(
        children: [
           ImageBackGroundContainer(
            imagePath: 'assets/images/blue_gradiant_background.png',
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: ProfilePageLisnter()
            ),
          ),
        ],
      ),
    );
  }
}
