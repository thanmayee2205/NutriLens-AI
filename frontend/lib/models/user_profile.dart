class UserProfile {
  String fullName;
  int age;
  String gender;

  double height;
  double weight;

  String activityLevel;
  String dietPreference;

  bool diabetes;
  bool hypertension;
  bool cholesterol;

  List<String> allergies;

  UserProfile({
    this.fullName = '',
    this.age = 18,
    this.gender = 'Female',
    this.height = 170,
    this.weight = 65,
    this.activityLevel = 'Moderately Active',
    this.dietPreference = 'No Preference',
    this.diabetes = false,
    this.hypertension = false,
    this.cholesterol = false,
    this.allergies = const [],
  });
}