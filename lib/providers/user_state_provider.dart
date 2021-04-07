//~ This provides the userdata to the app mainly the isAuthorized value
//& Made by PIG

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/user_model.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(User(
          email: "",
          name: "",
          isAuthorized: false,
          branch: 'CSE',
        ));

  void setUser() {
    ///[function] which gets the user details from app storage.
    ///on [App] start.
    ///this cannot be changed.
    state = User(
      email: "",
      name: "",
      isAuthorized: true,
      branch: 'CSE',
    );
  }
}

final userStateProvider = StateNotifierProvider<UserNotifier>((ref) {
  return UserNotifier();
});
