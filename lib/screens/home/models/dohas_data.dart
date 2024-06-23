class DohaModel {
  final String doha, hindi, english, gujarati;

  DohaModel(
      {required this.doha,
      required this.english,
      required this.gujarati,
      required this.hindi});

  factory DohaModel.fromJson(Map json) {
    return DohaModel(
        doha: json['doha'],
        english: json['english'],
        gujarati: json['gujarati'],
        hindi: json['hindi']);
  }
}
