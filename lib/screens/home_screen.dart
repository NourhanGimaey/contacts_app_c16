import 'package:contacts/core/providers/contacts_sheet_provider.dart';
import 'package:contacts/core/providers/home_screen_provider.dart';
import 'package:contacts/core/utils/app_assets.dart';
import 'package:contacts/core/utils/app_colors.dart';
import 'package:contacts/core/widgets/add_contact_card.dart';
import 'package:contacts/core/widgets/contacts_widget.dart';
import 'package:contacts/core/widgets/empty_contacts_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenProvider homeProvider = Provider.of<HomeScreenProvider>(
      context,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(AppImages.routeLogo, height: 39),
            ),
            homeProvider.contacts.isEmpty
                ? const EmptyContactsWidget()
                : const ContactsGridView(),
          ],
        ),
      ),
      floatingActionButton: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: homeProvider.contacts.isNotEmpty,
            child: FloatingActionButton(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              child: const Icon(Icons.delete_rounded),
              onPressed: () {
                homeProvider.removeLastContact();
              },
            ),
          ),
          Visibility(
            visible: homeProvider.contacts.length < 6,
            child: FloatingActionButton(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              onPressed: () {
                modalBottomSheet(context, homeProvider);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void modalBottomSheet(BuildContext context, HomeScreenProvider provider) {
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
          child: ChangeNotifierProvider(
            create: (context) => ContactsSheetProvider(),
            child: AddContactCard(
              contacts: provider.contacts,
              onUserAdded: () {
                provider.updateHomeScreen();
              },
            ),
          ),
        );
      },
    );
  }
}
