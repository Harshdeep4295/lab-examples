import 'package:flutter_test/flutter_test.dart';
import 'package:lab_experiments/modules/ui_modeles/time_ticker_app/apprelated/models/jobs.dart';

void main() {
  group('fromMap', () {
    test('null data', () {
      final job = Job.fromMap(null, 'abc');
      expect(job, null);
    });

    test('all properties data', () {
      final job = Job.fromMap({
        'name': 'Blogging',
        'ratePerHour': 10,
      }, 'abc');
      expect(job.name, 'Blogging');
      expect(job.ratePerHour, 10);
      expect(job.id, 'abc');
    });
  });
}
