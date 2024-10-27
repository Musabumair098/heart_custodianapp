// report_controller.dart
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';

import '../model/report_model.dart';


class ReportController {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref().child('reports');

  Future<void> saveReport(Report report) async {
    final newReportRef = _databaseRef.push();
    await newReportRef.set(report.toJson());
  }
}
