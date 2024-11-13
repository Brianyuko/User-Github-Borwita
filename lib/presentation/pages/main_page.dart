import 'package:flutter/material.dart';
import 'package:user_github_borwita/presentation/pages/favorite_page_view.dart';
import 'package:user_github_borwita/presentation/pages/popular_page_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Github Apps Demo'),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Popular',
                icon: Icon(Icons.account_circle),
              ),
              Tab(
                text: 'Favorite',
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PopularPageView(),
            FavoritePageView(),
          ],
        ),
      ),
    );
  }
}
