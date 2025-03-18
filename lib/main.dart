import 'package:custom_bottom_bar/components/custom_navigation_bar.dart';
import 'package:custom_bottom_bar/models/navigation_item.dart';
import 'package:custom_bottom_bar/pages/favorite_page.dart';
import 'package:custom_bottom_bar/pages/home_page.dart';
import 'package:custom_bottom_bar/pages/profile_page.dart';
import 'package:custom_bottom_bar/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom bottom appbar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Custom bottom appbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List pages = const [
    HomePage(),
    FavoritePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  void updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentIndex,
        onTap: updateIndex,
        selectedItemBackgroundColor: Color(0xFFFF0000),
        unselectedItemBackgroundColor: Colors.black,
        selectedIconColor: Color(0xFF000000),
        unselectedIconColor: Color(0xFFFF0000),
        selectedLabelColor:Color(0xFF000000),
        unselectedLabelColor: Color(0xFFFF0000),
        displayLabel: true,
        children: [
          NavigationItem(icon: Icons.home, label: 'Home', index: 0),
          NavigationItem(icon: Icons.favorite, label: 'Favorite', index: 1),
          NavigationItem(icon: Icons.settings, label: 'Settings', index: 2),
          NavigationItem(icon: Icons.person_2_outlined, label: 'Profile', index: 3),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
