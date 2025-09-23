import 'package:contacts/core/models/contact_model.dart';
import 'package:contacts/core/utils/contact_card.dart';
import 'package:flutter/material.dart';

class ContactsGridView extends StatelessWidget {
  final List<Contact> contacts;
  final Function voidCallback;
  const ContactsGridView({
    super.key,
    required this.contacts,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: contacts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: .65,
        ),
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, index) {
          return ContactCard(
            newContact: contacts[index],
            removeContact: () {
              contacts.removeAt(index);
              voidCallback();
            },
          );
        },
      ),
    );
  }
}
