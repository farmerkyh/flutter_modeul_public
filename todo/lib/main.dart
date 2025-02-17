/*
  - Flutter : ver-3.3.7
*/
import 'package:flutter/material.dart';
import 'package:todo_udemy/todo_step1/todo_udemy_step1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grid Template',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyGrid(),
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Module"),
        centerTitle: true,
        //elevation: 0.0,

        actions: [
          IconButton(
            onPressed: () {
              debugPrint("click");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),

      //-------------------------------------------------------
      //2. menu
      //-------------------------------------------------------
      drawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.only(bottom: 20),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/farmer_loop.png'),
                backgroundColor: Colors.white,
              ),
              accountEmail: Text("aa@naver.com"),
              accountName: Text("farmer"),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 176, 211, 240),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0))),
            ),
            //ListView
            createLeftOneMenu(context, "Udemy강의 Site의 TODO", const TodoUdemyStep1()),

            const Divider(height: 5),

            const Divider(height: 50),
          ],
        ),
      ),

      //-------------------------------------------------------
      //3. body
      //-------------------------------------------------------
      body: const Center(child: Text("Grid Template 모음집 \n메뉴를 클릭 하세요.")),
    );
  }

  //-------------------------------------------------------
  //@class 왼쪽 메뉴 라인 생성
  //-------------------------------------------------------
  Widget createLeftOneMenu(BuildContext context, String menuNm, Widget page) {
    return Center(
      child: SizedBox(
        height: 30,
        child: ListTile(
          title: Text(menuNm),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
            //Navigator.pop(context);
            //Route route = MaterialPageRoute(builder: (context) => ListViewStep10());
            //Navigator.pushReplacement(context, route);
          },
        ),
      ),
    );
  }
}
