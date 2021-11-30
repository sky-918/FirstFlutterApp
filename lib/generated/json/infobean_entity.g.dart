import 'package:first_flutter_app/generated/json/base/json_convert_content.dart';
import 'package:first_flutter_app/infobean_entity.dart';

InfobeanEntity $InfobeanEntityFromJson(Map<String, dynamic> json) {
	final InfobeanEntity infobeanEntity = InfobeanEntity();
	final List<InfobeanLinks>   links = jsonConvert.convertListNotNull<InfobeanLinks>(json['links']);
	if (links != null) {
		infobeanEntity.links = links;
	}
	return infobeanEntity;
}

Map<String, dynamic> $InfobeanEntityToJson(InfobeanEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['links'] =  entity.links.map((v) => v.toJson()).toList();
	return data;
}

InfobeanLinks $InfobeanLinksFromJson(Map<String, dynamic> json) {
	final InfobeanLinks infobeanLinks = InfobeanLinks();
	final String   title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		infobeanLinks.title = title;
	}
	final String   xSource = jsonConvert.convert<String>(json['source']);
	if (xSource != null) {
		infobeanLinks.xSource = xSource;
	}
	final String   img = jsonConvert.convert<String>(json['img']);
	if (img != null) {
		infobeanLinks.img = img;
	}
	return infobeanLinks;
}

Map<String, dynamic> $InfobeanLinksToJson(InfobeanLinks entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['title'] = entity.title;
	data['source'] = entity.xSource;
	data['img'] = entity.img;
	return data;
}