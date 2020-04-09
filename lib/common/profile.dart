part 'profile.g.dart';

class Profile {
    Profile();

    String locale;

    factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
    Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
