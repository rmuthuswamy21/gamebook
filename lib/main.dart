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
    // ============
    // CHAPTER 2 – MIDSEASON PRESSURE
    // ============

    // Page 14 – The Hit That Matters
    'ch2_p14_big_hit': GamePage(
      id: 'ch2_p14_big_hit',
      appBarTitle: 'Chapter 2 – Page 14',
      imageAsset: 'assets/ch2_p14_big_hit.png',
      aspectRatio: 16 / 14,
      headline: 'The Hit That Matters',
      body: '',
      choices: const [
        GameChoice(
          text: 'Pop up fast and stay in the game.',
          nextId: 'ch2_p15_morning_after',
          ph: -15,
          mh: -10,
          tc: 15,
          ss: 10,
          cr: 15,
        ),
        GameChoice(
          text: 'Stay down and ask to be checked.',
          nextId: 'ch2_p15_morning_after',
          ph: 10,
          mh: 5,
          tc: -10,
          ss: -10,
          cr: 0,
        ),
      ],
    ),

    // Page 15 – Morning After
    'ch2_p15_morning_after': GamePage(
      id: 'ch2_p15_morning_after',
      appBarTitle: 'Chapter 2 – Page 15',
      imageAsset: 'assets/ch2_p15_morning_after.png',
      aspectRatio: 16 / 14,
      headline: 'Morning After',
      body: '',
      choices: const [
        GameChoice(
          text: 'Admit the headache is bad and ask to see a doctor.',
          nextId: 'ch2_p16_film_room',
          ph: 15,
          mh: 10,
          tc: -10,
          ss: -5,
          cr: -10,
        ),
        GameChoice(
          text: 'Say you’re fine and watch film with the team.',
          nextId: 'ch2_p16_film_room',
          ph: -5,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 10,
        ),
      ],
    ),

    // Page 16 – Film Room
    'ch2_p16_film_room': GamePage(
      id: 'ch2_p16_film_room',
      appBarTitle: 'Chapter 2 – Page 16',
      imageAsset: 'assets/ch2_p16_film_room.png',
      aspectRatio: 16 / 14,
      headline: 'Film Room',
      body: '',
      choices: const [
        GameChoice(
          text: 'Soak in the praise and ignore the pain.',
          nextId: 'ch2_p17_risky_drills',
          ph: -2,
          mh: -5,
          tc: 5,
          ss: 5,
          cr: 5,
        ),
        GameChoice(
          text: 'Sit in the back and dim your screen.',
          nextId: 'ch2_p17_risky_drills',
          ph: 2,
          mh: 5,
          tc: -3,
          ss: -3,
          cr: -2,
        ),
      ],
    ),

    // Page 17 – Risky Drills
    'ch2_p17_risky_drills': GamePage(
      id: 'ch2_p17_risky_drills',
      appBarTitle: 'Chapter 2 – Page 17',
      imageAsset: 'assets/ch2_p17_risky_drills.png',
      aspectRatio: 16 / 14,
      headline: 'High-Risk Drills',
      body: '',
      choices: const [
        GameChoice(
          text: 'Go full speed and deliver big hits.',
          nextId: 'ch2_p18_guidance',
          ph: -10,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 10,
        ),
        GameChoice(
          text: 'Use perfect technique to minimize head contact.',
          nextId: 'ch2_p18_guidance',
          ph: -3,
          mh: 2,
          tc: -2,
          ss: 0,
          cr: -5,
        ),
      ],
    ),

    // Page 18 – Guidance Counselor
    'ch2_p18_guidance': GamePage(
      id: 'ch2_p18_guidance',
      appBarTitle: 'Chapter 2 – Page 18',
      imageAsset: 'assets/ch2_p18_guidance.png',
      aspectRatio: 16 / 14,
      headline: 'Guidance Counselor Check-In',
      body: '',
      choices: const [
        GameChoice(
          text: 'Open up about headaches and focus issues.',
          nextId: 'ch2_p19_lunch_tension',
          ph: 5,
          mh: 15,
          tc: -5,
          ss: -2,
          cr: -5,
        ),
        GameChoice(
          text: 'Downplay everything as football stress.',
          nextId: 'ch2_p19_lunch_tension',
          ph: 0,
          mh: -5,
          tc: 2,
          ss: 2,
          cr: 5,
        ),
      ],
    ),

    // Page 19 – Lunch Tension
    'ch2_p19_lunch_tension': GamePage(
      id: 'ch2_p19_lunch_tension',
      appBarTitle: 'Chapter 2 – Page 19',
      imageAsset: 'assets/ch2_p19_lunch_tension.png',
      aspectRatio: 16 / 14,
      headline: 'Lunch Table Tension',
      body: '',
      choices: const [
        GameChoice(
          text: 'Defend football and side with Drew.',
          nextId: 'ch2_p20_sleepless',
          ph: 0,
          mh: -5,
          tc: 5,
          ss: 5,
          cr: 3,
        ),
        GameChoice(
          text: 'Acknowledge your concerns with Jay.',
          nextId: 'ch2_p20_sleepless',
          ph: 0,
          mh: 5,
          tc: -5,
          ss: -2,
          cr: -2,
        ),
      ],
    ),

    // Page 20 – Sleepless Night
    'ch2_p20_sleepless': GamePage(
      id: 'ch2_p20_sleepless',
      appBarTitle: 'Chapter 2 – Page 20',
      imageAsset: 'assets/ch2_p20_sleepless.png',
      aspectRatio: 16 / 14,
      headline: 'Sleepless Night',
      body: '',
      choices: const [
        GameChoice(
          text: 'Scroll highlight clips to distract yourself.',
          nextId: 'ch2_p21_game2',
          ph: -5,
          mh: -5,
          tc: 0,
          ss: 2,
          cr: 2,
        ),
        GameChoice(
          text: 'Put the phone away and breathe.',
          nextId: 'ch2_p21_game2',
          ph: 5,
          mh: 10,
          tc: 0,
          ss: -1,
          cr: 0,
        ),
      ],
    ),

    // Page 21 – Game 2 Decision
    'ch2_p21_game2': GamePage(
      id: 'ch2_p21_game2',
      appBarTitle: 'Chapter 2 – Page 21',
      imageAsset: 'assets/ch2_p21_game2.png',
      aspectRatio: 16 / 14,
      headline: 'Game Two Decision',
      body: '',
      choices: const [
        GameChoice(
          text: 'Drop your head and fight for yards.',
          nextId: 'ch2_p22_bus',
          ph: -15,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 15,
        ),
        GameChoice(
          text: 'Step out of bounds to avoid the hit.',
          nextId: 'ch2_p22_bus',
          ph: 0,
          mh: 5,
          tc: -10,
          ss: -5,
          cr: -5,
        ),
      ],
    ),

    // Page 22 – Bus Ride
    'ch2_p22_bus': GamePage(
      id: 'ch2_p22_bus',
      appBarTitle: 'Chapter 2 – Page 22',
      imageAsset: 'assets/ch2_p22_bus.png',
      aspectRatio: 16 / 14,
      headline: 'Bus Ride Home',
      body: '',
      choices: const [
        GameChoice(
          text: 'Laugh and go along with “whatever wins.”',
          nextId: 'ch2_p23_confrontation',
          ph: 0,
          mh: -5,
          tc: 5,
          ss: 5,
          cr: 3,
        ),
        GameChoice(
          text: 'Push back that winning is not worth your brain.',
          nextId: 'ch2_p23_confrontation',
          ph: 0,
          mh: 5,
          tc: -5,
          ss: -3,
          cr: -2,
        ),
      ],
    ),

    // Page 23 – Confrontation
    'ch2_p23_confrontation': GamePage(
      id: 'ch2_p23_confrontation',
      appBarTitle: 'Chapter 2 – Page 23',
      imageAsset: 'assets/ch2_p23_confrontation.png',
      aspectRatio: 16 / 14,
      headline: 'Someone Who Cares',
      body: '',
      choices: const [
        GameChoice(
          text: 'Admit everything—headaches and fear.',
          nextId: 'ch2_p24_trainer',
          ph: 5,
          mh: 15,
          tc: -5,
          ss: 5,
          cr: -5,
        ),
        GameChoice(
          text: 'Get defensive and deny there is a problem.',
          nextId: 'ch2_p24_trainer',
          ph: 0,
          mh: -10,
          tc: 0,
          ss: -5,
          cr: 5,
        ),
      ],
    ),

    // Page 24 – Trainer Follow-Up
    'ch2_p24_trainer': GamePage(
      id: 'ch2_p24_trainer',
      appBarTitle: 'Chapter 2 – Page 24',
      imageAsset: 'assets/ch2_p24_trainer.png',
      aspectRatio: 16 / 14,
      headline: 'Trainer Follow-Up',
      body: '',
      choices: const [
        GameChoice(
          text: 'Tell her the full list of symptoms.',
          nextId: 'ch2_p25_scout_rumor',
          ph: 15,
          mh: 10,
          tc: -10,
          ss: -5,
          cr: -10,
        ),
        GameChoice(
          text: 'Say it is just minor stuff.',
          nextId: 'ch2_p25_scout_rumor',
          ph: -5,
          mh: -5,
          tc: 10,
          ss: 5,
          cr: 10,
        ),
      ],
    ),

    // Page 25 – Scout Rumor (End of Chapter 2)
    'ch2_p25_scout_rumor': GamePage(
      id: 'ch2_p25_scout_rumor',
      appBarTitle: 'Chapter 2 – Page 25',
      imageAsset: 'assets/ch2_p25_scout.png',
      aspectRatio: 16 / 14,
      headline: 'College Scout Rumor',
      body: '',
      choices: const [
        GameChoice(
          text: 'Decide you will do whatever it takes to impress.',
          nextId: 'ch3_p27_pre_playoff',
          ph: -5,
          mh: -5,
          tc: 10,
          ss: 10,
          cr: 10,
        ),
        GameChoice(
          text: 'Decide you will play smart for your future.',
          nextId: 'ch3_p27_pre_playoff',
          ph: 5,
          mh: 10,
          tc: -5,
          ss: -5,
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
