class BAState {
  final BAType type;

  BAState copyWith({BAType? type}) {
    return BAState(type: type ?? this.type);
  }

  BAState({required this.type});
}

enum BAType { sportType, result, date }
