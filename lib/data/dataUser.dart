int numOfUser = 0;

enum GenderUser { male, female }

List<String> email = ["omarshammout@gmail.com", "."];
List<String> pass = ["123", "."];
List<String> name = ["omar shammout", "omar shammout"];
List<String> phoneNum = ["0782714150", "0782714150"];
List<String> adrees = ["Amman-jordan", "Amman-jordan"];
List<GenderUser> Lgender = [GenderUser.male, GenderUser.male];

///////////////////////////////////////////////////////////////////////

List<String> remindersName = [""];
List<String> remindersTime = [""];
List<String> remindersDetails = [""];

/*
import 'package:flutter/material.dart';
import 'package:reminders/data/dataUser.dart';
import 'package:reminders/screens/login.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SigninScreen> {
  String nameFull = "";
  String phounNumberVa = "";
  String adreesVa = "";
  String emailVa = "";
  String passVa = "";
  int? GenderValue;

  String? errorMessage;

  GenderUser? SelectedGender;

  bool firstNConf = false;
  bool lastNConf = false;
  bool phoneConf = false;
  bool adreesConf = false;
  bool emailConf = false;
  bool emailConfUnique = false;
  bool passConf = false;
  bool genderConf1 = false;
  bool genderConf2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: SafeArea(
        child: SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                              errorMessage = "This field is required";
                            } else {
                              errorMessage = null;
                              firstNConf = true;
                              nameFull = value + " ";
                            }
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "First Name",
                          border: OutlineInputBorder(),
                          errorText: errorMessage,
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            if (value == "" || value.isEmpty) {
                              firstNConf = false;
                              errorMessage = "This field is required";
                            } else {
                              errorMessage = null;
                              firstNConf = true;
                              nameFull += value;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          border: OutlineInputBorder(),
                          errorText: errorMessage,
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
                        errorMessage = "This field is required";
                      } else {
                        errorMessage = null;
                        phoneConf = true;
                        phounNumberVa = value;
                      }
                    });
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: "Phone number",
                    border: OutlineInputBorder(),
                    errorText: errorMessage,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value == "" || value.isEmpty) {
                        adreesConf = false;
                        errorMessage = "This field is required";
                      } else {
                        errorMessage = null;
                        adreesConf = true;
                        adreesVa = value;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Adrees",
                    border: OutlineInputBorder(),
                    errorText: errorMessage,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value == "" || value.isEmpty) {
                        emailConf = false;
                        errorMessage = "This field is required";
                      } else {
                        errorMessage = null;
                        emailConf = true;
                        emailConfUnique = true;
                        for (int i = 0; i < email.length; i++) {
                          if (value == email[i]) {
                            emailConfUnique = false;
                            break;
                          }
                        }
                      }
                      if (emailConfUnique == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Email is already in use"),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      } else {
                        emailVa = value;
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
                    setState(() {
                      if (value == "" || value.isEmpty) {
                        passConf = false;
                        errorMessage = "This field is required";
                      } else {
                        errorMessage = null;
                        passConf = true;
                        passVa = value;
                      }
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    errorText: errorMessage,
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
                          if (genderConf1 == false && genderConf2 == false) {
                            errorMessage = "This field is required";
                          } else {
                            errorMessage = "";
                          }
                        });
                      },
                    ),
                    Text("Female"),
                    SizedBox(width: 10),
                    Text(
                      errorMessage.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
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
                          Lgender.add(GenderUser.male);
                        }
                        name.add(nameFull);
                        phoneNum.add(phounNumberVa);
                        adrees.add(adreesVa);
                        email.add(emailVa);
                        pass.add(passVa);
                        numOfUser++;
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
    );
  }
} */
