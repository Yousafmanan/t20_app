class HistoryModel{
  String? winner;
  String? runnerUp;
  String? host;
  String? winnerFlag;
  String? runnerUpFlag;
  String? year;

  HistoryModel(
  {
    this.winner,
    this.runnerUp,
    this.host,
    this.winnerFlag,
    this.runnerUpFlag,
    this.year
});

  static HistoryModel fromJSON(Map<String, dynamic>map){
    return HistoryModel(
      winner: map['winner'],
      runnerUp: map['runnerUp'],
      host: map['host'],
      winnerFlag: map['winnerFlag'],
      runnerUpFlag: map['runnerUpFlag'],
      year: map['year'],
    );
  }
}