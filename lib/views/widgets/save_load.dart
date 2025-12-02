import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../game_provider.dart';
import '../../../models/data_layer.dart';

const String SCENE_ID_KEY = 'scene_id';
const String START_SCENE_ID = 'start';
const String STAT_PH_KEY = 'stat_ph';
const String STAT_MH_KEY = 'stat_mh';
const String STAT_TC_KEY = 'stat_tc';
const String STAT_SS_KEY = 'stat_ss';
const String STAT_CTE_KEY = 'stat_cte';

class MessageDialog {
  final String title;
  final String message;
  const MessageDialog({required this.title, required this.message});

  Future show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class ChoiceSave extends StatelessWidget {
  const ChoiceSave({super.key});

  Future<void> saveGame(GameState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SCENE_ID_KEY, state.currentPhaseId);
    await prefs.setDouble(STAT_PH_KEY, state.stats.physicalHealth);
    await prefs.setDouble(STAT_MH_KEY, state.stats.mentalHealth);
    await prefs.setDouble(STAT_TC_KEY, state.stats.teamChemistry);
    await prefs.setDouble(STAT_SS_KEY, state.stats.socialStatus);
    await prefs.setDouble(STAT_CTE_KEY, state.stats.cteRisk);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final notifier = GameProvider.of(context);
            await saveGame(notifier.value);
            const messageDialog = MessageDialog(
              title: 'Saved!',
              message: 'The current scene is saved in the game data.',
            );
            if (!context.mounted) return;
            await messageDialog.show(context);
          },
          icon: const Icon(Icons.save),
        ),
        const Text("Save"),
      ],
    );
  }
}

class ChoiceLoad extends StatelessWidget {
  const ChoiceLoad({super.key});

  Future<SavedGameData> loadGame() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(SCENE_ID_KEY) ?? START_SCENE_ID;
    final defaultStats = const PlayerStats();
    final stats = PlayerStats(
      physicalHealth: prefs.getDouble(STAT_PH_KEY) ?? defaultStats.physicalHealth,
      mentalHealth: prefs.getDouble(STAT_MH_KEY) ?? defaultStats.mentalHealth,
      teamChemistry: prefs.getDouble(STAT_TC_KEY) ?? defaultStats.teamChemistry,
      socialStatus: prefs.getDouble(STAT_SS_KEY) ?? defaultStats.socialStatus,
      cteRisk: prefs.getDouble(STAT_CTE_KEY) ?? defaultStats.cteRisk,
    );
    return SavedGameData(sceneId: id, stats: stats);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final savedScene = await loadGame();
            if (!context.mounted) return;
            const messageDialog = MessageDialog(
              title: 'Loaded!',
              message: 'Now we resume the game from the saved data.',
            );
            await messageDialog.show(context);

            final notifier = GameProvider.of(context);
            notifier.value = notifier.value.copyWith(
              currentPageId: savedScene.sceneId,
              stats: savedScene.stats,
            );
          },
          icon: const Icon(Icons.download),
        ),
        const Text("Load"),
      ],
    );
  }
}

class SavedGameData {
  final String sceneId;
  final PlayerStats stats;

  const SavedGameData({
    required this.sceneId,
    required this.stats,
  });
}
