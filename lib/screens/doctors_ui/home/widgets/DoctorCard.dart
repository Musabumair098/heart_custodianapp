import 'package:flutter/material.dart';
import '../../doctor/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, // You can adjust the font size as needed
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Specialty: ${doctor.specialty}'),
            Text('Hospital: ${doctor.hospital}'),
          ],
        ),
      ),
    );
  }
}
