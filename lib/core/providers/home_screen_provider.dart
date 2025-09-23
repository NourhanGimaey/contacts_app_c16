import 'package:contacts/core/models/contact_model.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  final List<Contact> contacts = [];

  void removeLastContact() {
    contacts.removeLast();
    notifyListeners();
  }
}
