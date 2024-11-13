import 'package:equatable/equatable.dart';

class PopularEntity extends Equatable {
  final int id;
  final String username;
  final String urlFull;
  final String type;
  final String avatarUrl;

  const PopularEntity({
    required this.id,
    required this.username,
    required this.urlFull,
    required this.type,
    required this.avatarUrl,
  });

  @override
  List<Object> get props => [
        id,
        username,
        urlFull,
        type,
        avatarUrl,
      ];
}
