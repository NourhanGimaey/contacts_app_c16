import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/core/utils/app_assets.dart';
import 'package:contacts/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact newContact;
  final VoidCallback removeContact;

  const ContactCard({
    super.key,
    required this.newContact,
    required this.removeContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  child: newContact.image == null
                      ? Image.asset(
                          AppImages.noImage,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : Image.file(
                          newContact.image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                ),
                Align(
                  alignment: AlignmentGeometry.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      newContact.name,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 4,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.email_rounded, color: AppColors.darkBlue),
                    Text(
                      newContact.email,
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.phone_rounded, color: AppColors.darkBlue),
                    Text(
                      '+2${newContact.phone}',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: removeContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_rounded),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
