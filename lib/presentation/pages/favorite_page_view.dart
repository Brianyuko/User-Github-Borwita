import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/detail_user/detail_user_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/favorite_status/favorite_status_bloc.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends State<FavoritePageView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(FavoriteFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return switch (state) {
          FavoriteEmpty() => const Center(
              child: Text('Favorite is empty'),
            ),
          FavoriteLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          FavoriteError() => Center(
              child: Text(state.error),
            ),
          FavoriteLoaded() => state.users.isEmpty
              ? const Center(
                  child: Text('Favorite is empty'),
                )
              : ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.username),
                          Text(user.type),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatarUrl),
                      ),
                      onTap: () {
                        context.read<DetailUserBloc>().add(
                              DetailUserFetchEvent(
                                username: user.username,
                              ),
                            );
                        context.read<FavoriteStatusBloc>().add(
                              LoadFavoritesEvent(
                                id: user.id,
                              ),
                            );
                        Navigator.pushNamed(
                          context,
                          '/user_detail',
                        );
                      },
                    );
                  },
                ),
        };
      },
    );
  }
}
