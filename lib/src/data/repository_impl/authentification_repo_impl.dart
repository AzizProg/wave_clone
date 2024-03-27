import 'dart:async';
import 'package:wave_clone/src/domain/repository/authentification_repository.dart';

enum AuthentificationStatus { authentificated, unauthenticated, failed }

class AuthentificationRepoImpl extends AuthentificationRepository {
  final _controller = StreamController<AuthentificationStatus>();

  Stream<AuthentificationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _controller.stream;
  }

  @override
  Future<void> logIn() {
    return Future.delayed(const Duration(seconds: 1),
        () => _controller.add(AuthentificationStatus.authentificated));
  }

  @override
  void logOut() {
    Future.delayed(const Duration(seconds: 1),
        () => _controller.add(AuthentificationStatus.unauthenticated));
  }

  void dispose() => _controller.close();
}
