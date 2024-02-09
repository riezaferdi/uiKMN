import 'main.dart';
import 'package:flutter/material.dart';
import './api/MyFamily_service.dart';

class MyFamilyBody extends StatefulWidget {
  const MyFamilyBody({super.key});

  @override
  State<MyFamilyBody> createState() => _MyFamilyBodyState();
}

class _MyFamilyBodyState extends State<MyFamilyBody> {
  ScrollController _scrollController = ScrollController();
  int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        pageNumber++;
        //print(pageNumber);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                future: getFamilyData(pageNumber),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print(snapshot.data?.length);
                    return ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            color: Colors.grey,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    //"${snapshot.data?[index]!.data?[index].firstName ?? '_'} ${snapshot.data?[index]!.data?[index].lastName ?? '_'}",
                                    "${snapshot.data?[index].firstName ?? '_'} ${snapshot.data?[index].lastName ?? '_'}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                  ),
                                  subtitle: Text(
                                    //"Source: ${snapshot.data?[index]!.data?[index].email ?? '_'}",
                                    "Source: ${snapshot.data?[index].email ?? '_'}",
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
                                          // snapshot.data?[index]!.data?[index].avatar ??
                                          //     '_',
                                          snapshot.data?[index].avatar ?? '_',
                                        ),
                                      ),
                                    ),
                                  ),
                                  trailing: Text(
                                    //"${snapshot.data?[index]!.data?[index].id ?? '_'}",
                                    "${snapshot.data?[index].id ?? '_'}",
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
