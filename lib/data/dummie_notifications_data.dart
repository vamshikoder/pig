import '/models/notification/notification.dart' as n;

///[title] max [16] characters
///[description] max [600] characters

List<n.Notification> notifications = [
  n.Notification(
    title: 'assignment',
    author: 'bill gates',
    time: DateTime.now(),
    description: "lorem ipsum",
    designation: 'Assistant Professor CSE',
  ),
  n.Notification(
    title: 'abcdefghijklmnopqrstuvwxyzabcd',
    author: 'pablo escobar',
    time: DateTime.now(),
    description:
        " people who are interseted in joining in hackthon conducted by ace engineering college shall give their namespeople who are interseted in joining in hackthon conducted by ace engineering college shall give their namespeople who are interseted in joining in hackthon conducted by ace engineering college shall give their namespeople who are interseted in joining in hackthon conducted by ace engineering college shall give their names people who are interseted in joining in hackthon conducted by ace engineering college shall give their names people who are interseted in joining in hackthon conducted by ace engineering college shall give their names",
    designation: 'Head of the department CSE',
  ),
  n.Notification(
    title: 'assignment 2',
    author: 'tom cruise',
    time: DateTime.now(),
    description: "you need to submit assignment by 2nd may",
    designation: 'Assistant Professor CSE',
  ),
  n.Notification(
    title: 'assignment 3',
    author: 'rob jobs',
    time: DateTime.now(),
    description: "you need to submit assignment by 2nd may",
    designation: 'Assistant Professor CSE',
  ),
  n.Notification(
    title: 'assignment 4',
    author: 'elon fusk',
    time: DateTime.now(),
    description: "you need to submit assignment by 2nd may",
    designation: 'Assistant Professor CSE',
  ),
  n.Notification(
    title: 'assignment 5',
    author: 'johnny sins',
    time: DateTime.now(),
    description: "hello sutdetnts",
    designation: 'Assistant Professor CSE',
  ),
];
