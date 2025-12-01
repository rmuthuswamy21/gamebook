import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../game_provider.dart';

const String SCENE_ID_KEY = 'scene_id';
const String START_SCENE_ID = 'start';

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
  final String sceneID;
  const ChoiceSave({super.key, required this.sceneID});

  Future saveGame() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SCENE_ID_KEY, sceneID);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            await saveGame();
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

  Future loadGame() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(SCENE_ID_KEY) ?? START_SCENE_ID;
    return id;
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
            notifier.value =
                notifier.value.copyWith(currentPageId: savedScene);
          },
          icon: const Icon(Icons.download),
        ),
        const Text("Load"),
      ],
    );
  }
}
