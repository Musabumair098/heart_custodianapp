import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../doctors_ui/welcome/welcome_screen.dart';
import '../../medical_reports/view/my_reports.dart';
import '../../medicine_ui/ui/homepage/home_page1.dart';

import '../../nutrition_screen/view/home/home_screen.dart';

import '../../profile_screen/profile_screen.dart';
import '../controller/dashboard_controller.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final DashboardController controller = DashboardController();

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Heart Custodian',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Add your menu logic here
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your notification logic here
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Add your menu item actions here
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'About',
                child: Text('About'),
              ),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            print(controller.currentIndex);
                          },
                          child: CarouselSlider(
                            items: controller.imageList
                                .map(
                                  (item) => Image.asset(
                                item!.imagePath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            )
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  controller.updateCurrentIndex(index);
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.imageList.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    carouselController.animateToPage(entry.key),
                                child: Container(
                                  width: controller.currentIndex == entry.key ? 17 : 7,
                                  height: 7.0,
                                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: controller.currentIndex == entry.key
                                        ? Colors.red
                                        : Colors.teal,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'My Dashboard',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildDashboardCard(
                      context,
                      title: 'My Profile',
                      imagePath: 'assets/images/user.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyProfileScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    buildDashboardCard(
                      context,
                      title: 'Medicines',
                      imagePath: 'assets/images/healthcare.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildDashboardCard(
                      context,
                      title: 'Nutrition',
                      imagePath: 'assets/images/diet.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                        // Add Nutrition onTap logic
                      },
                    ),
                    const SizedBox(width: 5),
                    buildDashboardCard(
                      context,
                      title: 'Doctors',
                      imagePath: 'assets/images/doctor.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 5),
                    buildDashboardCard(
                      context,
                      title: 'My Reports',
                      imagePath: 'assets/images/sheet.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyReports(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildDashboardCard(
                      context,
                      title: 'Emergency Alerts',
                      icon: Icons.access_alarm, onTap: () {  },
                    ),
                    const SizedBox(width: 7),
                    buildDashboardCard(
                      context,
                      title: 'Payment',
                      icon: Icons.attach_money, onTap: () {  },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDashboardCard(BuildContext context, {String? title, String? imagePath, IconData? icon, required VoidCallback? onTap}) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                icon != null
                    ? Icon(icon, size: 50, color: Colors.purple)
                    : Image.asset(imagePath!, width: 50, height: 50),
                const SizedBox(height: 8),
                Text(
                  title!,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
