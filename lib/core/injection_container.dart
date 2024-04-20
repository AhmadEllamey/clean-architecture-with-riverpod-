import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'network_view_model.dart';

final isConnectedProvider =
    StateNotifierProvider<NetworkViewModel, bool>((ref) {
  return NetworkViewModel();
});

