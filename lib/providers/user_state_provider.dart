//~ This provides the userdata to the app mainly the isAuthorized value
//& Made by PIG

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/scope/scope.dart';

import '/models/user/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(getUser()
            // const User(
            //   email: "vamshikrishna.kar@gmail.com",
            //   name: "vamshi krishna",
            //   isAuthorized: true,
            //   scope: Scope(branch: "CSE"),
            //   designation: "HOD",
            // ),
            );

  void setUser() {
    ///[function] which gets the user details from app storage.
    ///on [App] start.
    ///this cannot be changed.
    state = const User(
      email: "",
      name: "",
      isAuthorized: true,
      scope: Scope(branch: "CSE"),
    );
  }
}

User getUser() {
  return User(
      email: "hello@gmail.com",
      name: 'hello',
      isAuthorized: true,
      scope: Scope(branch: "CSE"));
}

final userStateProvider = StateNotifierProvider<UserNotifier>((ref) {
  return UserNotifier();
});
