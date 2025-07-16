import 'package:flutter/material.dart';
import 'package:national_identic/nationality_future_nandler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController _controller;
  String name = '';

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(
      context,
    ); // тут операнда с размером экрана
    return PopScope(
      canPop: false,
      child: MaterialApp(
        title: 'National Identic',
        home: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            leading: const DrawerButton(),
            title: const Text('National identic!'),
          ),
          body: Container(
            padding: EdgeInsets.all(queryData.size.width * 0.05),
            child: Column(
              children: <Widget>[
                SizedBox(height: queryData.size.width * 0.005),
                TextField(
                  controller: _controller,
                  onSubmitted: (final String inputName) {
                    setState(() {
                      name = inputName;
                    });
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                NatOutput(firstName: name),
              ],
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                const Text(
                  'You can type interesting name on any language,'
                  ' BUT working more stable this version of program with English Language. In future here may be settings and auto-translation, but not now',
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: const Text('Settings'),
                ),
                const Spacer(),
                const Text(
                  'All percents is only probability of naming people in some countries',
                ),
                Container(height: 10),
                const Text(
                  'this app developed not for a sale, here used free API of side developers',
                  style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
