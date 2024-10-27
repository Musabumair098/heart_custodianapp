import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // TextEditingController for user input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _maritalStatusController = TextEditingController();

  // Heart health variables
  String? smokingStatus;
  String? alcoholConsumption;
  String? physicalActivity;
  String? familyHistory;
  String? heartCheckup;
  String? medication;
  List<String> medicalConditions = [];
  List<String> symptoms = [];
  int stressLevel = 1;

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    String? userId = FirebaseAuth.instance.currentUser?.uid; // Get the current user's ID
    if (userId != null) {
      _fetchUserProfile(userId); // Call this function to populate the existing profile data if available
    } else {
      print("User not logged in.");
    }
  }

  void _fetchUserProfile(String userId) async {
    try {
      DataSnapshot snapshot = await _database.child('users/$userId').get();
      if (snapshot.exists) {
        Map<String, dynamic> userProfile = Map<String, dynamic>.from(snapshot.value as Map);

        // Populate the fields with existing data
        _nameController.text = userProfile['name'] ?? '';
        _emailController.text = userProfile['email'] ?? '';
        _dobController.text = userProfile['date_of_birth'] ?? '';
        _genderController.text = userProfile['gender'] ?? '';
        _maritalStatusController.text = userProfile['marital_status'] ?? '';
        smokingStatus = userProfile['smoking_status'] as String?;
        alcoholConsumption = userProfile['alcohol_consumption'] as String?;
        physicalActivity = userProfile['physical_activity'] as String?;
        familyHistory = userProfile['family_history'] as String?;
        heartCheckup = userProfile['heart_checkup'] as String?;
        medication = userProfile['medication'] as String?;
        medicalConditions = List<String>.from(userProfile['medical_conditions'] ?? []);
        symptoms = List<String>.from(userProfile['symptoms'] ?? []);
        stressLevel = userProfile['stress_level'] as int? ?? 1;

        setState(() {}); // Trigger a UI rebuild with the fetched data
      } else {
        print("No user data found for user ID: $userId");
      }
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  void _createOrUpdateUserProfile() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid; // Get the current user's ID
      if (userId != null) {
        await _database.child('users/$userId').set({
          'name': _nameController.text,
          'email': _emailController.text,
          'date_of_birth': _dobController.text,
          'gender': _genderController.text,
          'marital_status': _maritalStatusController.text,
          'smoking_status': smokingStatus,
          'alcohol_consumption': alcoholConsumption,
          'physical_activity': physicalActivity,
          'family_history': familyHistory,
          'heart_checkup': heartCheckup,
          'medication': medication,
          'medical_conditions': medicalConditions,
          'symptoms': symptoms,
          'stress_level': stressLevel,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User profile updated successfully!")),
        );
      } else {
        print("User not logged in.");
      }
    } catch (e) {
      print("Error updating user profile: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error updating user profile!")),
      );
    }
  }

  void _updateMedicalConditions(String condition, bool isSelected) {
    setState(() {
      if (isSelected) {
        medicalConditions.add(condition);
      } else {
        medicalConditions.remove(condition);
      }
    });
  }

  void _updateSymptoms(String symptom, bool isSelected) {
    setState(() {
      if (isSelected) {
        symptoms.add(symptom);
      } else {
        symptoms.remove(symptom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Information'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Custom AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              _buildTextField(_nameController, 'Name', Icons.person),
              const SizedBox(height: 12.0),
              _buildTextField(_emailController, 'Email Address', Icons.email),
              const SizedBox(height: 12.0),
              _buildTextField(_dobController, 'Date of Birth', Icons.calendar_today),
              const SizedBox(height: 12.0),
              _buildTextField(_genderController, 'Gender', Icons.person_outline),
              const SizedBox(height: 12.0),
              _buildTextField(_maritalStatusController, 'Marital Status', Icons.family_restroom),
              const SizedBox(height: 20),

              const Text(
                'Heart Health Questionnaire',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildRadioListTile('Do you smoke?', smokingStatus, (value) => setState(() => smokingStatus = value)),
              const SizedBox(height: 10),
              _buildRadioListTile('Alcohol Consumption', alcoholConsumption, (value) => setState(() => alcoholConsumption = value), [
                'Never',
                'Occasionally',
                'Regularly',
              ]),
              const SizedBox(height: 10),
              _buildDropdown('Physical Activity Level', physicalActivity, [
                'Sedentary',
                'Lightly active',
                'Moderately active',
                'Very active',
              ], (value) => setState(() => physicalActivity = value)),
              const SizedBox(height: 10),
              _buildRadioListTile('Family history of heart disease?', familyHistory, (value) => setState(() => familyHistory = value)),
              const SizedBox(height: 10),
              _buildRadioListTile('Had a heart checkup in the last year?', heartCheckup, (value) => setState(() => heartCheckup = value)),
              const SizedBox(height: 10),
              _buildRadioListTile('Taking medication for heart issues?', medication, (value) => setState(() => medication = value)),

              const SizedBox(height: 20),
              const Text('Medical Conditions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildCheckboxListTile('High Blood Pressure', medicalConditions.contains('High Blood Pressure'),
                      (value) => _updateMedicalConditions('High Blood Pressure', value!)),
              _buildCheckboxListTile('Diabetes', medicalConditions.contains('Diabetes'),
                      (value) => _updateMedicalConditions('Diabetes', value!)),

              const SizedBox(height: 20),
              const Text('Symptoms', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildCheckboxListTile('Chest Pain', symptoms.contains('Chest Pain'),
                      (value) => _updateSymptoms('Chest Pain', value!)),
              _buildCheckboxListTile('Shortness of Breath', symptoms.contains('Shortness of Breath'),
                      (value) => _updateSymptoms('Shortness of Breath', value!)),

              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _createOrUpdateUserProfile,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    backgroundColor: Colors.teal, // Custom button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Save Profile', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildRadioListTile(String title, String? groupValue, ValueChanged<String?> onChanged, [List<String>? options]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        ...?options?.map((option) => RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: groupValue,
          onChanged: onChanged,
        )),
        RadioListTile<String>(
          title: const Text('Yes'),
          value: 'Yes',
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        RadioListTile<String>(
          title: const Text('No'),
          value: 'No',
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String? selectedValue, List<String> options, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      value: selectedValue,
      onChanged: onChanged,
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }

  Widget _buildCheckboxListTile(String title, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  void dispose() {
    // Dispose of controllers to free resources
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _maritalStatusController.dispose();
    super.dispose();
  }
}
