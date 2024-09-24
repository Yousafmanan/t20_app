class VenuesModel{
  String? country;
  String? city;
  String? stadium;
  String? image;

  VenuesModel(
      {
        this.country,
        this.city,
        this.stadium,
        this.image,
      });

  static VenuesModel fromJSON(Map<String, dynamic>map){
    return VenuesModel(
      country: map['country'],
      city: map['city'],
      stadium: map['stadium'],
      image: map['image'],
    );
  }
}