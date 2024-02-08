import 'main.dart';
import 'package:flutter/material.dart';
import './api/MyFamily_service.dart';

class MyFamilyBody extends StatelessWidget {
  const MyFamilyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            SizedBox(
              child: FutureBuilder(
                future: getFamilyData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print(snapshot.data?.length);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            color: Colors.grey,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    "${snapshot.data?[index].data!.firstName ?? '_'} ${snapshot.data?[index].data!.lastName ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                  ),
                                  subtitle: Text(
                                    "Source: ${snapshot.data?[index].data!.email ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  leading: Container(
                                    width: 70,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          snapshot.data?[index].data!.avatar ??
                                              '_',
                                        ),
                                      ),
                                    ),
                                  ),
                                  trailing: Text(
                                    "${snapshot.data?[index].data!.id ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
