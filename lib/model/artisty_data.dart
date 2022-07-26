import 'package:appwrite/models.dart';

class Artisty {
  String? id;
  String? collection;
  String name;
  String artImage;
  String description;

  Artisty({
    required this.id,
    required this.collection,
    required this.name,
    required this.artImage,
    required this.description,
  });

  factory Artisty.fromJson(Document json) => Artisty(
        id: json.$id,
        collection: json.$collection,
        name: json.data['name'],
        description: json.data['description'],
        artImage: json.data['artimage'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "artimage": artImage,
      };
}
