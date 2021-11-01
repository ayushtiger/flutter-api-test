import 'package:api_test/model/user.dart';
import 'package:api_test/model/support.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_user.g.dart';

@JsonSerializable()
class ListUserResponse {
  ListUserResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.users,
    required this.support,
  });

  @JsonKey(name: "page")
  int page;

  @JsonKey(name: "per_page")
  int perPage;

  @JsonKey(name: "total")
  int total;

  @JsonKey(name: "total_pages")
  int totalPages;

  @JsonKey(name: "data")
  List<User> users;

  @JsonKey(name: "support")
  Support support;

  factory ListUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}
