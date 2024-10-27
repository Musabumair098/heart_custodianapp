// add_report_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/report_controller.dart';
import '../model/report_model.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({super.key});

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  final _reportTitleController = TextEditingController();
  final _doctorNameController = TextEditingController();
  final _patientNameController = TextEditingController();
  final _notesController = TextEditingController();
  final ReportController _reportController = ReportController();

  File? _selectedImage;

  Future<void> _browseFile() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveReport() async {
    final reportTitle = _reportTitleController.text;
    final doctorName = _doctorNameController.text;
    final patientName = _patientNameController.text;
    final notes = _notesController.text;

    if (reportTitle.isNotEmpty && doctorName.isNotEmpty && patientName.isNotEmpty) {
      // Create a new report instance
      final report = Report(
        reportTitle: reportTitle,
        doctorName: doctorName,
        patientName: patientName,
        notes: notes,
        imageUrl: _selectedImage?.path ?? '',
      );

      try {
        await _reportController.saveReport(report);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Report saved successfully!')),
        );
        _clearFields();
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save report: $error')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields!')),
      );
    }
  }

  void _clearFields() {
    _reportTitleController.clear();
    _doctorNameController.clear();
    _patientNameController.clear();
    _notesController.clear();
    setState(() {
      _selectedImage = null; // Clear selected image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Report'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.insert_drive_file,
                      size: 50,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Add your photo or document here',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _browseFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                      ),
                      child: const Text('Browse File'),
                    ),
                    if (_selectedImage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Image.file(
                          _selectedImage!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Add Report Title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _reportTitleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Such as blood sugar etc...',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Doctor Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _doctorNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter doctor name',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Patient Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _patientNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter patient name',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Notes:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter some notes',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveReport,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
              child: const Text('Save Report'),
            ),
          ],
        ),
      ),
    );
  }
}
