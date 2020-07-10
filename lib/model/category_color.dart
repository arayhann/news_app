import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryColor {
  final String category;

  CategoryColor(this.category);
  Color get categoryColor {
    switch (category) {
      case 'business':
        return Colors.blue;
      case 'entertainment':
        return Colors.pink;
      case 'general':
        return Colors.green;
      case 'health':
        return Colors.cyanAccent;
      case 'science':
        return Colors.grey;
      case 'sports':
        return Colors.red;
      case 'technology':
        return Colors.indigo;
    }
  }
}
