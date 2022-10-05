import 'dart:ui';

import 'package:flutter/material.dart';
import 'model.dart';
import 'components/img_random.dart';

class DetailPage extends StatelessWidget {
  final KumpulanDoa doa;
  const DetailPage({Key? key, required this.doa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ImgRand.randomPictureUrl()),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 7,
                    sigmaX: 7,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 400,
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            '${doa.doa}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Flexible(
                          child: Text(
                            '${doa.ayat}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ), //ayat
                        const SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          child: Text(
                            '${doa.latin}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Flexible(
                          child: Text(
                            'Artinya: ${doa.artinya}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
