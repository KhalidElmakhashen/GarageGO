import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/di/dependency_injection.dart';
import 'package:legarage/features/current_page/ui/current_page.dart';
import 'package:legarage/features/current_page/logic/delete_reservation_cubit/delete_reservation_cubit.dart';
import 'package:legarage/features/explore_page/logic/add_reservation_cubit/add_reservation_cubit.dart';
import 'package:legarage/features/explore_page/logic/garage_by_id_cubit/garagebyid_cubit.dart';
import 'package:legarage/features/explore_page/logic/toggle_panel_cubit/toggle_panel_cubit.dart';
import 'package:legarage/features/explore_page/logic/update_ui_cubit/update_ui_cubit.dart';
import 'package:legarage/features/explore_page/ui/explore_page.dart';
import 'package:legarage/features/google_map/logic/current_position_cubit/google_map_cubit.dart';
import 'package:legarage/features/google_map/logic/garages_cubit/garages_cubit.dart';
import 'package:legarage/features/main_wrapper/widgets/nav_bar.dart';
import 'package:legarage/features/notification/ui/notification_page.dart';
import 'package:legarage/features/profile/logic/get_cars_cubit/get_cars_cubit.dart';
import 'package:legarage/features/profile/logic/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:legarage/features/profile/ui/profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // App Body
      body: PageView(
        physics: currentPage == 0 ? const NeverScrollableScrollPhysics() : null,
        onPageChanged: (int index) => setState(() {
          currentPage = index;
        }),
        controller: pageController,
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TogglePanelCubit(),
              ),
              BlocProvider(
                create: (context) => GoogleMapCubit(),
              ),
              BlocProvider(
                create: (context) => getIt<GaragesCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<GaragebyidCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AddReservationCubit>(),
              ),
              BlocProvider(
                create: (context) => UpdateUiCubit(),
              ),
            ],
            child: ExplorePage(),
          ),
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GaragebyidCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<DeleteReservationCubit>(),
              ),
            ],
            child: const CurrentPage(),
          ),
          const NotificationPage(),
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetUserDataCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<GetCarsCubit>(),
              ),
            ],
            child: const ProfilePage(),
          ),
        ],
      ),

      // Navigation Bar
      bottomNavigationBar: MyNavBar(
        pageController: pageController,
        index: currentPage,
      ),
    );
  }
}
