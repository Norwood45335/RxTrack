import 'package:flutter/material.dart';
class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Symptoms, Concerns, Questions..."),
      ),
      body: const AccountInformationForm(),
    );
  }
}

class AccountInformationForm extends StatefulWidget {
  const AccountInformationForm({super.key});

  @override
  State<AccountInformationForm> createState() => _AccountInformationFormState();
}

class _AccountInformationFormState extends State<AccountInformationForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 300,
            child: const TextField(
              minLines: 100,
              maxLines: null, // Allow unlimited number of lines
              textAlignVertical: TextAlignVertical.top, // Align text to the top
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            child: const Text('Submit to Doctor'),
          ),
        ],
      ),
    );
  }
}