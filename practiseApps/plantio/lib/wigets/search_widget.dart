import 'package:flutter/material.dart';

class MySearchWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const MySearchWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    // This widget only builds the search input UI.
    // Positioning is handled by TopCategorySection.
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Search For Plants",
          hintStyle: TextStyle(color: Color(0xFFD2D2D2)),
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
