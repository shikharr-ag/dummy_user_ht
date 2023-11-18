import 'package:flutter/material.dart';
import 'package:h_tick_test/features/open_features/users_dummy/presentation/notifiers/ui_notifiers/users_dummy_notifier/users_dummy_notifier.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_dummy_model.dart';
import '../../domain/entities/user_dummy.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          UserDummy? model = prov.model;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Press on the button to get User Data',
              ),
              const SizedBox(
                height: 10,
              ),
              if (prov.state == MyState.error) Text(prov.errMsg),
              if (prov.state == MyState.loading) CircularProgressIndicator(),
              if (prov.state == MyState.initial) Text('No Data.'),
              if (model != null) ...[
                buildTextfield(model.name, 'Name'),
                buildTextfield(model.age.toString(), 'Age'),
                buildTextfield(model.diseases.toString(), 'Diseases'),
              ],
              const SizedBox(
                height: 10,
              ),
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
    );
  }
}
