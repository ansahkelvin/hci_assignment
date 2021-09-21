import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci/models/forum_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ForumModel> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.0,
        title: const Text(
          "Forum",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1576595580361-90a855b84b20?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1674&q=80"),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1576595580361-90a855b84b20?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1674&q=80"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Cristiano Ronaldo",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "@Ronaldo",
                        style: TextStyle(
                          color: Colors.grey,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "This is a new forum join and chat now. This is a new forum let's learn more about this topic",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(primary: Colors.green),
                        onPressed: () {},
                        icon: const Icon(Icons.message_outlined),
                        label: const Text("Join forum"),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(primary: Colors.red),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                        ),
                        label: const Text("Like"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
