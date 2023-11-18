import 'package:currency_converter/helpers/color_resources.dart';
import 'package:currency_converter/helpers/themes.dart';
import 'package:flutter/material.dart';


class MyListTileWidget extends StatelessWidget {
  final String title;
  final IconData trailingIcon;

  MyListTileWidget({
    required this.title,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: profileTextStyle(
              color: ColorResources.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(trailingIcon),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 3,
          ),
        ),
      ],
    );
  }
}
