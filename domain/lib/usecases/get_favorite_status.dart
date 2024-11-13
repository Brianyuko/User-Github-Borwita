import 'package:domain/repository/repository.dart';

class GetFavoriteStatus {
  final Repository repository;

  GetFavoriteStatus(this.repository);

  Future<bool> call({
    required int id,
  }) {
    return repository.isAddedToFavorite(
      id: id,
    );
  }
}
