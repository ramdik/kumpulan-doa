import 'package:flutter/material.dart';
import 'home_page.dart';
import 'article_page.dart';
import 'about_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;
  final screens = <Widget>[
    const HomePage(),
    const ArticlePage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      //AppBar Title
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: const Text(
              'Kumpulan Doa App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: null,
          backgroundColor: Colors.lightBlue.shade100,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(18))),
          elevation: 0,
        ),
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60,
          backgroundColor: Colors.grey.shade50,
          indicatorColor: Colors.lightBlue.shade100,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          animationDuration: const Duration(milliseconds: 800),
          destinations: <Widget>[
            NavigationDestination(
              icon: Image.asset(
                'images/quran_outlined.png',
                width: MediaQuery.of(context).size.width,
                height: 25,
              ),
              label: 'Home',
              selectedIcon: Image.asset(
                'images/quran.png',
                width: MediaQuery.of(context).size.width,
                height: 25,
              ),
            ),
            const NavigationDestination(
              icon: Icon(Icons.article_outlined),
              label: 'Article',
              selectedIcon: Icon(Icons.article),
            ),
            const NavigationDestination(
              icon: Icon(Icons.info_outline),
              label: 'About',
              selectedIcon: Icon(Icons.info),
            )
          ],
        ),
      ),
    );
  }
}
