// This Module A Password Strength Checker
// My Function Is Returning A Report On The Password's Strength
// import a IO Module
import 'dart:io';

List<dynamic> passwordStrengthChecker(
  String password, {
  bool giveReport = false,
}) {
  List returnedList = [];
  double strengthScore = 0;
  Map<String, dynamic> report = {};

  // Check for Password Length
  if (password.length >= 8) {
    strengthScore += 2.0;
    report["Length"] =
        "${password.length} Good Length (8 or More than 8 Charactars)";
  } else {
    report["Length"] =
        "${password.length} Weak Length (Less than 8 Charactars)";
  }

  // Check for Uppercase Letters
  if (password.contains(RegExp(r'[A-Z]'))) {
    strengthScore += 2.0;
    report["Uppercase"] = "Contains Uppercase Letters (Good)";
  } else {
    report["Uppercase"] = "No Upper Case Letters (Weak)";
  }

  // Check for Lowercase Letters
  if (password.contains(RegExp(r'[a-z]'))) {
    strengthScore += 2.0;
    report["Lowercase"] = "Contains Lowercase Letters (Good)";
  } else {
    report["Lowercase"] = "No Lower Case Letters (Weak)";
  }

  // Check for Digits
  if (password.contains(RegExp(r"[0-9]"))) {
    strengthScore += 2.0;
    report["Digits"] = "Contains Digits (Good)";
  } else {
    report["Digits"] = "No Digits (Weak)";
  }

  // Check for Special Characters
  if (password.contains(RegExp(r'[!@#$%^&*(),.?\":{}|<>]'))) {
    strengthScore += 2.0;
    report["Special Characters"] = "Contains Special Characters (Good)";
  } else {
    report["Special Characters"] = "No Special Characters (Weak)";
  }

  // Determine Overall Strength
  String overallStrength;
  if (strengthScore >= 8) {
    overallStrength = "Strong";
  } else if (strengthScore >= 5) {
    overallStrength = "Moderate";
  } else if (strengthScore >= 3) {
    overallStrength = "Weak";
  } else {
    overallStrength = "Very Weak";
  }
  report["Overall Review"] = overallStrength;

  returnedList.add(strengthScore);
  returnedList.add(report);

  return returnedList;
}

void main() {
  print("Hello in My Password Strength Checker");
  stdout.write("Please Enter Your Password: ");
  String? user_input = stdin.readLineSync();

  if (user_input != null) {
    List result = passwordStrengthChecker(user_input, giveReport: true);
    print("Password Strength Score : ${result[0]}");
    print("Password Strength Report ...");
    Map<String, dynamic> report = result[1];
    report.forEach((key, value) {
      print("$key : $value");
    });

  }
}
