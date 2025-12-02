import 'package:flutter/material.dart';
import '../game_provider.dart';
import '../models/data_layer.dart';
import 'widgets/save_load.dart';
import 'widgets/stat_tracker.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<double> _sizes = [250, 400, 800];
  int _iteration = 0;

  void _cycleChestAnimation() {
    setState(() {
      _iteration = (_iteration + 1) % _sizes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = GameProvider.of(context);
    return ValueListenableBuilder<GameState>(
      valueListenable: notifier,
      builder: (context, game, _) {
        final page = game.currentPage;
        final stats = game.stats;
        final isChestPage = page.id == 'pathB_B2';

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text(page.appBarTitle),
            toolbarHeight: 32.0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isChestPage)
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Center(
                        child: AnimatedContainer(
                          width: _sizes[_iteration],
                          height: _sizes[_iteration],
                          duration: const Duration(milliseconds: 250),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(page.imageAsset),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.zero,
                      child: AspectRatio(
                        aspectRatio: page.aspectRatio,
                        child: Image.asset(
                          page.imageAsset,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  const Divider(height: 16),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                    child: Text(
                      'Season Progress',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  StatTracker(stats: stats),
                  const Divider(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      page.headline,
                      style: const TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  const Divider(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      page.body,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 4),
                  for (final c in page.choices)
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            final updatedStats =
                                notifier.value.stats.adjustMultiple(
                              phDelta: c.ph.toDouble(),
                              mhDelta: c.mh.toDouble(),
                              tcDelta: c.tc.toDouble(),
                              ssDelta: c.ss.toDouble(),
                            );
                            notifier.value = notifier.value.copyWith(
                              currentPageId: c.nextId,
                              stats: updatedStats,
                            );
                          },
                          icon: const Icon(Icons.run_circle),
                        ),
                        Flexible(child: Text(c.text)),
                      ],
                    ),
                  const SizedBox(height: 24),
                  const Divider(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (isChestPage) ...[
                          ElevatedButton.icon(
                            onPressed: _cycleChestAnimation,
                            icon: const Icon(Icons.play_circle_fill),
                            label: const Text('Animate'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                        if (page.id != 'start' &&
                            page.id != 'first_choice' &&
                            page.id != 'pathB_B2') ...[
                          ElevatedButton.icon(
                            onPressed: () {
                              notifier.value = notifier.value.copyWith(
                                currentPageId: 'first_choice',
                              );
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Restart'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                        const ChoiceLoad(),
                        const SizedBox(width: 12),
                        ChoiceSave(sceneID: page.id),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
