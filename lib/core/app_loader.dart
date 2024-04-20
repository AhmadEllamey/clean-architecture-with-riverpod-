import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/constants/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.transparent, //Colors.black.withOpacity(.2),
      child: const Center(
        child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              children: [
                SpinKitDualRing(
                  color: AppColors.primaryColor,
                  size: 50,
                ),
              ],
            )),
      ),
    );
  }
}
