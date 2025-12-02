enum PlayerStatType {
  physicalHealth,
  mentalHealth,
  teamChemistry,
  socialStatus,
}

extension PlayerStatMeta on PlayerStatType {
  String get label {
    switch (this) {
      case PlayerStatType.physicalHealth:
        return 'Physical Health';
      case PlayerStatType.mentalHealth:
        return 'Mental Health';
      case PlayerStatType.teamChemistry:
        return 'Team Chemistry';
      case PlayerStatType.socialStatus:
        return 'Social Status';
    }
  }

  String get shortLabel {
    switch (this) {
      case PlayerStatType.physicalHealth:
        return 'PH';
      case PlayerStatType.mentalHealth:
        return 'MH';
      case PlayerStatType.teamChemistry:
        return 'TC';
      case PlayerStatType.socialStatus:
        return 'SS';
    }
  }

  String get description {
    switch (this) {
      case PlayerStatType.physicalHealth:
        return 'Injuries, stamina, concussion risk';
      case PlayerStatType.mentalHealth:
        return 'Stress, anxiety, confidence, burnout';
      case PlayerStatType.teamChemistry:
        return 'Coach trust, teammate respect';
      case PlayerStatType.socialStatus:
        return 'Friends, popularity, relationships';
    }
  }
}

class PlayerStats {
  final double physicalHealth;
  final double mentalHealth;
  final double teamChemistry;
  final double socialStatus;

  const PlayerStats({
    this.physicalHealth = 75,
    this.mentalHealth = 70,
    this.teamChemistry = 65,
    this.socialStatus = 60,
  });

  PlayerStats copyWith({
    double? physicalHealth,
    double? mentalHealth,
    double? teamChemistry,
    double? socialStatus,
  }) {
    return PlayerStats(
      physicalHealth: physicalHealth ?? this.physicalHealth,
      mentalHealth: mentalHealth ?? this.mentalHealth,
      teamChemistry: teamChemistry ?? this.teamChemistry,
      socialStatus: socialStatus ?? this.socialStatus,
    );
  }

  double valueOf(PlayerStatType type) {
    switch (type) {
      case PlayerStatType.physicalHealth:
        return physicalHealth;
      case PlayerStatType.mentalHealth:
        return mentalHealth;
      case PlayerStatType.teamChemistry:
        return teamChemistry;
      case PlayerStatType.socialStatus:
        return socialStatus;
    }
  }

  PlayerStats setValue(PlayerStatType type, double value) {
    final newValue = _clamp(value);
    switch (type) {
      case PlayerStatType.physicalHealth:
        return copyWith(physicalHealth: newValue);
      case PlayerStatType.mentalHealth:
        return copyWith(mentalHealth: newValue);
      case PlayerStatType.teamChemistry:
        return copyWith(teamChemistry: newValue);
      case PlayerStatType.socialStatus:
        return copyWith(socialStatus: newValue);
    }
  }

  PlayerStats adjust(PlayerStatType type, double delta) {
    final current = valueOf(type);
    return setValue(type, current + delta);
  }

  static double _clamp(double value) {
    final num clamped = value.clamp(0, 100);
    return clamped.toDouble();
  }
}
