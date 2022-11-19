import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateMemoryPage extends StatelessWidget {
  const CreateMemoryPage({super.key});

  static const path = '/create-memory';
  static const name = 'CreateMemoryPage';
  static const location = path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Card(
                elevation: 30,
                child: Center(
                  child: IconButton(
                    iconSize: 100,
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ),
            ),
            const Gap(50),
            const Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Memory Title',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
