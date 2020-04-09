
part of 'profile.dart';


Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..locale = json['locale'] as String;
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'locale': instance.locale
    };
