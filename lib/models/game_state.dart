import 'game_model.dart';

class GameState {
  final Map<String, GamePage> phase;
  final String currentPhaseId;

  const GameState({
    required this.phase,
    required this.currentPhaseId,
  });

  GamePage get currentPage => phase[currentPhaseId]!;

  GameState copyWith({
    Map<String, GamePage>? phases,
    String? currentPageId,
  }) {
    return GameState(
      phase: phases ?? this.phase,
      currentPhaseId: currentPageId ?? this.currentPhaseId,
    );
  }
}
