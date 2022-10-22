import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/data/models/note.dart';
import 'package:flutter_notes_app/data/repository.dart';

part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc(this._notesRepository) : super(const AddNoteState()) {
    on<AddNoteContentChanged>(_onContentChanged);
    on<AddNoteSubmitted>(_onNoteSubmitted);
  }

  final NotesRepository _notesRepository;

  void _onContentChanged(
    AddNoteContentChanged event,
    Emitter<AddNoteState> emit,
  ) {
    emit(state.copyWith(content: event.content));
  }

  Future<void> _onNoteSubmitted(
    AddNoteSubmitted event,
    Emitter<AddNoteState> emit,
  ) async {
    emit(state.copyWith(status: AddNoteStatus.loading));
    final note = Note()
      ..content = state.content
      ..creationDate = DateTime.now();

    try {
      await _notesRepository.saveNote(note);
      emit(state.copyWith(status: AddNoteStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddNoteStatus.error));
    }
  }
}

abstract class AddNoteEvent extends Equatable {
  const AddNoteEvent();

  @override
  List<Object?> get props => [];
}

class AddNoteSubmitted extends AddNoteEvent {
  const AddNoteSubmitted();
}

class AddNoteContentChanged extends AddNoteEvent {
  const AddNoteContentChanged(this.content);

  final String content;

  @override
  List<Object?> get props => [content];
}
