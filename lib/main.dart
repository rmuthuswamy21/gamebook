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
    // CHAPTER 1 – PRESEASON & FIRST IMPRESSIONS

    'start': GamePage(
      id: 'start',
      appBarTitle: 'Chapter 1 – Page 1',
      imageAsset: 'assets/CH01_01.png',
      aspectRatio: 16 / 18,
      headline: 'First Day, Last Chance',
      body: '',
      choices: const [
        GameChoice(
          text: 'Reassure your mom you’ll be careful.',
          nextId: 'ch1_p2_locker_room',
          ph: 0,
          mh: 5,
          tc: 0,
          ss: 0,
          cr: 0,
        ),
        GameChoice(
          text: 'Brush it off and joke that you’ll be a warrior.',
          nextId: 'ch1_p2_locker_room',
          ph: 0,
          mh: -5,
          tc: 0,
          ss: 5,
          cr: 0,
        ),
      ],
    ),

    'ch1_p2_locker_room': GamePage(
      id: 'ch1_p2_locker_room',
      appBarTitle: 'Chapter 1 – Page 2',
      imageAsset: 'assets/ch1_p2_locker_room.png',
      aspectRatio: 16 / 14,
      headline: 'Locker Room Noise',
      body: '',
      choices: const [
        GameChoice(
          text: 'Nod along with Coach and loudly agree about “no quit.”',
          nextId: 'ch1_p3_warmups',
          ph: 0,
          mh: -5,
          tc: 5,
          ss: 5,
          cr: 0,
        ),
        GameChoice(
          text: 'Quietly go ask Ms. Hall what baseline testing actually does.',
          nextId: 'ch1_p6_baseline',
          ph: 0,
          mh: 5,
          tc: -2,
          ss: -2,
          cr: -5,
        ),
      ],
    ),

    'ch1_p3_warmups': GamePage(
      id: 'ch1_p3_warmups',
      appBarTitle: 'Chapter 1 – Page 3',
      imageAsset: 'assets/ch1_p3_warmups.png',
      aspectRatio: 16 / 14,
      headline: 'Proving Yourself in Warm-Ups',
      body: '',
      choices: const [
        GameChoice(
          text: 'Go all out, matching Drew stride for stride.',
          nextId: 'ch1_p4_first_hit',
          ph: -5,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 2,
        ),
        GameChoice(
          text: 'Pace yourself and focus on form and breathing.',
          nextId: 'ch1_p4_first_hit',
          ph: 5,
          mh: 5,
          tc: -5,
          ss: -2,
          cr: 0,
        ),
      ],
    ),

    'ch1_p4_first_hit': GamePage(
      id: 'ch1_p4_first_hit',
      appBarTitle: 'Chapter 1 – Page 4',
      imageAsset: 'assets/ch1_p4_first_hit.png',
      aspectRatio: 16 / 14,
      headline: 'First Tackling Drill, First Big Hit',
      body: '',
      choices: const [
        GameChoice(
          text: 'Shake it off and jog back to the line, pretending you’re fine.',
          nextId: 'ch1_p5_tough_or_stupid',
          ph: -10,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 10,
        ),
        GameChoice(
          text: 'Step out of line and walk toward Ms. Hall.',
          nextId: 'ch1_p6_baseline',
          ph: 5,
          mh: 5,
          tc: -10,
          ss: -5,
          cr: 0,
        ),
      ],
    ),

    'ch1_p5_tough_or_stupid': GamePage(
      id: 'ch1_p5_tough_or_stupid',
      appBarTitle: 'Chapter 1 – Page 5',
      imageAsset: 'assets/ch1_p5_tough_or_stupid.png',
      aspectRatio: 16 / 14,
      headline: 'Tough or Stupid?',
      body: '',
      choices: const [
        GameChoice(
          text: 'Keep matching Malik hit for hit to prove you’re not scared.',
          nextId: 'ch1_p7_coach_approval',
          ph: -10,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 10,
        ),
        GameChoice(
          text: 'Quietly adjust your technique to avoid helmet-to-helmet contact.',
          nextId: 'ch1_p7_coach_approval',
          ph: -2,
          mh: 2,
          tc: 0,
          ss: 0,
          cr: -5,
        ),
      ],
    ),

    'ch1_p6_baseline': GamePage(
      id: 'ch1_p6_baseline',
      appBarTitle: 'Chapter 1 – Page 6',
      imageAsset: 'assets/ch1_p6_baseline.png',
      aspectRatio: 16 / 14,
      headline: 'Baseline Testing',
      body: '',
      choices: const [
        GameChoice(
          text: 'Answer everything honestly, including the dizziness.',
          nextId: 'ch1_p8_locker_aftermath_setup',
          ph: 5,
          mh: 10,
          tc: -5,
          ss: -5,
          cr: -5,
        ),
        GameChoice(
          text: 'Downplay symptoms and rush through the test.',
          nextId: 'ch1_p8_locker_aftermath_setup',
          ph: 0,
          mh: -5,
          tc: 2,
          ss: 3,
          cr: 5,
        ),
      ],
    ),

    'ch1_p7_coach_approval': GamePage(
      id: 'ch1_p7_coach_approval',
      appBarTitle: 'Chapter 1 – Page 7',
      imageAsset: 'assets/ch1_p7_coach_approval.png',
      aspectRatio: 16 / 14,
      headline: 'Coach’s Approval',
      body: '',
      choices: const [
        GameChoice(
          text: 'Bask in the praise and ignore Ms. Hall’s look.',
          nextId: 'ch1_p8_locker_aftermath_setup',
          ph: -2,
          mh: 5,
          tc: 5,
          ss: 5,
          cr: 3,
        ),
        GameChoice(
          text: 'Ask Coach if you can schedule time with Ms. Hall after.',
          nextId: 'ch1_p8_locker_aftermath_setup',
          ph: 2,
          mh: 5,
          tc: -5,
          ss: -2,
          cr: -5,
        ),
      ],
    ),

    'ch1_p8_locker_aftermath_setup': GamePage(
      id: 'ch1_p8_locker_aftermath_setup',
      appBarTitle: 'Chapter 1 – Page 8',
      imageAsset: 'assets/ch1_p8_locker_aftermath.png',
      aspectRatio: 16 / 14,
      headline: 'Locker Room Aftermath',
      body: '',
      choices: const [
        GameChoice(
          text: 'Laugh it off and repost the clip.',
          nextId: 'ch1_p9_family_dinner',
          ph: 0,
          mh: -5,
          tc: 5,
          ss: 10,
          cr: 5,
        ),
        GameChoice(
          text: 'Feel uneasy and keep your phone in your locker.',
          nextId: 'ch1_p9_family_dinner',
          ph: 0,
          mh: 5,
          tc: -2,
          ss: -5,
          cr: 0,
        ),
      ],
    ),

    'ch1_p9_family_dinner': GamePage(
      id: 'ch1_p9_family_dinner',
      appBarTitle: 'Chapter 1 – Page 9',
      imageAsset: 'assets/ch1_p9_family_dinner.png',
      aspectRatio: 16 / 14,
      headline: 'Family Dinner',
      body: '',
      choices: const [
        GameChoice(
          text: 'Side with Dad, saying it’s all part of the game.',
          nextId: 'ch1_p10_school_work',
          ph: 0,
          mh: -5,
          tc: 0,
          ss: 5,
          cr: 5,
        ),
        GameChoice(
          text: 'Admit to your mom you did feel dizzy for a second.',
          nextId: 'ch1_p10_school_work',
          ph: 5,
          mh: 5,
          tc: 0,
          ss: -5,
          cr: -5,
        ),
      ],
    ),

    'ch1_p10_school_work': GamePage(
      id: 'ch1_p10_school_work',
      appBarTitle: 'Chapter 1 – Page 10',
      imageAsset: 'assets/ch1_p10_school_work.png',
      aspectRatio: 16 / 14,
      headline: 'School-Work Balance',
      body: '',
      choices: const [
        GameChoice(
          text: 'Promise to come in for extra help after practice.',
          nextId: 'ch1_p11_first_party',
          ph: -2,
          mh: 5,
          tc: -2,
          ss: 0,
          cr: 0,
        ),
        GameChoice(
          text: 'Shrug it off, saying you’ll be fine.',
          nextId: 'ch1_p11_first_party',
          ph: 0,
          mh: -5,
          tc: 0,
          ss: 2,
          cr: 0,
        ),
      ],
    ),

    'ch1_p11_first_party': GamePage(
      id: 'ch1_p11_first_party',
      appBarTitle: 'Chapter 1 – Page 11',
      imageAsset: 'assets/ch1_p11_first_party.png',
      aspectRatio: 16 / 14,
      headline: 'First Party Invite',
      body: '',
      choices: const [
        GameChoice(
          text: 'Say you’re definitely going to the party.',
          nextId: 'ch1_p12_subtle_symptoms',
          ph: -5,
          mh: 5,
          tc: 5,
          ss: 10,
          cr: 2,
        ),
        GameChoice(
          text: 'Say you might skip to rest up.',
          nextId: 'ch1_p12_subtle_symptoms',
          ph: 5,
          mh: 5,
          tc: -5,
          ss: -5,
          cr: 0,
        ),
      ],
    ),

    'ch1_p12_subtle_symptoms': GamePage(
      id: 'ch1_p12_subtle_symptoms',
      appBarTitle: 'Chapter 1 – Page 12',
      imageAsset: 'assets/ch1_p12_subtle_symptoms.png',
      aspectRatio: 16 / 14,
      headline: 'Subtle Symptoms',
      body: '',
      choices: const [
        GameChoice(
          text: 'Ignore the symptoms and focus on the scrimmage.',
          nextId: 'ch1_p13_first_scrimmage',
          ph: -5,
          mh: -5,
          tc: 5,
          ss: 2,
          cr: 5,
        ),
        GameChoice(
          text: 'Decide to talk to Ms. Hall again after school.',
          nextId: 'ch1_p13_first_scrimmage',
          ph: 5,
          mh: 5,
          tc: -3,
          ss: -2,
          cr: -5,
        ),
      ],
    ),

    'ch1_p13_first_scrimmage': GamePage(
      id: 'ch1_p13_first_scrimmage',
      appBarTitle: 'Chapter 1 – Page 13',
      imageAsset: 'assets/ch1_p13_first_scrimmage.png',
      aspectRatio: 16 / 14,
      headline: 'First Scrimmage, First Real Test',
      body: '',
      choices: const [
        GameChoice(
          text: 'Lower your head and charge through full speed.',
          nextId: 'ch2_p14_big_hit',
          ph: -10,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 10,
        ),
        GameChoice(
          text: 'Cut outside, taking a safer angle but less yardage.',
          nextId: 'ch2_p14_big_hit',
          ph: -2,
          mh: 2,
          tc: -5,
          ss: -2,
          cr: -5,
        ),
      ],
    ),
  };

  return GameState(
    phase: phases,
    currentPhaseId: 'start',
    stats: const PlayerStats(),
  );
}
