import 'package:flutter/material.dart';
import 'add_report_page.dart';



class MyReports extends StatefulWidget {
  const MyReports({super.key});

  @override
  State<MyReports> createState() => _MyReportsState();
}

class _MyReportsState extends State<MyReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Medical Records'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'My Reports',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15), // Space between text and icon
            const Icon(
              Icons.insert_drive_file, // File record icon
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 15), // Space between icon and new text
            const Text(
              'Keep your Medical Record Safe!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Start managing your medical health record!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            const SizedBox(height: 15), // Space between text items
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle, // Checkmark icon
                  color: Colors.green,
                  size: 24,
                ),
                const SizedBox(width: 8), // Space between icon and text
                const Text(
                  'Share your record with doctors',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15), // Space between text items
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle, // Checkmark icon
                  color: Colors.green,
                  size: 24,
                ),
                const SizedBox(width: 8), // Space between icon and text
                const Text(
                  'Upload and save records',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Space before button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddReportPage(),
                  ),
                );

                // Action for the button
                // You can implement the functionality here
              },
              style: ElevatedButton.styleFrom(
               backgroundColor : Colors.green, // Background color
               foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Button shape
                ),
                elevation: 5, // Elevation shadow
              ),
              child: const Text('Add Report'),
            ),
          ],
        ),
      ),
    );
  }
}
