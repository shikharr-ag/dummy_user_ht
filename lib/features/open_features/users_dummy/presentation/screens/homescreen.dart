import 'package:flutter/material.dart';
import 'package:h_tick_test/features/open_features/users_dummy/presentation/notifiers/ui_notifiers/users_dummy_notifier/users_dummy_notifier.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_dummy_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget buildTextfield(String val, String label) {
    return SizedBox(
      height: 100,
      width: 200,
      child: TextField(
        readOnly: true,
        controller: TextEditingController(text: val),
        decoration:
            InputDecoration(label: Text(label), border: OutlineInputBorder()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Dummy User'),
      ),
      body: Center(
        child: Consumer<UsersDummyNotifiers>(builder: (context, prov, _) {
          UserDummyModel? model = prov.model;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Press on the button to get User Data',
              ),
              if (model == null)
                Text(
                  'No User Data :(',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              if (model != null) ...[
                buildTextfield(model.name, 'Name'),
                buildTextfield(model.age.toString(), 'Age'),
                buildTextfield(model.diseases.toString(), 'Diseases'),
              ],
              ElevatedButton.icon(
                  onPressed: () {
                    prov.getUserDummyData();
                  },
                  icon: Icon(Icons.verified_user),
                  label: Text('Get User')),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
