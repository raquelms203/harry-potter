class Character {
  final String name;
  final String house;
  final bool isStudent;
  final String actor;
  final String image;

  Character({this.actor, this.house, this.image, this.isStudent, this.name});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(  
      actor: json["actor"],
      house: json["house"],
      image: json["image"],
      isStudent: json["hogwartsStudent"],
      name: json["name"]
    );
  }
}
