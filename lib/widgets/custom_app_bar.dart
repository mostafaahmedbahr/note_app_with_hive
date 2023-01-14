import 'package:flutter/material.dart';

import 'custom_search_icon.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon,required this.onPress}) : super(key: key);
  final String title;
  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: const TextStyle(
          fontSize: 28,
        ),),
        const Spacer(),
          CustomIcon(
          icon: icon,
            onPress: onPress,
        ),
      ],
    );
  }
}


