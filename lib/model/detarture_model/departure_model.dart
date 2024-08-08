// FixedDeparturesModel.dart
class FixedDeparturesModel {
  final bool status;
  final String message;
  final Data data;

  FixedDeparturesModel({required this.status, required this.message, required this.data});

  factory FixedDeparturesModel.fromJson(Map<String, dynamic> json) {
    return FixedDeparturesModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<Departure> fixedDepartures;

  Data({required this.fixedDepartures});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['fixed_departures'] as List;
    List<Departure> departures = list.map((i) => Departure.fromJson(i)).toList();
    return Data(
      fixedDepartures: departures,
    );
  }
}

class Departure {
  final int id;
  final String title;
  final String from;
  final String to;
  final String travelTo;
  final String price;
  final int? rating;
  final List<String> description;
  final List<Tag> tag;
  final int status;
  final int? tagStatus;
  final String createdAt;
  final String updatedAt;

  Departure({
    required this.id,
    required this.title,
    required this.from,
    required this.to,
    required this.travelTo,
    required this.price,
    this.rating,
    required this.description,
    required this.tag,
    required this.status,
    this.tagStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Departure.fromJson(Map<String, dynamic> json) {
    var tagsList = json['tag'] as List;
    List<Tag> tags = tagsList.map((i) => Tag.fromJson(i)).toList();
    var descriptionList = json['description'].cast<String>();
    return Departure(
      id: json['id'],
      title: json['title'],
      from: json['from'],
      to: json['to'],
      travelTo: json['travel_to'],
      price: json['price'],
      rating: json['rating'],
      description: descriptionList,
      tag: tags,
      status: json['status'],
      tagStatus: json['tag_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Tag {
  final String name;
  final String status;

  Tag({required this.name, required this.status});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      name: json['name'],
      status: json['status'],
    );
  }
}
