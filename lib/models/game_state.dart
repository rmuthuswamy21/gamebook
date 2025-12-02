import 'game_model.dart';
import 'player_stats.dart';

class GameState {
  final Map<String, GamePage> phase;
  final String currentPhaseId;
  final PlayerStats stats;

  const GameState({
    required this.phase,
    required this.currentPhaseId,
    required this.stats,
  });

  GamePage get currentPage => phase[currentPhaseId]!;

  GameState copyWith({
    Map<String, GamePage>? phases,
    String? currentPageId,
    PlayerStats? stats,
  }) {
    return GameState(
      phase: phases ?? this.phase,
      currentPhaseId: currentPageId ?? this.currentPhaseId,
      stats: stats ?? this.stats,
    );
  }
}
