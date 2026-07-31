//starts configure the app
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/home_screen.dart';
void main() {
 runApp(const DisneyMoviesApp());
}
class DisneyMoviesApp extends StatelessWidget {
 const DisneyMoviesApp({super.key});
 @override
 Widget build(BuildContext context) {
   return ChangeNotifierProvider(
     create: (_) => FavoritesProvider(),
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Disney Movies',
       theme: ThemeData(
         brightness: Brightness.dark,
         scaffoldBackgroundColor: const Color(0xFF040714),
         colorScheme: ColorScheme.fromSeed(
           seedColor: const Color(0xFF0063E5),
           brightness: Brightness.dark,
         ),
         appBarTheme: const AppBarTheme(
           backgroundColor: Color(0xFF040714),
           elevation: 0,
           centerTitle: false,
         ),
         useMaterial3: true,
       ),
       home: const HomeScreen(),
     ),
   );
 }
}