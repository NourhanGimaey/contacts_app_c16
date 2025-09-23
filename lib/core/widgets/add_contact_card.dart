import 'dart:io';

import 'package:contacts/core/utils/app_assets.dart';
import 'package:contacts/core/utils/app_colors.dart';
import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/core/utils/custom_contact_data.dart';
import 'package:contacts/core/utils/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';

class AddContactCard extends StatefulWidget {
  final List<Contact> contacts;
  final Function onUserAdded;

  const AddContactCard({
    super.key,
    required this.contacts,
    required this.onUserAdded,
  });

  @override
  State<AddContactCard> createState() => _AddContactCardState();
}

class _AddContactCardState extends State<AddContactCard> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();

    _nameController.addListener(() {
      setState(() {});
    });
    _emailController.addListener(() {
      setState(() {});
    });
    _phoneController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  File? _image;
  final _picker = ImagePicker();

  pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: AppColors.gold, width: 1),
                    ),
                    child: _image == null
                        ? LottieBuilder.asset(AppImages.imagePicker)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.file(_image!, fit: BoxFit.cover),
                            ),
                          ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContactData(
                      customController: _nameController,
                      customText: 'User Name',
                    ),
                    Divider(),
                    CustomContactData(
                      customController: _emailController,
                      customText: 'example@email.com',
                    ),
                    Divider(),
                    CustomContactData(
                      customController: _phoneController,
                      customText: '01000000000',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          CustomTextField(
            customController: _nameController,
            customHintText: 'Enter User Name',
            customKeyboardType: TextInputType.name,
            customTextInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16),
          CustomTextField(
            customController: _emailController,
            customHintText: 'Enter Email Address',
            customKeyboardType: TextInputType.emailAddress,
            customTextInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16),
          CustomTextField(
            customController: _phoneController,
            customHintText: 'Enter Phone Number',
            customKeyboardType: TextInputType.phone,
            customTextInputAction: TextInputAction.done,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.contacts.add(
                Contact(
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  image: _image,
                ),
              );
              Navigator.pop(context);
              widget.onUserAdded();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 60),
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            child: Text('Add Contact'),
          ),
        ],
      ),
    );
  }
}
