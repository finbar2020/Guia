// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<IconData> icons;
  final List<String> labels;
  final List<VoidCallback> onPressed;
  final int currentIndex; // Adicionar o currentIndex

  const CustomBottomNavigationBar({
    super.key,
    required this.icons,
    required this.labels,
    required this.onPressed,
    required this.currentIndex, // Adicionar o currentIndex
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool _showColorEffect = false;

  void _showColorEffectAnimation() {
    setState(() {
      _showColorEffect = true;
    });

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _showColorEffect = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    final bottomNavigationBarTheme = currentTheme.bottomNavigationBarTheme;

    return Container(
      decoration: BoxDecoration(
        color: bottomNavigationBarTheme.backgroundColor ?? Colors.white,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.icons.length, (index) {
            final isSelected = widget.currentIndex == index;
            final iconColor = isSelected
                ? bottomNavigationBarTheme.selectedItemColor ?? Colors.black
                : bottomNavigationBarTheme.unselectedItemColor ?? Colors.black;
            final textColor = isSelected
                ? bottomNavigationBarTheme.selectedItemColor ?? Colors.black
                : bottomNavigationBarTheme.unselectedItemColor ?? Colors.black;

            return Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    widget.onPressed[index]();
                    _showColorEffectAnimation();
                  },
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: isSelected && _showColorEffect
                        ? iconColor.withOpacity(0.2)
                        : bottomNavigationBarTheme.backgroundColor ?? Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          widget.icons[index],
                          size: 28.0,
                          color: iconColor,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.labels[index],
                          style: TextStyle(
                            fontSize: 10,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
