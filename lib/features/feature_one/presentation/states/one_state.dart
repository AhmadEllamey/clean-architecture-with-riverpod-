class OneState {
  String title;

  OneState({
    required this.title,
  });

  OneState copyWith({
    String? title,
  }) {
    return OneState(title: title ?? this.title);
  }
}
