import 'package:pig/models/scope/scope.dart';
import 'package:pig/models/user/user.dart';

List<User> students = const [
  User(
    email: "vamshikrishna.kar@gmail.com",
    name: "vamshi krishna",
    isAuthorized: false,
    scope: Scope(branch: "CSE", year: '4', section: "b"),
  ),
  User(
    email: "karnenavijaya@gmail.com",
    name: "vijaya",
    isAuthorized: false,
    scope: Scope(branch: "CSE", year: '4', section: "b"),
  ),
];
