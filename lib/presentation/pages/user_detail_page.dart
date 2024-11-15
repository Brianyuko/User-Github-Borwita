import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/detail_user/detail_user_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/favorite_status/favorite_status_bloc.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User'),
        centerTitle: false,
      ),
      body: BlocBuilder<DetailUserBloc, DetailUserState>(
        builder: (context, state) {
          return switch (state) {
            DetailUserEmpty() => const Center(
                child: Text('Detail User'),
              ),
            DetailUserLoading() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            DetailUserError() => Center(
                child: Text(state.error),
              ),
            DetailUserLoaded() => ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(state.user.avatarUrl),
                        radius: 50,
                      ),
                      const SizedBox(height: 8),
                      Text(state.user.username),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Follower: ',
                              children: [
                                TextSpan(
                                  text: state.user.followers.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text.rich(
                            TextSpan(
                              text: 'Following: ',
                              children: [
                                TextSpan(
                                  text: state.user.following.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          BlocConsumer<FavoriteStatusBloc, FavoriteStatusState>(
                            listenWhen: (previous, current) =>
                                current.message != '',
                            listener: (context, stateStatus) {
                              final message = stateStatus.message;
                              if (message ==
                                      FavoriteStatusBloc.addSuccessMessage ||
                                  message ==
                                      FavoriteStatusBloc.removeSuccessMessage) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(message),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            builder: (context, stateStatus) {
                              final isFavorite = context.select(
                                  (FavoriteStatusBloc bloc) =>
                                      bloc.state.status);
                              return IconButton(
                                icon: Icon(stateStatus.status
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                onPressed: () async {
                                  if (!isFavorite) {
                                    context.read<FavoriteStatusBloc>().add(
                                        AddToFavoritesEvent(user: state.user));
                                  } else {
                                    context.read<FavoriteStatusBloc>().add(
                                        RemoveFromFavoritesEvent(
                                            user: state.user));
                                  }
                                  context
                                      .read<FavoriteBloc>()
                                      .add(FavoriteFetchEvent());
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  ListTile(
                    title: const Text('Name'),
                    subtitle: Text(state.user.name),
                  ),
                  const SizedBox(height: 4),
                  ListTile(
                    title: const Text('Email'),
                    subtitle: Text(state.user.email),
                  ),
                  const SizedBox(height: 4),
                  ListTile(
                    title: const Text('Company'),
                    subtitle: Text(state.user.company),
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}
