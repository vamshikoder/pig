import '/models/scope/scope.dart';
import '/models/user/user.dart';

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
