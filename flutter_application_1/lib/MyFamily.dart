import 'main.dart';
import 'package:flutter/material.dart';

class MyFamilyBody extends StatelessWidget {
  const MyFamilyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            SizedBox(
              child: FutureBuilder(
                future: getProfileData(),
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
                            color: Colors.grey.shade200,
                            child: Column(
                              children: [
                                Text(
                                  "${snapshot.data?[index].id! ?? '_'}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(snapshot.data?[index].name! ?? '_'),
                                Text(snapshot.data?[index].username! ?? '_'),
                                Text(snapshot.data?[index].email! ?? '_'),
                                Text(
                                    "${snapshot.data?[index].address!.street ?? '_'}, ${snapshot.data?[index].address!.suite ?? '_'}, ${snapshot.data?[index].address!.city ?? '_'}, ${snapshot.data?[index].address!.zipcode ?? '_'} geo: ${snapshot.data?[index].address!.geo!.lat ?? '_'}, ${snapshot.data?[index].address!.geo!.lng ?? '_'}"),
                                Text(snapshot.data?[index].phone! ?? '_'),
                                Text(snapshot.data?[index].website! ?? '_'),
                                Text(
                                    "${snapshot.data?[index].company!.name ?? '_'}: ${snapshot.data?[index].company!.catchPhrase ?? '_'} (${snapshot.data?[index].company!.bs ?? '_'})"),
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
