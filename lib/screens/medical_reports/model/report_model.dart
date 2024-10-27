// report_model.dart
class Report {
  String reportTitle;
  String doctorName;
  String patientName;
  String notes;
  String imageUrl;
  int timestamp;

  Report({
    required this.reportTitle,
    required this.doctorName,
    required this.patientName,
    required this.notes,
    required this.imageUrl,
  }) : timestamp = DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toJson() {
    return {
      'reportTitle': reportTitle,
      'doctorName': doctorName,
      'patientName': patientName,
      'notes': notes,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
    };
  }
}
