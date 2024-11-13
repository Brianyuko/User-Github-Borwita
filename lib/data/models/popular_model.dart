import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class PopularModel extends Equatable {
  final int id;
  final String login;
  final String? avatarUrl;
  final String url;
  final String type;

  const PopularModel({
    required this.id,
    required this.login,
    this.avatarUrl,
    required this.url,
    required this.type,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
      url: json['url'],
      type: json['type'],
    );
  }

  PopularEntity toEntity() {
    return PopularEntity(
      id: id,
      username: login,
      avatarUrl: avatarUrl ?? "https://placehold.co/600x400",
      urlFull: url,
      type: type,
    );
  }

  @override
  List<Object?> get props => [
        id,
        login,
        avatarUrl,
        url,
        type,
      ];
}
