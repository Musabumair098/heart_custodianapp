import 'package:flutter/material.dart';
import '../../models/medicine.dart';

class MedicineDetails extends StatelessWidget {
  final Medicine? medicine;

  const MedicineDetails({this.medicine, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (medicine == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: const Text('No medicine details available'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xFF3EB16F),
        ),
        centerTitle: true,
        title: const Text(
          "Medicine Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MainSection(medicine: medicine!),
            const SizedBox(
              height: 15,
            ),
            ExtendedSection(medicine: medicine!),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.06,
                right: MediaQuery.of(context).size.height * 0.06,
                top: 25,
              ),
              child: Container(
                width: 280,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3EB16F),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    print("Delete Reminder button pressed");
                  },
                  child: const Center(
                    child: Text(
                      "Delete Medicine",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainSection extends StatelessWidget {
  final Medicine medicine;

  const MainSection({required this.medicine, super.key});

  Hero makeIcon(double size) {
    if (medicine.medicineType == "Bottle") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image.asset(
          'assets/images/syrup.png',
          width: size,
          height: size,
          color: const Color(0xFF3EB16F), // Optional color tint
          fit: BoxFit.contain,
        ),
      );
    } else if (medicine.medicineType == "Pill") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image.asset(
          'assets/images/pill.png',
          width: size,
          height: size,
          color: const Color(0xFF3EB16F),
          fit: BoxFit.contain,
        ),
      );
    } else if (medicine.medicineType == "Syringe") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image.asset(
          'assets/images/syringe.png',
          width: size,
          height: size,
          color: const Color(0xFF3EB16F),
          fit: BoxFit.contain,
        ),
      );
    } else if (medicine.medicineType == "Tablet") {
      return Hero(
        tag: medicine.medicineName + medicine.medicineType,
        child: Image.asset(
          'assets/images/tablet.png',
          width: size,
          height: size,
          color: const Color(0xFF3EB16F),
          fit: BoxFit.contain,
        ),
      );
    }
    return Hero(
      tag: medicine.medicineName + medicine.medicineType,
      child: Icon(
        Icons.local_hospital,
        color: const Color(0xFF3EB16F),
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        makeIcon(175),
        const SizedBox(
          width: 15,
        ),
        Column(
          children: <Widget>[
            Hero(
              tag: medicine.medicineName,
              child: Material(
                color: Colors.transparent,
                child: MainInfoTab(
                  fieldTitle: "Medicine Name",
                  fieldInfo: medicine.medicineName,
                ),
              ),
            ),
            MainInfoTab(
              fieldTitle: "Dosage",
              fieldInfo: medicine.dosage == 0
                  ? "Not Specified"
                  : "${medicine.dosage} mg",
            ),
          ],
        ),
      ],
    );
  }
}


class MainInfoTab extends StatelessWidget {
  final String fieldTitle;
  final String fieldInfo;

  const MainInfoTab({required this.fieldTitle, required this.fieldInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 100,
      child: ListView(
        padding: const EdgeInsets.only(top: 15),
        shrinkWrap: true,
        children: <Widget>[
          Text(
            fieldTitle,
            style: const TextStyle(
                fontSize: 17,
                color: Color(0xFFC9C9C9),
                fontWeight: FontWeight.bold),
          ),
          Text(
            fieldInfo,
            style: const TextStyle(
                fontSize: 24,
                color: Color(0xFF3EB16F),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  final Medicine medicine;

  const ExtendedSection({required this.medicine, super.key});

  @override
  Widget build(BuildContext context) {
    // Check if startTime has at least 4 elements
    String formattedStartTime;
    if (medicine.startTime.length >= 4) {
      formattedStartTime =
      "${medicine.startTime[0]}${medicine.startTime[1]}:${medicine.startTime[2]}${medicine.startTime[3]}";
    } else {
      // Fallback in case of insufficient elements
      formattedStartTime = "Not Specified";
    }

    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ExtendedInfoTab(
            fieldTitle: "Medicine Type",
            fieldInfo: medicine.medicineType == "None"
                ? "Not Specified"
                : medicine.medicineType,
          ),
          ExtendedInfoTab(
            fieldTitle: "Dose Interval",
            fieldInfo: "Every ${medicine.interval} hours  |  ${medicine.interval == 24 ? "One time a day" : (24 / medicine.interval).floor().toString() + " times a day"}",
          ),
          ExtendedInfoTab(
            fieldTitle: "Start Time",
            fieldInfo: formattedStartTime,
          ),
        ],
      ),
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  final String fieldTitle;
  final String fieldInfo;

  const ExtendedInfoTab({required this.fieldTitle, required this.fieldInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                fieldTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              fieldInfo,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFFC9C9C9),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
