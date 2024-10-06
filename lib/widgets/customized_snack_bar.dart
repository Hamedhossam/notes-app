import 'package:flutter/material.dart';

SnackBar customizedSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    backgroundColor: Colors.black87, // Optional: custom background color
    duration: const Duration(seconds: 2), // Duration for the SnackBar
  );
}
