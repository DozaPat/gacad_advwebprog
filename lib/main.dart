import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(

    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}


class ThemeModel with ChangeNotifier {
  bool _isDark = false;


  bool get isDark => _isDark;


  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners(); 
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listens to changes in ThemeModel to switch app theme dynamically
    final themeModel = Provider.of<ThemeModel>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Activity',
      // Dynamic theme selection based on ThemeModel state
      theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}

// Home screen widget that displays the theme switch
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing ThemeModel to read and toggle theme state from the app bar switch
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gacad App State Example'),
        actions: [
          // Row containing the theme label and toggle switch in the AppBar
          Row(
            children: [
              const Text('Dark Mode'),
              Switch(
                value: themeModel.isDark,
                onChanged: (_) => themeModel.toggleTheme(), // Toggles App State
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Toggle the theme using the switch in the app bar.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}