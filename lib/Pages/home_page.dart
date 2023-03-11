import "package:flutter/material.dart";
import "package:wallpapperapp/widgets/drawer.dart";

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  final String name = 'Aryann';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wallpaper App",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child:
              Text("\t\t\t\t\t     Welcome $name\n Aryann KNOWS the best !!!"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
