import 'package:contacts/core/providers/home_screen_provider.dart';
import 'package:contacts/core/utils/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsGridView extends StatelessWidget {
  const ContactsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: GridView.builder(
            itemCount: provider.contacts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: .65,
            ),
            padding: EdgeInsets.all(16),
            itemBuilder: (BuildContext context, index) {
              return ContactCard(
                newContact: provider.contacts[index],
                removeContact: () {
                  provider.removeContactByIndex(index);
                },
              );
            },
          ),
        );
      },
    );
  }
}
