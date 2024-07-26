import 'dart:convert';

class FixedDeparturesModel {
  final bool status;
  final dynamic message;
  final FixedDeparturesData data;

  FixedDeparturesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FixedDeparturesModel.fromJson(Map<String, dynamic> json) {
    return FixedDeparturesModel(
      status: json['status'],
      message: json['message'],
      data: FixedDeparturesData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class FixedDeparturesData {
  final List<FixedDeparture> fixedDepartures;

  FixedDeparturesData({
    required this.fixedDepartures,
  });

  factory FixedDeparturesData.fromJson(Map<String, dynamic> json) {
    return FixedDeparturesData(
      fixedDepartures: (json['fixed_departures'] as List<dynamic>)
          .map((item) => FixedDeparture.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fixed_departures': fixedDepartures.map((item) => item.toJson()).toList(),
    };
  }
}
class FixedDeparture {
  final int id;
  final dynamic title;
  final dynamic from;
  final dynamic to;
  final dynamic travelTo;
  final dynamic price;
  final dynamic rating; 
  final List<dynamic> description;
  final List<dynamic> tag;
  final int status;
  final dynamic tagStatus; 
  final dynamic createdAt;
  final dynamic updatedAt;

  FixedDeparture({
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

  factory FixedDeparture.fromJson(Map<String, dynamic> json) {
    return FixedDeparture(
      id: json['id'],
      title: json['title'],
      from: json['from'],
      to: json['to'],
      travelTo: json['travel_to'],
      price: json['price'],
      rating: json['rating'],
      description: List<dynamic>.from(jsonDecode(json['description'])),
      tag: List<dynamic>.from(jsonDecode(json['tag'])),
      status: json['status'],
      tagStatus: json['tag_status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'from': from,
      'to': to,
      'travel_to': travelTo,
      'price': price,
      'rating': rating,
      'description': jsonEncode(description),
      'tag': jsonEncode(tag),
      'status': status,
      'tag_status': tagStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
