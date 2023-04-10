// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJson(json.decode(str));

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  final String answer;
  final bool forced;
  final String image;

  YesNoModel copyWith({
    String? answer,
    bool? forced,
    String? image,
  }) =>
      YesNoModel(
        answer: answer ?? this.answer,
        forced: forced ?? this.forced,
        image: image ?? this.image,
      );

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'Si' : 'No',
        fromWho: FromWho.hers,
      );
}
