import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legarage/features/explore_page/logic/toggle_panel_cubit/toggle_panel_cubit.dart';

class ToggleGesture extends StatelessWidget {
  const ToggleGesture({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.read<TogglePanelCubit>().togglePanel,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Center(
            child: Container(
              height: 5.h,
              width: 30.h,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: Text(
              "iSpot",
              style: TextStyle(
                  fontSize: 36.h, color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
        ],
      ),
    );
  }
}
