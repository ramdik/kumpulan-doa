import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'App Name: Kumpulan Doa',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Development By: Ramadhika Rizky P',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Flutter Version: 3.0.5',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Dependencies Use:',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '- http 0.13.4',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Text(
                  '- Webview Flutter 3.0.4',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Text(
                  '- animated_splash_screen: 1.3.0',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Public API: kumpulan doa sehari-hari',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Thanks to: \n - Dicoding \n - Emak bapak \n - Ayang Ayin \n - google',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          )
        ],
      ),
    );
  }
}
