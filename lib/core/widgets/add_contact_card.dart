import 'package:contacts/core/providers/contacts_sheet_provider.dart';
import 'package:contacts/core/utils/app_assets.dart';
import 'package:contacts/core/utils/app_colors.dart';
import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/core/utils/custom_contact_data.dart';
import 'package:contacts/core/utils/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AddContactCard extends StatelessWidget {
  final List<Contact> contacts;
  final Function onUserAdded;

  const AddContactCard({
    super.key,
    required this.contacts,
    required this.onUserAdded,
  });

  @override
  Widget build(BuildContext context) {
    final ContactsSheetProvider sheetProvider =
        Provider.of<ContactsSheetProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<ContactsSheetProvider>(
            builder: (context, provider, child) {
              return Row(
                spacing: 16,
                children: [
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        provider.pickImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: AppColors.gold, width: 1),
                        ),
                        child: provider.image == null
                            ? LottieBuilder.asset(AppImages.imagePicker)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.file(
                                    provider.image!,
                                    fit: BoxFit.cover,
                                  ),
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
                          customController: provider.nameController,
                          customText: 'User Name',
                        ),
                        Divider(),
                        CustomContactData(
                          customController: provider.emailController,
                          customText: 'example@email.com',
                        ),
                        Divider(),
                        CustomContactData(
                          customController: provider.phoneController,
                          customText: '01000000000',
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 8),
          CustomTextField(
            customController: sheetProvider.nameController,
            customHintText: 'Enter User Name',
            customKeyboardType: TextInputType.name,
            customTextInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16),
          CustomTextField(
            customController: sheetProvider.emailController,
            customHintText: 'Enter Email Address',
            customKeyboardType: TextInputType.emailAddress,
            customTextInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16),
          CustomTextField(
            customController: sheetProvider.phoneController,
            customHintText: 'Enter Phone Number',
            customKeyboardType: TextInputType.phone,
            customTextInputAction: TextInputAction.done,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              sheetProvider.addContact(contacts, context);
              onUserAdded();
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
