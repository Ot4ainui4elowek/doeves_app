part of 'create_note_bloc.dart';

@freezed
class CreateNoteState with _$CreateNoteState {
  const factory CreateNoteState.initial() = _Initial;
  const factory CreateNoteState.loading() = _Loading;
  const factory CreateNoteState.error({
    required String message,
  }) = _Error;
}
