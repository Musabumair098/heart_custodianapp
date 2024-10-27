import 'package:flutter/material.dart';

import '../../models/medicine.dart';
import '../medicine_details/medicine_details.dart';
import '../new_entry/new_entry.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3EB16F),
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xFFF6F8FC),
        child: const Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: TopContainer(),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 7,
              child: BottomContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: const Color(0xFF3EB16F),
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewEntry(),
            ),

            /*
        onPressed: () {
          // For demonstration purposes, creating a sample Medicine object
          Medicine medicine = Medicine(
            medicineName: "Sample Medicine",
            medicineType: "Pill",
            dosage: 500,
            interval: 4,
            startTime: ["08", "00"],
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicineDetails(medicine: medicine),
            ),*/
          );
        },
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 27),
          bottomRight: Radius.elliptical(50, 27),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 3.5),
          )
        ],
        color: Color(0xFF3EB16F),
      ),
      width: double.infinity,
      child: const Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              "Medicine",
              style: TextStyle(
                fontFamily: "Angel",
                fontSize: 64,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            color: Color(0xFFB0F3CB),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Center(
              child: Text(
                "Number of Reminders",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 5),
            child: Center(
              child: Text(
                '0', // Static value for UI-only version
                style: TextStyle(
                  fontFamily: "Neu",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F8FC),
      child: const Center(
        child: Text(
          "Press + to add a Mediminder",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFC9C9C9),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Placeholder for MedicineCard and other UI widgets
class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        highlightColor: Colors.white,
        splashColor: Colors.grey,
        onTap: () {
          // Placeholder for onTap action
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.local_hospital,
                  color: Color(0xFF3EB16F),
                  size: 50.0,
                ),
                Text(
                  "Medicine Name", // Static placeholder
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF3EB16F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Every X hours", // Static placeholder
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFC9C9C9),
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
