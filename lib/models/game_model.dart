import 'game_choice.dart';

class GamePage {
  final String id;
  final String appBarTitle;
  final String imageAsset;
  final double aspectRatio;
  final String headline;
  final String body;
  final List<GameChoice> choices;

  const GamePage({
    required this.id,
    required this.appBarTitle,
    required this.imageAsset,
    required this.aspectRatio,
    required this.headline,
    required this.body,
    required this.choices,
  });
}
