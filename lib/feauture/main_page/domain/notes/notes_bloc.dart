import 'package:doeves_app/core/domain/app_error/app_error.dart';
import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:doeves_app/feauture/main_page/data/model/note_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_bloc.freezed.dart';
part 'notes_event.dart';
part 'notes_state.dart';

typedef NOTE = NoteResponseModel;

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
          case GoodUseCaseResult<List<NOTE>>(:final data):
            {
              if (data.isEmpty) {
                emit(const NotesState.emptyResult());
              } else {
                emit(const NotesState.success());
              }
            }
          case DataBadUseCaseResult<List<NOTE>>(:final errorData):
            {
              emit(NotesState.error(SpecificError(errorData.message)));
            }
          case BadUseCaseResult<List<NOTE>>(:final errorList):
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
