import 'package:clean_architecture_demo/core/app_no_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_texts.dart';
import 'app_loader.dart';
import 'app_no_data.dart';
import 'base_state.dart';
import 'injection_container.dart' as di;

class ScreenHandler extends StatefulWidget {
  final StateNotifierProvider<dynamic, BaseState<dynamic>> screenProvider;
  final void Function()? onDeviceReconnected;
  final String? noDataMessage;
  final Widget? noDataWidget;
  final bool showLoading;
  final Widget child;

  const ScreenHandler({
    super.key,
    required this.screenProvider,
    this.onDeviceReconnected,
    this.noDataMessage,
    this.noDataWidget,
    this.showLoading = true,
    required this.child,
  });

  @override
  ScreenHandlerState createState() {
    return ScreenHandlerState();
  }
}

class ScreenHandlerState extends State<ScreenHandler> {
  bool isConnectedAtLastTime = true;

  late final _isLoadingProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider.select((state) => state.isLoading));
  });

  late final Provider<bool> _noConnectionProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).hasNoConnection;
  });

  late final Provider<bool> _noDataProvider = Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).hasNoData;
  });

  late final Provider<bool> _isPerformingRequestProvider =
      Provider<bool>((ref) {
    return ref.watch(widget.screenProvider).isPerformingRequest;
  });

  late final _isReconnectedProvider = Provider<bool>((ref) {
    bool isConnected = ref.watch(di.isConnectedProvider);
    bool isPerformingRequest = ref.read(_isPerformingRequestProvider);
    if (isConnected &&
        !isConnectedAtLastTime &&
        widget.onDeviceReconnected != null &&
        !isPerformingRequest) {
      Future.delayed(Duration.zero, () {
        widget.onDeviceReconnected!();
      });
    }
    isConnectedAtLastTime = isConnected;
    return isConnected;
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Consumer(
            builder: (_, ref, __) {
              final bool noData = ref.watch(_noDataProvider);
              return AppNoData(
                  show: noData,
                  noDataView: widget.noDataWidget,
                  msg: widget.noDataMessage ?? AppTexts.noData.message);
            },
          ),
          Consumer(
            builder: (_, ref, __) {
              final bool noConnection = ref.watch(_noConnectionProvider);

              ref.watch(_isReconnectedProvider);
              return noConnection
                  ? AppNoConnection(
                      onTap: widget.onDeviceReconnected,
                    )
                  : const SizedBox();
            },
          ),
          if (widget.showLoading)
            Consumer(
              builder: (_, ref, __) {
                final bool isLoading = ref.watch(_isLoadingProvider);
                return isLoading ? const AppLoader() : const SizedBox();
              },
            ),
        ],
      ),
    );
  }
}
