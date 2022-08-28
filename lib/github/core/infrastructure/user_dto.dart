import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githubmate/github/core/domain/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();
  const factory UserDTO({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "login") required String name,
    @JsonKey(name: "avatar_url") required String avatar,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User user) =>
      UserDTO(id: user.id, name: user.name, avatar: user.avatar);

  User toDomain() => User(id: id, name: name, avatar: avatar);
}
