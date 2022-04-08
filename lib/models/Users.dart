import 'package:flutter/material.dart';

class AccountPageList {
  final String tapName;
  final Icon leadingIcon;

  AccountPageList({
    required this.tapName,
    required this.leadingIcon,
  });
}

List<AccountPageList> accountPageListItems = [
  AccountPageList(
    tapName: "Edit Profile",
    leadingIcon: Icon(
      Icons.person_outline_outlined,
      color: Color(0xff0E0B16),
    ),
  ),
  AccountPageList(
      tapName: "Shopping Addresses",
      leadingIcon: Icon(
        Icons.location_on_outlined,
        color: Color(0xff0E0B16),
      )),
  AccountPageList(
      tapName: "Wishlist",
      leadingIcon: Icon(
        Icons.list_alt_outlined,
        color: Color(0xff0E0B16),
      )),
  AccountPageList(
      tapName: "Notification",
      leadingIcon: Icon(
        Icons.notifications_outlined,
        color: Color(0xff0E0B16),
      )),
  AccountPageList(
      tapName: "Cards",
      leadingIcon: Icon(
        Icons.credit_card_outlined,
        color: Color(0xff0E0B16),
      )),
  AccountPageList(
      tapName: "Preferences",
      leadingIcon: Icon(
        Icons.settings_outlined,
        color: Color(0xff0E0B16),
      )),
];
