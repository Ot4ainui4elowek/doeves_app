import 'package:doeves_app/core/data/remote_response.dart';
import 'package:doeves_app/feauture/main_page/data/model/notes_list/notes_list_response_model.dart';

abstract interface class GetNotesRemoteResponse {
  factory GetNotesRemoteResponse.fromJson(JsonType json) {
    if (NotesListResponseModel.patternMatch(json)) {
      return NotesListResponseModel.fromJson(json);
    } else {
      return throw Exception('Unknown get notes response');
    }
  }
}
