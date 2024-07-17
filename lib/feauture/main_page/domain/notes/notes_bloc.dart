import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/domain/entity/note_with_content/note_with_content_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_bloc.freezed.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState.initial()) {
    on<LoadingNotesEvent>(
      (event, emit) {
        emit(const NotesState.loadingNotes());
      },
    );
    on<FetchNotesEvent>(
      (event, emit) {
        switch (event.result) {
          case GoodUseCaseResult<List<NoteWithContentImpl>>(:final data):
            {
              if (data.isEmpty) {
                emit(const NotesState.emptyResult());
              } else {
                emit(const NotesState.success());
              }
            }
          case DataBadUseCaseResult<List<NoteWithContentImpl>>(
              :final errorData
            ):
            {
              emit(NotesState.error(SpecificError(errorData.content)));
            }
          case BadUseCaseResult<List<NoteWithContentImpl>>(:final errorList):
            {
              emit(NotesState.error(errorList[0]));
            }
          default:
            {
              emit(NotesState.error(SpecificError('Unknown error')));
            }
        }
      },
    );
    on<ClearState>(
      (event, emit) => emit(const NotesState.initial()),
    );
  }
}
