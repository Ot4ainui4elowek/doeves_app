import 'package:doeves_app/core/data/model/list_response_model.dart';
import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes_list/get_notes_remote_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notes_list_response_model.g.dart';

@JsonSerializable()
class NotesListResponseModel
    implements GetNotesRemoteResponse, ListResponseModel {
  const NotesListResponseModel(this.list);
  @JsonKey(name: 'list')
  @override
  final List<NoteResponseModel> list;

  factory NotesListResponseModel.fromJson(JsonType json) =>
      _$NotesListResponseModelFromJson(json);

  JsonType toJson() => _$NotesListResponseModelToJson(this);

  static bool patternMatch(JsonType json) {
    return json.containsKey('list');
  }
}
