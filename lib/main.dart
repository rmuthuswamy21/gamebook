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
      appBarTitle: 'Friday Night Pressure',
      imageAsset: 'assets/ch1_start_intro.png',
      aspectRatio: 16 / 18,
      headline: 'Welcome to FRIDAY NIGHT PRESSURE',
      body: '',
      choices: const [
        GameChoice(text: 'Start your season.', nextId: 'ch1_morning'),
      ],
    ),

    'ch1_morning': GamePage(
      id: 'ch1_morning',
      appBarTitle: 'First Morning of Practice',
      imageAsset: 'assets/ch1_morning_kitchen.png',
      aspectRatio: 16 / 14,
      headline: 'First Day, Last Chance',
      body: '',
      choices: const [
        GameChoice(
          text: 'Reassure your mom you will be careful.',
          nextId: 'ch1_locker_room',
        ),
        GameChoice(
          text: 'Brush it off and joke that you will be a warrior.',
          nextId: 'ch1_locker_room',
        ),
      ],
    ),

    'ch1_locker_room': GamePage(
      id: 'ch1_locker_room',
      appBarTitle: 'Locker Room Noise',
      imageAsset: 'assets/ch1_locker_room.png',
      aspectRatio: 16 / 14,
      headline: 'The Locker Room',
      body: '',
      choices: const [
        GameChoice(
          text: 'Back up Coach and talk loudly about not quitting.',
          nextId: 'ch1_warmups',
        ),
        GameChoice(
          text: 'Go over and ask Ms. Hall about the baseline tests.',
          nextId: 'ch1_baseline_test',
        ),
      ],
    ),

    'ch1_warmups': GamePage(
      id: 'ch1_warmups',
      appBarTitle: 'Conditioning',
      imageAsset: 'assets/ch1_warmups.png',
      aspectRatio: 16 / 14,
      headline: 'Proving Yourself in Warm-Ups',
      body: '',
      choices: const [
        GameChoice(
          text: 'Go all out to match Drew stride for stride.',
          nextId: 'ch1_first_big_hit',
        ),
        GameChoice(
          text: 'Pace yourself and focus on form and breathing.',
          nextId: 'ch1_first_big_hit',
        ),
      ],
    ),

    'ch1_first_big_hit': GamePage(
      id: 'ch1_first_big_hit',
      appBarTitle: 'First Big Hit',
      imageAsset: 'assets/ch1_first_big_hit.png',
      aspectRatio: 16 / 14,
      headline: 'First Tackling Drill, First Big Hit',
      body: '',
      choices: const [
        GameChoice(
          text: 'Shake it off and jog back into the drill.',
          nextId: 'ch1_tough_or_stupid',
        ),
        GameChoice(
          text: 'Step out of line and walk toward Ms. Hall.',
          nextId: 'ch1_baseline_test',
        ),
      ],
    ),

    'ch1_tough_or_stupid': GamePage(
      id: 'ch1_tough_or_stupid',
      appBarTitle: 'Playing Through It',
      imageAsset: 'assets/ch1_tough_or_stupid.png',
      aspectRatio: 16 / 14,
      headline: 'Tough or Just Reckless?',
      body: '',
      choices: const [
        GameChoice(
          text: 'Keep crashing into Malik to prove you are not scared.',
          nextId: 'ch1_coach_approval',
        ),
        GameChoice(
          text: 'Quietly adjust your technique to avoid helmet to helmet.',
          nextId: 'ch1_coach_approval',
        ),
      ],
    ),

    'ch1_baseline_test': GamePage(
      id: 'ch1_baseline_test',
      appBarTitle: 'Trainer’s Office',
      imageAsset: 'assets/ch1_baseline_test.png',
      aspectRatio: 16 / 14,
      headline: 'Baseline Testing',
      body: '',
      choices: const [
        GameChoice(
          text: 'Answer honestly, even about dizziness.',
          nextId: 'ch1_coach_approval',
        ),
        GameChoice(
          text: 'Downplay symptoms and rush through the test.',
          nextId: 'ch1_coach_approval',
        ),
      ],
    ),

    'ch1_coach_approval': GamePage(
      id: 'ch1_coach_approval',
      appBarTitle: 'Coach’s Praise',
      imageAsset: 'assets/ch1_coach_approval.png',
      aspectRatio: 16 / 14,
      headline: 'Coach’s Approval',
      body: '',
      choices: const [
        GameChoice(
          text: 'Enjoy the praise and ignore Ms. Hall’s concern.',
          nextId: 'ch1_locker_aftermath',
        ),
        GameChoice(
          text: 'Tell Coach you want to talk more with Ms. Hall later.',
          nextId: 'ch1_locker_aftermath',
        ),
      ],
    ),

    'ch1_locker_aftermath': GamePage(
      id: 'ch1_locker_aftermath',
      appBarTitle: 'After Practice',
      imageAsset: 'assets/ch1_locker_aftermath.png',
      aspectRatio: 16 / 14,
      headline: 'Locker Room Aftermath',
      body: '',
      choices: const [
        GameChoice(
          text: 'Laugh it off and repost the clip.',
          nextId: 'ch1_family_dinner',
        ),
        GameChoice(
          text: 'Feel uneasy and keep your phone in your locker.',
          nextId: 'ch1_family_dinner',
        ),
      ],
    ),

    'ch1_family_dinner': GamePage(
      id: 'ch1_family_dinner',
      appBarTitle: 'Family Dinner',
      imageAsset: 'assets/ch1_family_dinner.png',
      aspectRatio: 16 / 14,
      headline: 'At the Dinner Table',
      body: '',
      choices: const [
        GameChoice(
          text: 'Side with your dad and say it is just part of the game.',
          nextId: 'ch1_school_work',
        ),
        GameChoice(
          text: 'Admit to your mom that you did feel dizzy for a moment.',
          nextId: 'ch1_school_work',
        ),
      ],
    ),

    'ch1_school_work': GamePage(
      id: 'ch1_school_work',
      appBarTitle: 'In Class',
      imageAsset: 'assets/ch1_school_work.png',
      aspectRatio: 16 / 14,
      headline: 'School-Work Balance',
      body: '',
      choices: const [
        GameChoice(
          text: 'Promise to come in for extra help after practice.',
          nextId: 'ch1_first_party',
        ),
        GameChoice(
          text: 'Shrug it off and say you will be fine.',
          nextId: 'ch1_first_party',
        ),
      ],
    ),

    'ch1_first_party': GamePage(
      id: 'ch1_first_party',
      appBarTitle: 'Party Invite',
      imageAsset: 'assets/ch1_first_party_invite.png',
      aspectRatio: 16 / 14,
      headline: 'First Party Invite',
      body: '',
      choices: const [
        GameChoice(
          text: 'Say you are definitely going to the party.',
          nextId: 'ch1_subtle_symptoms',
        ),
        GameChoice(
          text: 'Say you might skip to rest up.',
          nextId: 'ch1_subtle_symptoms',
        ),
      ],
    ),

    'ch1_subtle_symptoms': GamePage(
      id: 'ch1_subtle_symptoms',
      appBarTitle: 'Subtle Symptoms',
      imageAsset: 'assets/ch1_subtle_symptoms.png',
      aspectRatio: 16 / 14,
      headline: 'Headaches and Blurry Numbers',
      body: '',
      choices: const [
        GameChoice(
          text: 'Ignore the symptoms and focus on the scrimmage.',
          nextId: 'ch1_first_scrimmage',
        ),
        GameChoice(
          text: 'Decide to talk to Ms. Hall again after school.',
          nextId: 'ch1_first_scrimmage',
        ),
      ],
    ),

    'ch1_first_scrimmage': GamePage(
      id: 'ch1_first_scrimmage',
      appBarTitle: 'First Scrimmage',
      imageAsset: 'assets/ch1_first_scrimmage.png',
      aspectRatio: 16 / 14,
      headline: 'First Real Test',
      body: '',
      choices: const [
        GameChoice(
          text: 'Lower your head and fight for every yard.',
          nextId: 'ch2_rival_hit',
        ),
        GameChoice(
          text: 'Cut outside and take the safer angle.',
          nextId: 'ch2_rival_hit',
        ),
      ],
    ),
  };

  return GameState(phase: phases, currentPhaseId: 'start');
}
