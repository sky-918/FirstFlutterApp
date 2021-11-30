import 'dart:convert';
import 'package:first_flutter_app/generated/json/base/json_field.dart';
import 'package:first_flutter_app/generated/json/infobean_entity.g.dart';

@JsonSerializable()
class InfobeanEntity {

	 List<InfobeanLinks> links;
  
  InfobeanEntity();

  factory InfobeanEntity.fromJson(Map<String, dynamic> json) => $InfobeanEntityFromJson(json);

  Map<String, dynamic> toJson() => $InfobeanEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class InfobeanLinks {

	 String title;
	@JSONField(name: "source")
	 String xSource;
	 String img;
  
  InfobeanLinks();

  factory InfobeanLinks.fromJson(Map<String, dynamic> json) => $InfobeanLinksFromJson(json);

  Map<String, dynamic> toJson() => $InfobeanLinksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}