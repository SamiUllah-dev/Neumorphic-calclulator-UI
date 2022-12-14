import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:neumorphism_calculator/constants/colors.dart';
import 'package:neumorphism_calculator/widgets/neumorphism_button.dart';
import 'package:neumorphism_calculator/widgets/neumorphism_container.dart';
import 'package:neumorphism_calculator/widgets/neumorphism_switch.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isPressed = true;
  var isDarkMode = false;

  final buttonList = [
    'C',
    '%',
    '⨴',
    '∻',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '00',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF),
          elevation: 0,
          actions: [
            NeumorphismSwitch(
              isDarkMode: isDarkMode,
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            )
          ],
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 40,
                child: NeumorphismContainer(isDarkMode: isDarkMode),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 60,
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 70,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return NeumorphismButton(
                        onPressed: () {},
                        isDarkMode: isDarkMode,
                        child: buttonList[index],
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
