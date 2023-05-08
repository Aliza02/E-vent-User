import 'package:flutter/animation.dart';

class onboarding_model {
  onboarding_model({required this.description, required this.image});

  String description;
  String image;
}

List<onboarding_model> content = [
  onboarding_model(
      description:
          'Welcome to EventuAlly, your ultimate event planning ally! Let' +
              's get started.',
      image: "assets/images/screen1.png"),
  onboarding_model(
      description:
          'Find all the vendors you need for your next event, on a single platform.  ',
      image: "assets/images/screen2.png"),
  onboarding_model(
      description:
          'Plan your events, on Your accord, with Your budget on Our platform: EventuAlly!',
      image: "assets/images/screen3.png"),
];
