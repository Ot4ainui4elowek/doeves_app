import 'package:doeves_app/feauture/main_page/data/model/remove_list_of_notes/empty_good_response.dart';

abstract interface class RemoveNoteRemoteResponse {
  factory RemoveNoteRemoteResponse.fromJson(Map<String, dynamic> json) {
    if (EmptyGoodResponse.patternMatch(json)) {
      return EmptyGoodResponse.fromJson(json);
    } else {
      return throw Exception('Unknown remove notes response');
    }
  }
}
