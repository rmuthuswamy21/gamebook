import 'package:flutter/material.dart';
import 'game_provider.dart';
import 'models/data_layer.dart';
import 'views/game_screen.dart';

void main() => runApp(const LostOnAnIslandApp());

class LostOnAnIslandApp extends StatelessWidget {
  const LostOnAnIslandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost on an Island',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: false),
      home: GameProvider(
        notifier: ValueNotifier<GameState>(_initialGame()),
        child: const GameScreen(),
      ),
    );
  }
}

GameState _initialGame() {
  final phases = <String, GamePage>{
    'start': GamePage(
      id: 'start',
      appBarTitle: 'Start Page of Gamebook',
      imageAsset: 'assets/Island_Intro.png',
      aspectRatio: 16 / 18,
      headline: 'Welcome to LOST ON AN ISLAND:  A Survival Adventure!',
      body: 'Click an icon to make your choice.',
      choices: const [
        GameChoice(text: 'Start your quest.', nextId: 'first_choice'),
      ],
    ),
    'first_choice': GamePage(
      id: 'first_choice',
      appBarTitle: 'First Choice',
      imageAsset: 'assets/FirstChoice.png',
      aspectRatio: 16 / 14,
      headline: 'You awaken on a beach…',
      body: 'You awaken on a beach, the wreckage of your plane scattered around. '
          'The jungle hums behind you, the ocean stretches endlessly ahead.\n\n'
          'Click an icon to make your choice.',
      choices: const [
        GameChoice(text: 'Venture into the jungle.', nextId: 'pathA'),
        GameChoice(text: 'Stay on the beach.', nextId: 'pathB'),
      ],
    ),
    'pathA': GamePage(
      id: 'pathA',
      appBarTitle: 'Path A - Survivor First Choice',
      imageAsset: 'assets/PathA_A0.png',
      aspectRatio: 16 / 14,
      headline: 'Into the jungle',
      body: 'You push into the dense jungle. You find fruit trees, a freshwater stream — '
          'and strange footprints.\n\nClick an icon to make your choice.',
      choices: const [
        GameChoice(text: 'Follow the footprints.', nextId: 'pathA_A1'),
        GameChoice(text: 'Avoid them and build a shelter.', nextId: 'pathA_B1'),
      ],
    ),
    'pathA_A1': GamePage(
      id: 'pathA_A1',
      appBarTitle: 'Path A - The Strangers Camp',
      imageAsset: 'assets/PathA_A1.png',
      aspectRatio: 16 / 14,
      headline: 'You follow the footprints',
      body: 'You discover a small camp — a survivor named Church. He has been here for weeks. '
          'He offers food but seems… distrustful.',
      choices: const [
        GameChoice(text: 'Trust Church and share supplies.', nextId: 'pathA_A2A'),
        GameChoice(text: 'Take his supplies and leave.', nextId: 'pathA_A2B'),
      ],
    ),
    'pathA_A2A': GamePage(
      id: 'pathA_A2A',
      appBarTitle: 'Path A - The Alliance',
      imageAsset: 'assets/PathA_A2A.png',
      aspectRatio: 16 / 14,
      headline: 'Teamwork makes the dream work',
      body: 'Together, you build a raft and escape the island safely.\n\n'
          'THE END.',
      choices: const [
        GameChoice(text: 'Play again for new ending', nextId: 'start'),
      ],
    ),
    'pathA_A2B': GamePage(
      id: 'pathA_A2B',
      appBarTitle: 'Path A - The Betrayal',
      imageAsset: 'assets/PathA_A2B.png',
      aspectRatio: 16 / 14,
      headline: 'You betray Church',
      body: 'You steal his supplies and leave him behind. Alone, you struggle to survive. '
          'Days later, you succumb to the island\'s dangers.\n\n'
          'THE END.',
      choices: const [
        GameChoice(text: 'Play again for new ending', nextId: 'start'),
      ],  
    ),
    'pathA_B1': GamePage(
      id: 'pathA_B1',
      appBarTitle: 'Path A - The Shelter',
      imageAsset: 'assets/PathA_B1.png',
      aspectRatio: 16 / 14,
      headline: 'You build a shelter',
      body: 'You avoid the footprints and build a shelter. Days pass, and you grow weak. '
          'One night, a resucue plane flies overhead, but a jaguar is stalking your camp.\n\n'
          'Click an icon to make your choice.',
      choices: const [
        GameChoice(text: 'Shoot your flare at the plane', nextId: 'pathA_B2A'),
        GameChoice(text: 'Shoot your flare at the jaguar', nextId: 'pathA_B2B'),
      ],
    ),
    'pathA_B2A': GamePage(
      id: 'pathA_B2A',
      appBarTitle: 'Path A - The Rescue',
      imageAsset: 'assets/PathA_B2A.png',
      aspectRatio: 16 / 14,
      headline: 'You signal the plane',
      body: 'Your flare lights up the sky. Scares away the jaguar. '
        'The plane sees you and rescues you from the island.\n\n'
        'THE END.',
      choices: const [
        GameChoice(text: 'Play again for new ending', nextId: 'start'),
      ],
    ),
    'pathA_B2B': GamePage(
      id: 'pathA_B2B',
      appBarTitle: 'Path A - The Attack',
      imageAsset: 'assets/PathA_B2B.png',
      aspectRatio: 16 / 14,
      headline: 'You fend off the jaguar',
      body: 'You slay the jaguar and love the rush of victory. You venture deeper into the jungle, '
        'You become an apex predator of the island. It is your new home now.\n\n'
        'THE END.',
      choices: const [
        GameChoice(text: 'Play again for new ending', nextId: 'start'),
      ],
    ),
    'pathB': GamePage(
      id: 'pathB',
      appBarTitle: 'Path B - Hopeful First Choice',
      imageAsset: 'assets/PathB_B0.png',
      aspectRatio: 16 / 14,
      headline: 'Hold the beach',
      body: 'You stay on the beach and collect debris from the wreckage. '
          'The sun burns hot, and your water runs low.\n\n'
          'Click an icon to make your choice.',
      choices: const [
        GameChoice(text: 'Build a signal fire', nextId: 'pathB_A1'),
        GameChoice(text: 'Search the coastline for supplies', nextId: 'pathB_B1'),
      ],
    ),
    'pathB_A1': GamePage(
      id: 'pathB_A1',
      appBarTitle: 'Path B - The Signal Fire',
      imageAsset: 'assets/PathB_A1.png',
      aspectRatio: 16 / 14,
      headline: 'You build a signal fire',
      body: 'You manage to light a fire with flares. Hours later, smoke on the horizon — a ship! '
          'But the storm clouds roll in fast.\n\n'
          'Click an icon to make your choice.',
      choices: const [
        GameChoice(text: 'Swim out to ship', nextId: 'pathB_A2A'),
        GameChoice(text: 'Wait for the storm to pass', nextId: 'pathB_A2B'),
      ],
    ),
    'pathB_A2A': GamePage(
      id: 'pathB_A2A',
      appBarTitle: 'Path B - Swim to the Ship',
      imageAsset: 'assets/PathB_A2A.png',
      aspectRatio: 16 / 14,
      headline: 'You swim out to the ship',
      body: 'The crew rescues you — you live to tell the tale!\n\n'
          'THE END.',
      choices: const [
        GameChoice(text: 'Play again for new ending', nextId: 'start'),
      ],
    ),
    'pathB_A2B': GamePage(
      id: 'pathB_A2B',
      appBarTitle: 'Path B - The Storm',
      imageAsset: 'assets/PathB_A2B.png',
      aspectRatio: 16 / 14,
      headline: 'You wait for the storm to pass',
      body: 'The storm rages through the night. You survive'
          'The fire dies, and the ship disappears and you are stuck forever.\n\n'
          'THE END.',
      choices: const [
        GameChoice(text: 'Play again for new ending', nextId: 'start'),
      ],
    ),
    'pathB_B1': GamePage(
      id: 'pathB_B1',
      appBarTitle: 'Path B - The Search',
      imageAsset: 'assets/PathB_B1.png',
      aspectRatio: 16 / 14,
      headline: 'You search the coastline',
    body: 'You find an old cave with carvings — signs of previous castaways. '
          'Inside, there is a locked chest and strange symbols.\n\n'
          'Click an icon to make your choice.',
      choices: const [
        GameChoice(text: 'Leave it alone, and go back and try signal flare', nextId: 'pathB_A1'),
        GameChoice(text: 'Open the chest', nextId: 'pathB_B2'),
      ],
    ),
    'pathB_B2': GamePage(
      id: 'pathB_B2',
      appBarTitle: 'Path B - The Chest',
      imageAsset: 'assets/PathB_B2.png',
      aspectRatio: 16 / 14,
      headline: 'You open the chest',
      body: 'Inside the chest, you a gem with immaculate beauty, '
          'It consumes you, survival means nothing without it. You stay with YOUR gem. Forever.!\n\n'
          'THE END.',
      choices: const [
        GameChoice(text: 'Play again for new ending', nextId: 'start'),
      ],
    ),
  };

  return GameState(phase: phases, currentPhaseId: 'start');
}
