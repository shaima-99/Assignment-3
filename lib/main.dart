//-----------------------------------------------------------------------------------------------------------------------------
//? Fill in the following information
//
// SCSJ3623 Mobile Application Programming
// Exercise 3 - HTTP and JSON
//
// Pair Programming
// Member 1's Name: Shaima Hussein   Matric: QU182DCDJ060       Location: ____________ (i.e. where are you currently located)
// Member 2's Name: Saya Azad    Matric:QU182DCDJ068       Location: ____________
// Date and time (s):   1, 14, 9:00   (Date and time you conducted the pair programming sessions)
//-----------------------------------------------------------------------------------------------------------------------------
//? This file is fully given.

import 'package:flutter/material.dart';

import 'router.dart';

void main() => runApp(
      MaterialApp(
        title: 'MAP Exercise 3',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    );
