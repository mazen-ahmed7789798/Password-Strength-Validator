// This Module A Password Strength Checker
// My Function Is Returning A Report On The Password's Strength

List<dynamic, dynamic> passwordStrengthChecker(
  String password, {
  bool giveReport = false,
}) {
  List returnedList = [];
  double strengthScore = 0;
  Map<String, dynamic> report = {};

  // Check for Password Length
  if (password.length >= 8) {
    strengthScore += 2.5;
    report["Length"] =
        "${password.length} Good Length (8 or More than 8 Charactars)";
  } else {
    report["Length"] =
        "${password.length} Weak Length (Less than 8 Charactars)";
  }

  // Check for Uppercase Letters 
  if (password.contains(RegExp(r'[A-Z]'))) {}
}
