import 'package:flutter/material.dart';
import '../../models/player_stats.dart';

class StatTracker extends StatelessWidget {
  final PlayerStats stats;

  const StatTracker({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final data = PlayerStatType.values
        .map(
          (type) => _StatDatum(
            type: type,
            value: stats.valueOf(type),
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          for (int i = 0; i < data.length; i++) ...[
            Expanded(child: _DonutStat(stat: data[i])),
            if (i != data.length - 1) const SizedBox(width: 2),
          ]
        ],
      ),
    );
  }
}

class _StatDatum {
  final PlayerStatType type;
  final double value;

  const _StatDatum({
    required this.type,
    required this.value,
  });
}

class _DonutStat extends StatelessWidget {
  final _StatDatum stat;

  const _DonutStat({required this.stat});

  Color _colorForValue(double value) {
    if (value <= 40) {
      return Colors.red.shade900;
    }
    final normalized = ((value - 40) / 60).clamp(0.0, 1.0);
    return Color.lerp(
          Colors.orangeAccent,
          Colors.lightGreenAccent.shade400,
          normalized,
        ) ??
        Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorForValue(stat.value);
    final theme = Theme.of(context).textTheme;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              stat.type.shortLabel,
              textAlign: TextAlign.center,
              style: theme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 26,
              width: 26,
              child: CircularProgressIndicator(
                value: stat.value / 100,
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                backgroundColor: Colors.grey.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
