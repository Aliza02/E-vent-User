class OnboardingModel {
  OnboardingModel({required this.description, required this.image});

  String description;
  String image;
}

List<OnboardingModel> content = [
  OnboardingModel(
      description:
          'Welcome to EventuAlly, your ultimate event planning ally! Let\'s get started.',
      image: "assets/images/screen1.png"),
  OnboardingModel(
      description:
          'Find all the vendors you need for your next event, on a single platform.  ',
      image: "assets/images/screen2.png"),
  OnboardingModel(
      description:
          'Plan your events, on Your accord, with Your budget on Our platform: EventuAlly!',
      image: "assets/images/screen3.png"),
];
