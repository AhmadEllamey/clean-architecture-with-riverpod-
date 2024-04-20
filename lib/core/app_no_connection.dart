import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_texts.dart';

class AppNoConnection extends StatelessWidget {
  final void Function()? onTap;
  const AppNoConnection({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.h,),
              Padding(
                padding: const EdgeInsetsDirectional.all(0),
                child: Text(
                  AppTexts.noConnection.message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColors.textSecondaryColor),
                ),
              ),
              SizedBox(height: 20.h,),
              Expanded(
                child: InkWell(
                    onTap: onTap ?? (){},
                    child: Image.asset(AppAssets.wifiIc.imagePath)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
