// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotesEvent value) fetchNotes,
    required TResult Function(LoadingNotesEvent value) loadingNotes,
    required TResult Function(ClearState value) clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotesEvent value)? fetchNotes,
    TResult? Function(LoadingNotesEvent value)? loadingNotes,
    TResult? Function(ClearState value)? clearState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotesEvent value)? fetchNotes,
    TResult Function(LoadingNotesEvent value)? loadingNotes,
    TResult Function(ClearState value)? clearState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesEventCopyWith<$Res> {
  factory $NotesEventCopyWith(
          NotesEvent value, $Res Function(NotesEvent) then) =
      _$NotesEventCopyWithImpl<$Res, NotesEvent>;
}

/// @nodoc
class _$NotesEventCopyWithImpl<$Res, $Val extends NotesEvent>
    implements $NotesEventCopyWith<$Res> {
  _$NotesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchNotesEventImplCopyWith<$Res> {
  factory _$$FetchNotesEventImplCopyWith(_$FetchNotesEventImpl value,
          $Res Function(_$FetchNotesEventImpl) then) =
      __$$FetchNotesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UseCaseResult<List<NoteWithContentImpl>> result});
}

/// @nodoc
class __$$FetchNotesEventImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$FetchNotesEventImpl>
    implements _$$FetchNotesEventImplCopyWith<$Res> {
  __$$FetchNotesEventImplCopyWithImpl(
      _$FetchNotesEventImpl _value, $Res Function(_$FetchNotesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$FetchNotesEventImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UseCaseResult<List<NoteWithContentImpl>>,
    ));
  }
}

/// @nodoc

class _$FetchNotesEventImpl implements FetchNotesEvent {
  _$FetchNotesEventImpl({required this.result});

  @override
  final UseCaseResult<List<NoteWithContentImpl>> result;

  @override
  String toString() {
    return 'NotesEvent.fetchNotes(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchNotesEventImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchNotesEventImplCopyWith<_$FetchNotesEventImpl> get copyWith =>
      __$$FetchNotesEventImplCopyWithImpl<_$FetchNotesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() clearState,
  }) {
    return fetchNotes(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? clearState,
  }) {
    return fetchNotes?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (fetchNotes != null) {
      return fetchNotes(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotesEvent value) fetchNotes,
    required TResult Function(LoadingNotesEvent value) loadingNotes,
    required TResult Function(ClearState value) clearState,
  }) {
    return fetchNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotesEvent value)? fetchNotes,
    TResult? Function(LoadingNotesEvent value)? loadingNotes,
    TResult? Function(ClearState value)? clearState,
  }) {
    return fetchNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotesEvent value)? fetchNotes,
    TResult Function(LoadingNotesEvent value)? loadingNotes,
    TResult Function(ClearState value)? clearState,
    required TResult orElse(),
  }) {
    if (fetchNotes != null) {
      return fetchNotes(this);
    }
    return orElse();
  }
}

abstract class FetchNotesEvent implements NotesEvent {
  factory FetchNotesEvent(
          {required final UseCaseResult<List<NoteWithContentImpl>> result}) =
      _$FetchNotesEventImpl;

  UseCaseResult<List<NoteWithContentImpl>> get result;
  @JsonKey(ignore: true)
  _$$FetchNotesEventImplCopyWith<_$FetchNotesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingNotesEventImplCopyWith<$Res> {
  factory _$$LoadingNotesEventImplCopyWith(_$LoadingNotesEventImpl value,
          $Res Function(_$LoadingNotesEventImpl) then) =
      __$$LoadingNotesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNotesEventImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$LoadingNotesEventImpl>
    implements _$$LoadingNotesEventImplCopyWith<$Res> {
  __$$LoadingNotesEventImplCopyWithImpl(_$LoadingNotesEventImpl _value,
      $Res Function(_$LoadingNotesEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingNotesEventImpl implements LoadingNotesEvent {
  _$LoadingNotesEventImpl();

  @override
  String toString() {
    return 'NotesEvent.loadingNotes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingNotesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() clearState,
  }) {
    return loadingNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? clearState,
  }) {
    return loadingNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (loadingNotes != null) {
      return loadingNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotesEvent value) fetchNotes,
    required TResult Function(LoadingNotesEvent value) loadingNotes,
    required TResult Function(ClearState value) clearState,
  }) {
    return loadingNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotesEvent value)? fetchNotes,
    TResult? Function(LoadingNotesEvent value)? loadingNotes,
    TResult? Function(ClearState value)? clearState,
  }) {
    return loadingNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotesEvent value)? fetchNotes,
    TResult Function(LoadingNotesEvent value)? loadingNotes,
    TResult Function(ClearState value)? clearState,
    required TResult orElse(),
  }) {
    if (loadingNotes != null) {
      return loadingNotes(this);
    }
    return orElse();
  }
}

abstract class LoadingNotesEvent implements NotesEvent {
  factory LoadingNotesEvent() = _$LoadingNotesEventImpl;
}

/// @nodoc
abstract class _$$ClearStateImplCopyWith<$Res> {
  factory _$$ClearStateImplCopyWith(
          _$ClearStateImpl value, $Res Function(_$ClearStateImpl) then) =
      __$$ClearStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearStateImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$ClearStateImpl>
    implements _$$ClearStateImplCopyWith<$Res> {
  __$$ClearStateImplCopyWithImpl(
      _$ClearStateImpl _value, $Res Function(_$ClearStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearStateImpl implements ClearState {
  _$ClearStateImpl();

  @override
  String toString() {
    return 'NotesEvent.clearState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)
        fetchNotes,
    required TResult Function() loadingNotes,
    required TResult Function() clearState,
  }) {
    return clearState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult? Function()? loadingNotes,
    TResult? Function()? clearState,
  }) {
    return clearState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UseCaseResult<List<NoteWithContentImpl>> result)?
        fetchNotes,
    TResult Function()? loadingNotes,
    TResult Function()? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchNotesEvent value) fetchNotes,
    required TResult Function(LoadingNotesEvent value) loadingNotes,
    required TResult Function(ClearState value) clearState,
  }) {
    return clearState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchNotesEvent value)? fetchNotes,
    TResult? Function(LoadingNotesEvent value)? loadingNotes,
    TResult? Function(ClearState value)? clearState,
  }) {
    return clearState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchNotesEvent value)? fetchNotes,
    TResult Function(LoadingNotesEvent value)? loadingNotes,
    TResult Function(ClearState value)? clearState,
    required TResult orElse(),
  }) {
    if (clearState != null) {
      return clearState(this);
    }
    return orElse();
  }
}

abstract class ClearState implements NotesEvent {
  factory ClearState() = _$ClearStateImpl;
}

/// @nodoc
mixin _$NotesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingNotes,
    required TResult Function() success,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingNotes,
    TResult? Function()? success,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingNotes,
    TResult Function()? success,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingNotes value) loadingNotes,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingNotes value)? loadingNotes,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingNotes value)? loadingNotes,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res, NotesState>;
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res, $Val extends NotesState>
    implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingNotes,
    required TResult Function() success,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResult,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingNotes,
    TResult? Function()? success,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResult,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingNotes,
    TResult Function()? success,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingNotes value) loadingNotes,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResult,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingNotes value)? loadingNotes,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResult,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingNotes value)? loadingNotes,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResult,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotesState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingNotesImplCopyWith<$Res> {
  factory _$$LoadingNotesImplCopyWith(
          _$LoadingNotesImpl value, $Res Function(_$LoadingNotesImpl) then) =
      __$$LoadingNotesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNotesImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$LoadingNotesImpl>
    implements _$$LoadingNotesImplCopyWith<$Res> {
  __$$LoadingNotesImplCopyWithImpl(
      _$LoadingNotesImpl _value, $Res Function(_$LoadingNotesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingNotesImpl implements _LoadingNotes {
  const _$LoadingNotesImpl();

  @override
  String toString() {
    return 'NotesState.loadingNotes()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingNotesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingNotes,
    required TResult Function() success,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResult,
  }) {
    return loadingNotes();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingNotes,
    TResult? Function()? success,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResult,
  }) {
    return loadingNotes?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingNotes,
    TResult Function()? success,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResult,
    required TResult orElse(),
  }) {
    if (loadingNotes != null) {
      return loadingNotes();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingNotes value) loadingNotes,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResult,
  }) {
    return loadingNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingNotes value)? loadingNotes,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResult,
  }) {
    return loadingNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingNotes value)? loadingNotes,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResult,
    required TResult orElse(),
  }) {
    if (loadingNotes != null) {
      return loadingNotes(this);
    }
    return orElse();
  }
}

abstract class _LoadingNotes implements NotesState {
  const factory _LoadingNotes() = _$LoadingNotesImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'NotesState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingNotes,
    required TResult Function() success,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResult,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingNotes,
    TResult? Function()? success,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResult,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingNotes,
    TResult Function()? success,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResult,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingNotes value) loadingNotes,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResult,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingNotes value)? loadingNotes,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResult,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingNotes value)? loadingNotes,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResult,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements NotesState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'NotesState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingNotes,
    required TResult Function() success,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResult,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingNotes,
    TResult? Function()? success,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResult,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingNotes,
    TResult Function()? success,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResult,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingNotes value) loadingNotes,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResult,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingNotes value)? loadingNotes,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResult,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingNotes value)? loadingNotes,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResult,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NotesState {
  const factory _Error(final AppError error) = _$ErrorImpl;

  AppError get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyResultImplCopyWith<$Res> {
  factory _$$EmptyResultImplCopyWith(
          _$EmptyResultImpl value, $Res Function(_$EmptyResultImpl) then) =
      __$$EmptyResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyResultImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$EmptyResultImpl>
    implements _$$EmptyResultImplCopyWith<$Res> {
  __$$EmptyResultImplCopyWithImpl(
      _$EmptyResultImpl _value, $Res Function(_$EmptyResultImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyResultImpl implements _EmptyResult {
  const _$EmptyResultImpl();

  @override
  String toString() {
    return 'NotesState.emptyResult()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingNotes,
    required TResult Function() success,
    required TResult Function(AppError error) error,
    required TResult Function() emptyResult,
  }) {
    return emptyResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingNotes,
    TResult? Function()? success,
    TResult? Function(AppError error)? error,
    TResult? Function()? emptyResult,
  }) {
    return emptyResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingNotes,
    TResult Function()? success,
    TResult Function(AppError error)? error,
    TResult Function()? emptyResult,
    required TResult orElse(),
  }) {
    if (emptyResult != null) {
      return emptyResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingNotes value) loadingNotes,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_EmptyResult value) emptyResult,
  }) {
    return emptyResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingNotes value)? loadingNotes,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_EmptyResult value)? emptyResult,
  }) {
    return emptyResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingNotes value)? loadingNotes,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_EmptyResult value)? emptyResult,
    required TResult orElse(),
  }) {
    if (emptyResult != null) {
      return emptyResult(this);
    }
    return orElse();
  }
}

abstract class _EmptyResult implements NotesState {
  const factory _EmptyResult() = _$EmptyResultImpl;
}
