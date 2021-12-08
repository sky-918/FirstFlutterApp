import 'package:first_flutter_app/generated/json/base/json_convert_content.dart';
import 'package:first_flutter_app/bean/news_bean_entity.dart';

NewsBeanEntity $NewsBeanEntityFromJson(Map<String, dynamic> json) {
	final NewsBeanEntity newsBeanEntity = NewsBeanEntity();
	final String path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		newsBeanEntity.path = path;
	}
	final String image = jsonConvert.convert<String>(json['image']);
	if (image != null) {
		newsBeanEntity.image = image;
	}
	final String title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		newsBeanEntity.title = title;
	}
	final String passtime = jsonConvert.convert<String>(json['passtime']);
	if (passtime != null) {
		newsBeanEntity.passtime = passtime;
	}
	return newsBeanEntity;
}

Map<String, dynamic> $NewsBeanEntityToJson(NewsBeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['path'] = entity.path;
	data['image'] = entity.image;
	data['title'] = entity.title;
	data['passtime'] = entity.passtime;
	return data;
}