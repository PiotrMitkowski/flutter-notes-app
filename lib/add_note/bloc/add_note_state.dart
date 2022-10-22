part of 'add_note_bloc.dart';

enum AddNoteStatus { initial, loading, success, error }

class AddNoteState extends Equatable {
  const AddNoteState({
    this.status = AddNoteStatus.initial,
    this.content = '',
  });

  final AddNoteStatus status;
  final String content;

  AddNoteState copyWith({
    AddNoteStatus? status,
    String? content,
  }) {
    return AddNoteState(
      status: status ?? this.status,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [status, content];
}
