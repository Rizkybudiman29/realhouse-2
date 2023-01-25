import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realhouse_smart/util/smart_devices_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // PADDING CONSTANTS
  final double horizontalPadding = 40;
  final double verticalPadding = 20;

  // LIST OF SMART DEVICES
  List mySmartDevices = [
    ["Smart Light", "asset/light-bulb.png", true],
    ["Smart AC", "asset/air-conditioner.png", false],
    ["Smart TV", "asset/smart-tv.png", false],
    ["Smart Fan", "asset/fan.png", false],
  ];

  // POWER BUTTON SWITCHED
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CUSTOM APP BAR
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MENU ICON
                  Image.asset(
                    'asset/menu.png',
                    height: 40,
                    color: Colors.green,
                  ),

                  // ACCOUNT ICON
                  Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.green,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // WELCOME HOME
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: GoogleFonts.prompt(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "RIZKY BUDIMAN",
                    style:
                        GoogleFonts.prompt(fontSize: 32, color: Colors.green),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            //   child: Divider(
            //     color: Colors.grey,
            //     thickness: 0.5,
            //   ),
            // ),

            // SMART DEVICE + GRID
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: GoogleFonts.prompt(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 20, right: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                itemBuilder: (context, index) {
                  return SmartDevicesBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
