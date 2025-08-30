import 'package:flutter/material.dart';
import 'package:reminders/data/dataUser.dart';
import 'package:reminders/screens/login.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});
  @override
  State<MyHomeScreen> createState() {
    return _MyHomeScreenState();
  }
}

bool reminderNameConf = false;
bool remindertimeConf = false;

String reminderNameVal = "";
String reminderTimeVal = "";
String reminderDetailsVal = "";

String errortext = "";

class _MyHomeScreenState extends State<MyHomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? "Home Page" : "My Account"),
        centerTitle: true,
        actions: selectedIndex == 0
            ? [
                /*IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Search',
                  onPressed: () {},
                ),*/
              ]
            : [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          //title: const Text("Logout"),
                          content: const Text(
                            "Are you sure you want to log out?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text("Reminder"),
                    subtitle: Text("Don’t forget your meeting at 8 AM"),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.alarm, color: Colors.blue),
                    title: Text("Reminder"),
                    subtitle: Text("Don’t forget your meeting at 10 AM"),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
          ),
          //////////////////////////////////////////////////////////////////////////
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(radius: 60),
                ),

                SizedBox(height: 10),

                Text(
                  name[numOfUser],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                Text(
                  email[numOfUser],
                  style: TextStyle(color: Colors.grey[700]),
                ),

                SizedBox(height: 20),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue),
                    title: Text("Phone Number"),
                    subtitle: Text(phoneNum[numOfUser]),
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text("Adrees"),
                    subtitle: Text(adrees[numOfUser]),
                  ),
                ),

                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    leading: Lgender[numOfUser] == GenderUser.male
                        ? Icon(Icons.male, color: Colors.blue)
                        : Icon(Icons.female, color: Colors.purple),
                    title: Text("Gender"),
                    subtitle: Text(
                      Lgender[numOfUser] == GenderUser.male ? "Male" : "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      drawer: selectedIndex == 0
          ? Drawer(
              /*child: Column(
                children: [
                  Expanded(child: Container(color: Colors.red)),

                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Data saved successfully!"),
                          backgroundColor: Colors.green, // لون الخلفية
                          duration: const Duration(seconds: 2), // المدة
                          action: SnackBarAction(
                            label: "Undo",
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                    child: Text("Show SnackBar"),
                  ),
                  SizedBox(height: 200),
                  Expanded(child: Container(color: Colors.blue)),
                ],
              ),*/
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Account",
          ),
        ],
      ),
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (ctx) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return SafeArea(
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: GestureDetector(
                              onTap: () {
                                FocusScope.of(ctx).unfocus();
                              },
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(
                                      ctx,
                                    ).viewInsets.bottom,
                                  ),
                                  child: Form(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          onChanged: (value) {
                                            remindersName.add(value);
                                            if (value.isEmpty) {
                                              reminderNameConf = false;
                                            } else {
                                              reminderNameConf = true;
                                              reminderNameVal = value;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: "Reminder Name",
                                            hintText:
                                                "Write name of reminder (required)",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        TextField(
                                          onChanged: (value) {
                                            if (value.isEmpty) {
                                              remindertimeConf = false;
                                            } else {
                                              remindertimeConf = true;
                                              reminderTimeVal = value;
                                            }
                                          },
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: "Reminder Time",
                                            hintText:
                                                "Write the time (required)",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        TextField(
                                          onChanged: (value) {
                                            if (value == "" || value.isEmpty) {
                                              reminderDetailsVal = " ";
                                            } else {
                                              reminderDetailsVal = value;
                                            }
                                          },
                                          maxLines: null,
                                          maxLength: 500,
                                          minLines: 3,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: "Reminder Details",
                                            hintText: "Optional",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          errortext,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                return Navigator.of(ctx).pop();
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            SizedBox(width: 10),
                                            ElevatedButton(
                                              onPressed: () {
                                                if (reminderNameConf &&
                                                    remindertimeConf) {
                                                  remindersName.add(
                                                    reminderNameVal,
                                                  );
                                                  remindersTime.add(
                                                    reminderTimeVal,
                                                  );
                                                  remindersDetails.add(
                                                    reminderDetailsVal,
                                                  );
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: const Text(
                                                        "Reminder add successfully!",
                                                      ),
                                                      backgroundColor:
                                                          Colors.green,
                                                      duration: const Duration(
                                                        seconds: 2,
                                                      ),
                                                    ),
                                                  );
                                                  return Navigator.of(
                                                    ctx,
                                                  ).pop();
                                                } else {
                                                  setState(() {
                                                    errortext =
                                                        "Please fill all required";
                                                  });
                                                }
                                              },
                                              child: Text("Add Reminder"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Icon(Icons.add),
            )
          : null,
    );
  }
}
