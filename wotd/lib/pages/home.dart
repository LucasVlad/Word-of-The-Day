import 'package:flutter/material.dart';
import 'package:wotd/user_model.dart';
import 'package:wotd/api_service.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

/*class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    );
  }
}*/

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu,
          ),
        ),
        title: GradientText(
          'WOTD',
          style: const TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          ),
          colors: const [
            Color.fromRGBO(0, 255, 56, 1),
            Color.fromRGBO(0, 240, 255, 1)
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
        elevation: 0,
      ),
      body: const Column(
        children: [
          Divider(
            height: 2,
            color: Color.fromRGBO(46, 46, 46, 1),
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("defenestration"),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
    );
  }
}
