import 'package:contacts/core/utils/app_assets.dart';
import 'package:contacts/core/utils/app_colors.dart';
import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/core/widgets/add_contact_card.dart';
import 'package:contacts/core/widgets/contacts_widget.dart';
import 'package:contacts/core/widgets/empty_contacts_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> contacts = [];

  void modalBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: AppColors.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: AddContactCard(
            contacts: contacts,
            onUserAdded: () {
              setState(() {});
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(AppImages.routeLogo, height: 39),
            ),
            contacts.isEmpty
                ? EmptyContactsWidget()
                : ContactsGridView(
                    contacts: contacts,
                    voidCallback: () {
                      setState(() {});
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: contacts.isNotEmpty,
            child: FloatingActionButton(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              child: Icon(Icons.delete_rounded),
              onPressed: () {
                contacts.removeLast();
                setState(() {});
              },
            ),
          ),
          Visibility(
            visible: contacts.length < 6,
            child: FloatingActionButton(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              onPressed: modalBottomSheet,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
