import 'dart:convert';
import 'package:first_flutter_app/generated/json/base/json_field.dart';
import 'package:first_flutter_app/generated/json/news_bean_entity.g.dart';

@JsonSerializable()
class NewsBeanEntity {

	 String path;
	 String image;
	 String title;
	 String passtime;
  
  NewsBeanEntity();

  factory NewsBeanEntity.fromJson(Map<String, dynamic> json) => $NewsBeanEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewsBeanEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}