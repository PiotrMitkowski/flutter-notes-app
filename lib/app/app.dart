import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_notes_app/data/data.dart';
import 'package:flutter_notes_app/home/view/home_screen.dart';
import 'package:flutter_notes_app/l10n/l10n.dart';

part 'styles.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.notesRepository,
  });

  final NotesRepository notesRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: notesRepository,
      child: MaterialApp(
        theme: _appTheme(),
        home: const HomeScreen(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateTitle: (context) => context.l10n.appTitle,
      ),
    );
  }
}
