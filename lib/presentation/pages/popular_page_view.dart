import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/detail_user/detail_user_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/favorite_status/favorite_status_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/search_user/search_user_bloc.dart';

class PopularPageView extends StatefulWidget {
  const PopularPageView({super.key});

  @override
  State<PopularPageView> createState() => _PopularPageViewState();
}

class _PopularPageViewState extends State<PopularPageView> {
  @override
  void initState() {
    super.initState();
    context.read<SearchUserBloc>().add(PopularUsersFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchUserBloc, SearchUserState>(
      builder: (context, state) {
        return switch (state) {
          SearchUserEmpty() => const Center(
              child: Text('Popular Users'),
            ),
          SearchUserLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          SearchUserError() => Center(
              child: Text(state.error),
            ),
          SearchUserLoaded() => ListView.builder(
              itemCount: state.popularUsers.length,
              itemBuilder: (context, index) {
                final user = state.popularUsers[index];
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
