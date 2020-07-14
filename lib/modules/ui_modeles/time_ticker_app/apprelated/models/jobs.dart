import 'package:meta/meta.dart';

class Job {
  final String name;
  final int ratePerHour;
  final String id;
  Job({@required this.name, @required this.ratePerHour, @required this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
      'id': id,
    };
  }

  factory Job.fromMap(Map<String, dynamic> json, id) {
    return json == null
        ? null
        : Job(
            name: json["name"],
            ratePerHour: json["ratePerHour"],
            id: id,
          );
  }
}
