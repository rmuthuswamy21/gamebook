import 'package:flutter/material.dart';
import 'models/data_layer.dart';

class GameProvider extends InheritedNotifier<ValueNotifier<GameState>> {
  const GameProvider({
    super.key,
    required Widget child,
    required ValueNotifier<GameState> notifier,
  }) : super(child: child, notifier: notifier);

  static ValueNotifier<GameState> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GameProvider>()!.notifier!;
  }
}
