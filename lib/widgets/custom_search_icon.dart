import 'package:flutter/material.dart';
class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon,required this.onPress}) : super(key: key);
final IconData icon;
final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      child:  Center(
        child: IconButton(
          onPressed:onPress,
          icon: Icon(icon,
            size: 28,
          ),
        ),
      ),
    );
  }
}
