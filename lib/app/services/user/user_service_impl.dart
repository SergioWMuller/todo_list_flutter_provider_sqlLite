import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;

  UserServiceImpl({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<User?> register(String email, String passwoed) => _userRepository.register(email, passwoed);
}
