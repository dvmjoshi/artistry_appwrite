class Artisty {
  String? id;
  String? collection;
  String? name;
  String? artImage;
  String? description;

  Artisty({
    this.id,
    this.collection,
    this.name,
    this.artImage,
    this.description,
  });

  Artisty.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    collection = json['$collection'];

    name = json['name'];
    description = json['description'];
    artImage = json['artimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['name'] = name;
    data['description'] = description;
    data['artimage'] = artImage;

    return data;
  }
}
