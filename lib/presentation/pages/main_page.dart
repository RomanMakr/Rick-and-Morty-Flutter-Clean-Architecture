import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/character_router.gr.dart';

@RoutePage()
class ManiPage extends StatelessWidget {
  const ManiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 99, 96, 96),
          title: Text(
            tabsRouter.activeIndex == 0 ? 'Home' : 'Favorites',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      routes: [HomeRoute(), FavoriteRoute()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: const Color.fromARGB(255, 99, 96, 96),
          selectedItemColor: Colors.red,
          unselectedItemColor: const Color.fromARGB(255, 185, 181, 181),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          ],
        );
      },
    );
  }
}
