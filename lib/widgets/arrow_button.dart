import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color arrowcolor;
  final Color? backgroundColor;
  final bool notBackButton;
  final bool isNext;
  final bool isDefined;
  final IconData iconData;

  const ArrowButton({
    Key? key,
    this.onPressed,
    this.isDefined = false,
    this.notBackButton = false,
    this.iconData = Icons.close,
    this.arrowcolor = Colors.grey,
    this.backgroundColor,
    this.isNext = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: -2,
            ),
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: -2,
            )
          ],
        ),
        child: Align(
          child: Icon(
            isDefined
                ? iconData
                : !isNext
                    ? Icons.chevron_left
                    : Icons.chevron_right,
            color: arrowcolor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
