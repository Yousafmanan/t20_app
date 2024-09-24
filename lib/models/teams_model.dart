class TeamsModel {
  String? fullName;
  String? shortName;
  String? flag;

  TeamsModel(
  {
    this.fullName,
    this.shortName,
    this.flag,
  });

  static TeamsModel fromJSON(Map<String, dynamic>map){
   return TeamsModel(
   fullName: map['fullName'],
   shortName: map['shortName'],
   flag: map['flag']
   );
  }
}