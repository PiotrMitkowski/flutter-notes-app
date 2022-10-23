part of 'app.dart';

ThemeData _appTheme() {
  return ThemeData(
    primarySwatch: Colors.deepPurple,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
        color: Color(0xFF212121),
      ),
    ),
  );
}
