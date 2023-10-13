import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/models/navigation_item.dart';
import 'package:music_app/pages/music_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState () => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<NavigationItem> navigationItems = [
    NavigationItem(label: 'Music', iconData: Icons.music_note, page: const MusicPage()),
    NavigationItem(label: 'Favorites', iconData: Icons.whatshot_outlined, page: Container()),
    NavigationItem(label: 'Search', iconData: Icons.search, page: Container()),
  ];

  int selectedNavItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.radio),
                    Icon(Icons.doorbell),
                    Icon(Icons.settings),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      navigationItems[selectedNavItemIndex].label,
                      style: GoogleFonts.quicksand(
                        textStyle: Theme.of(context).textTheme.headlineMedium,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ),
      body: navigationItems[selectedNavItemIndex].page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedNavItemIndex,
        items: navigationItems.map((item) => item.barItem).toList(),
        onTap: (index) => setState(() => selectedNavItemIndex = index),
      ),
    );
  }
}