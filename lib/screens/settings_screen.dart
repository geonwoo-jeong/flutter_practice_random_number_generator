import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constants/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: maxNumber
                      .toInt()
                      .toString()
                      .split('')
                      .map((e) => Image.asset(
                            'assets/images/$e.png',
                            width: 50.0,
                            height: 70.0,
                          ))
                      .toList(),
                ),
              ),
              Slider(
                  value: maxNumber,
                  min: 1000,
                  max: 100000,
                  onChanged: (double val) {
                    setState(() {
                      maxNumber = val;
                    });
                  }),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: RED_COLOR),
                  onPressed: () {
                    Navigator.of(context).pop(maxNumber.toInt());
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
