import 'dart:ui';

import 'package:kumpulandoa/components/favorite_button.dart';
import 'package:kumpulandoa/detail_page.dart';
import 'package:kumpulandoa/search_screen.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'repository.dart';

// HomePage screen
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FetchDoaList _doaList = FetchDoaList(); //Call Api
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 10.0,
              right: 10.0,
              bottom: 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1000, //10% ratio
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        TextEditingController().clear();
                      },
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search Doa',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              //color: Colors.lightBlueAccent,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onTap: () {
                          showSearch(
                              context: context, delegate: SearchScreen());
                        },
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 6000, //30% ration
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: FutureBuilder<List<KumpulanDoa>>(
                          future: _doaList.getKumpulanDoa(),
                          builder: (context, snapshot) {
                            var dataDoa = snapshot.data;
                            if (!snapshot.hasData) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              );
                            }
                            return ListView.builder(
                                itemCount: dataDoa?.length,
                                itemBuilder: (contex, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 1,
                                      vertical: 0.5,
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 10,
                                      right: 10,
                                      bottom: 0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: ListTile(
                                            leading: Text(
                                              '${dataDoa?[index].id}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            trailing: const FavoriteButton(),
                                            title: Text(
                                              '${dataDoa?[index].doa}',
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            dense: false,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPage(
                                                    doa: dataDoa![index],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey.shade50,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 0.5,
                                                blurRadius: 5,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
