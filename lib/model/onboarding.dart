import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String description;
  final String image;
  final Color color;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });

  static List<OnboardingData> onboarding = [
    OnboardingData(
        title: "Never go offline",
        description: "Stay online at cheaper rates",
        image: "",
        color: Colors.green),
    OnboardingData(
        title: "5G Internet when you connect",
        description:
            "Blazing fast internet connectivity, catch that if you can...",
        image: "",
        color: Colors.yellow),
    OnboardingData(
        title: "Save as you go",
        description: "Cut excessive costs on calls and browsing",
        image: "",
        color: Colors.red)
  ];
}
