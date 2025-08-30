import 'package:flutter/material.dart';
import 'package:reminders/data/dataUser.dart';
import 'package:reminders/screens/login.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SigninScreen> {
  String firstNVa = "";
  String lastNVa = "";
  String phounNumberVa = "";
  String adreesVa = "";
  String emailVa = "";
  String passVa = "";
  int? GenderValue;

  GenderUser? SelectedGender;

  bool firstNConf = false;
  bool lastNConf = false;
  bool phoneConf = false;
  bool adreesConf = false;
  bool emailConf = false;
  bool passConf = false;
  bool genderConf1 = false;
  bool genderConf2 = false;

  bool emailConfUnique = true;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Sign Up")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              if (value == "" || value.isEmpty) {
                                firstNConf = false;
                              } else {
                                firstNConf = true;
                                firstNVa = value;
                              }
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "First Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              if (value == "" || value.isEmpty) {
                                lastNConf = false;
                              } else {
                                lastNConf = true;
                                lastNVa = value;
                              }
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Last Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value == "" || value.isEmpty) {
                          phoneConf = false;
                        } else {
                          phoneConf = true;
                          phounNumberVa = value;
                        }
                      });
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      labelText: "Phone number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value == "" || value.isEmpty) {
                          adreesConf = false;
                        } else {
                          adreesConf = true;
                          adreesVa = value;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Adrees",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        if (value == "" || value.isEmpty) {
                          emailConf = false;
                        } else {
                          emailConf = true;
                          emailConfUnique = true;
                          for (int i = 0; i < email.length; i++) {
                            if (value == email[i]) {
                              emailConfUnique = false;
                              errorMessage = "Email is already in use";
                              break;
                            } else {
                              errorMessage = null;
                            }
                          }
                          if (emailConfUnique == true) {
                            emailVa = value;
                          }
                        }
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      errorText: errorMessage,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      if (value == "" || value.isEmpty) {
                        passConf = false;
                      } else {
                        passConf = true;
                        passVa = value;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Radio<GenderUser>(
                        value: GenderUser.male,
                        groupValue: SelectedGender,
                        onChanged: (value) {
                          setState(() {
                            GenderValue = 0;
                            SelectedGender = value;
                            genderConf1 = true;
                          });
                        },
                      ),
                      Text("Male"),
                      SizedBox(width: 20),
                      Radio<GenderUser>(
                        value: GenderUser.female,
                        groupValue: SelectedGender,
                        onChanged: (value) {
                          setState(() {
                            GenderValue = 1;
                            SelectedGender = value;
                            genderConf2 = true;
                          });
                        },
                      ),
                      Text("Female"),
                      SizedBox(width: 10),
                    ],
                  ),

                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (firstNConf &&
                            lastNConf &&
                            phoneConf &&
                            adreesConf &&
                            emailConfUnique &&
                            passConf &&
                            (genderConf1 || genderConf2)) {
                          if (GenderValue == 0) {
                            Lgender.add(GenderUser.male);
                          } else {
                            Lgender.add(GenderUser.female);
                          }
                          name.add("$firstNVa $lastNVa");
                          phoneNum.add(phounNumberVa);
                          adrees.add(adreesVa);
                          email.add(emailVa);
                          pass.add(passVa);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Pless fill all fields"),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      });
                    },
                    child: Text("Go to login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
