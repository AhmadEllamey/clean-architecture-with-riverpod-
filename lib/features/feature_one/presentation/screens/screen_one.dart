import 'package:clean_architecture_demo/features/feature_one/presentation/states/one_state.dart';
import 'package:clean_architecture_demo/features/feature_one/presentation/view_models/one_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenOne extends ConsumerStatefulWidget {
  const ScreenOne({super.key});

  @override
  ConsumerState<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends ConsumerState<ScreenOne> {
  /// this is the screen provider and it's scoop

  final provider = StateNotifierProvider<OneViewModel, OneState>(
    (ref) {
      return OneViewModel(
        OneState(title: "Hello"),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text(
            ref.watch(provider).title,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
