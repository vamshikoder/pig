//~ This provides the userdata to the app mainly the isAuthorized value
//& Made by PIG

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/user/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(const User(
          email: "",
          name: "",
          isAuthorized: true,
          scope: 'CSE',
        ));

  void setUser() {
    ///[function] which gets the user details from app storage.
    ///on [App] start.
    ///this cannot be changed.
    state = const User(
      email: "",
      name: "",
      isAuthorized: true,
      scope: 'CSE',
    );
  }
}

final userStateProvider = StateNotifierProvider<UserNotifier>((ref) {
  return UserNotifier();
});
