import 'package:contacts/core/utils/app_colors.dart';
import 'package:contacts/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBlue,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.darkBlue),
      ),
      home: HomeScreen(),
    );
  }
}
