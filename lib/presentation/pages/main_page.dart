import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/search_user/search_user_bloc.dart';
import 'package:user_github_borwita/presentation/pages/favorite_page_view.dart';
import 'package:user_github_borwita/presentation/pages/popular_page_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<SearchUserBloc>().add(PopularUsersFetchEvent());
  }

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
