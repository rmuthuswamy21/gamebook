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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PlayerStatType.values
          .map(
            (type) => _StatCard(
              type: type,
              stats: stats,
            ),
          )
          .toList(),
    );
  }
}

class _StatCard extends StatelessWidget {
  final PlayerStatType type;
  final PlayerStats stats;

  static const Map<PlayerStatType, Color> _colors = {
    PlayerStatType.physicalHealth: Colors.redAccent,
    PlayerStatType.mentalHealth: Colors.indigo,
    PlayerStatType.teamChemistry: Colors.green,
    PlayerStatType.socialStatus: Colors.orange,
  };

  const _StatCard({
    required this.type,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final value = stats.valueOf(type);
    final color = _colors[type] ?? Colors.blueGrey;
    final theme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${type.shortLabel} • ${type.label}',
                  style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${value.toStringAsFixed(0)}/100',
                  style: theme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: LinearProgressIndicator(
                value: value / 100,
                minHeight: 10,
                color: color,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              type.description,
              style: theme.bodySmall?.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
