import 'package:doeves_app/core/domain/use_case_result/use_case_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_note_bloc.freezed.dart';
part 'create_note_event.dart';
part 'create_note_state.dart';

class CreateNoteBloc extends Bloc<CreateNoteEvent, CreateNoteState> {
  CreateNoteBloc() : super(const CreateNoteState.initial()) {
    on<FetchEvent>(
      (event, emit) {
        switch (event.result) {
          case GoodUseCaseResult():
            emit(const CreateNoteState.initial());
          case BadUseCaseResult(:final errorList):
            emit(CreateNoteState.error(message: errorList[0].code));
          case DataBadUseCaseResult(:final errorData):
            emit(CreateNoteState.error(message: errorData.message));
        }
      },
    );
    on<LoadingEvent>(
      (event, emit) => emit(const CreateNoteState.loading()),
    );
  }
}
