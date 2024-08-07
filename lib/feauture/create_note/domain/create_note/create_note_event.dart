part of 'create_note_bloc.dart';

@freezed
class CreateNoteEvent with _$CreateNoteEvent {
  const factory CreateNoteEvent.fetch({
    required UseCaseResult result,
  }) = FetchEvent;
  const factory CreateNoteEvent.success() = SuccessEvent;
  const factory CreateNoteEvent.loading() = LoadingEvent;
}
