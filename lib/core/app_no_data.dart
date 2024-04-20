import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';

class AppNoData extends StatelessWidget {
  final bool show;
  final String msg;
  final Widget? noDataView;

  const AppNoData({super.key, this.show = false, this.msg = "", this.noDataView});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !show,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child:  SingleChildScrollView(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        msg,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                      noDataView ??SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          AppAssets.noData.imagePath,
                        ),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
