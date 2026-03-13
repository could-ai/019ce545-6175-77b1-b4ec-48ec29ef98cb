import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/tip.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/favorites_screen.dart';
import 'providers/favorites_provider.dart';
import 'providers/locale_provider.dart';
import 'localization/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          title: 'AI Skill Booster',
          debugShowCheckedModeBanner: false,
          locale: localeProvider.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('zh'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData.dark().copyWith(
            primaryColor: const Color(0xFF00FFFF), // Electric Blue
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF00FFFF),
              secondary: Color(0xFF9D4EDD), // Cyber Purple
              surface: Color(0xFF121212),
              background: Color(0xFF121212),
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1E1E1E),
              foregroundColor: Color(0xFF00FFFF),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color(0xFF00FFFF),
              foregroundColor: Colors.black,
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const MainScreen(),
            '/home': (context) => const HomeScreen(),
            '/search': (context) => const SearchScreen(),
            '/favorites': (context) => const FavoritesScreen(),
          },
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: localizations.search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: localizations.favorites,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00FFFF),
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF1E1E1E),
        onTap: _onItemTapped,
      ),
    );
  }
}
