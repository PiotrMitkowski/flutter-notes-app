import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/data/models/note.dart';
import 'package:flutter_notes_app/data/repository.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  NotesListBloc(this._notesRepository) : super(const NotesListState()) {
    on<NotesListRequested>(_onNotesListRequested);
  }

  final NotesRepository _notesRepository;

  Future<void> _onNotesListRequested(
    NotesListRequested event,
    Emitter<NotesListState> emit,
  ) async {
    await emit.forEach(
      _notesRepository.getNotes(),
      onData: (notes) {
        return state.copyWith(notes: notes);
      },
    );
  }
}

abstract class NotesListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotesListRequested extends NotesListEvent {}

class NotesListState extends Equatable {
  const NotesListState({this.notes = const []});

  final List<Note> notes;

  NotesListState copyWith({List<Note>? notes}) {
    return NotesListState(notes: notes ?? this.notes);
  }

  @override
  List<Object?> get props => [notes];
}
