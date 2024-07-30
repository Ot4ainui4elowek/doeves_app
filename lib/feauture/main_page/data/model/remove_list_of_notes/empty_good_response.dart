import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/remove_notes_remote_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'empty_good_response.g.dart';

@JsonSerializable()
class EmptyGoodResponse implements RemoveNotesRemoteResponse {
  const EmptyGoodResponse(this.good);

  factory EmptyGoodResponse.fromJson(JsonType json) =>
      _$EmptyGoodResponseFromJson(json);

  JsonType toJson() => _$EmptyGoodResponseToJson(this);

  @JsonKey(name: 'good')
  final bool good;

  static bool patternMatch(Map<String, dynamic> json) {
    return json.containsKey('good');
  }
}
