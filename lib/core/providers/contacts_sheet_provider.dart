import 'dart:io';

import 'package:contacts/core/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactsSheetProvider extends ChangeNotifier {
  File? image;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ContactsSheetProvider() {
    nameController.addListener(() {
      notifyListeners();
    });
    emailController.addListener(() {
      notifyListeners();
    });
    phoneController.addListener(() {
      notifyListeners();
    });
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      notifyListeners();
    }
  }

  void addContact(List<Contact> contacts, BuildContext context) {
    contacts.add(
      Contact(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        image: image,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
