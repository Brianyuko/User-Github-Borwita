import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String login;
  final String? avatarUrl;
  final String url;
  final String type;
  final String? name;
  final String? company;
  final String? email;
  final int? followers;
  final int? following;

  const UserModel({
    required this.id,
    required this.login,
    this.avatarUrl,
    required this.url,
    required this.type,
    this.company,
    this.name,
    this.email,
    this.followers,
    this.following,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
      url: json['url'],
      type: json['type'],
      name: json['name'],
      company: json['company'],
      email: json['email'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      login: json['username'],
      avatarUrl: json['avatarUrl'],
      url: json['url'],
      type: json['type'],
      name: json['name'],
      company: json['company'],
      email: json['email'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  //Create method From entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      login: entity.username,
      avatarUrl: entity.avatarUrl,
      url: entity.url,
      type: entity.type,
      name: entity.name,
      company: entity.company,
      email: entity.email,
      followers: entity.followers,
      following: entity.following,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      avatarUrl: avatarUrl ?? "https://placehold.co/600x400",
      url: url,
      type: type,
      username: login,
      name: name ?? "-",
      email: email ?? "-",
      company: company ?? "-",
      followers: followers ?? 0,
      following: following ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatarUrl': avatarUrl,
      'url': url,
      'type': type,
      'username': login,
      'name': name,
      'email': email,
      'company': company,
      'followers': followers,
      'following': following,
    };
  }

  @override
  List<Object?> get props => [
        id,
        login,
        avatarUrl,
        url,
        type,
        name,
        company,
        email,
        followers,
        following,
      ];
}
