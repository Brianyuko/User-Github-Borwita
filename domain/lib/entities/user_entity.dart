import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String avatarUrl;
  final String url;
  final String type;
  final String username;
  final String name;
  final String email;
  final String company;
  final int followers;
  final int following;

  const UserEntity({
    required this.id,
    required this.avatarUrl,
    required this.url,
    required this.type,
    required this.username,
    required this.name,
    required this.email,
    required this.company,
    required this.followers,
    required this.following,
  });

  @override
  List<Object> get props => [
        id,
        avatarUrl,
        url,
        type,
        username,
        name,
        email,
        company,
        followers,
        following,
      ];
}
