import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller
  TextEditingController controller = TextEditingController();
  // Task name
  List<String> task = [];
  // Task checkbox
  List<bool> checkBoxValue = [];
  // Task name color
  List<Color> taskNameColor = [];
  // Task name decoration
  List<TextDecoration> textDecoration = [];
  // Show The box
  void showTheBox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add New Task",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: SizedBox(
            width: double.infinity,
            height: 160,
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your new Task",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.add),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          // Task name
                          task.add(controller.text);
                          // CheckBox value
                          checkBoxValue.add(false);
                          // Task name color
                          taskNameColor.add(Colors.black);
                          // Task name decoration
                          textDecoration.add(TextDecoration.none);
                          // Clear the textfiled
                          controller.clear();
                        });
                        // Close the Alert
                        Navigator.of(context).pop();
                      },
                      color: Colors.black,
                      minWidth: 100,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    MaterialButton(
                      onPressed: () {
                        // Close the alert
                        Navigator.of(context).pop();
                      },
                      color: Colors.white,
                      minWidth: 100,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "To Do List",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                task.clear();
              });
            },
            child: Icon(Icons.delete_forever, size: 35,),
          ),
          SizedBox(width: 30),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "${task.length}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ListView.builder(
              itemCount: task.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        task[index],
                        style: TextStyle(
                          color: taskNameColor[index],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: textDecoration[index],
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: checkBoxValue[index],
                            onChanged: (value) {
                              setState(() {
                                checkBoxValue[index] = value!;
                                if (checkBoxValue[index] == false) {
                                  taskNameColor[index] = Colors.black;
                                  textDecoration[index] = TextDecoration.none;
                                } else {
                                  taskNameColor[index] = Colors.grey;
                                  textDecoration[index] =
                                      TextDecoration.lineThrough;
                                }
                              });
                            },
                            activeColor: Colors.grey,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                task.remove(task[index]);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showTheBox,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
