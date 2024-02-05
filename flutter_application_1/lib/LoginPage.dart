import 'package:flutter/material.dart';
import 'EmailLogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const AlbumBody(),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          alignment: Alignment.center,
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: 'Belum punya akun? '),
                TextSpan(
                  text: 'Daftar Sekarang',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlbumBody extends StatelessWidget {
  const AlbumBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 350),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          width: 40,
                          color: Colors.white,
                          padding: const EdgeInsets.all(8),
                          child: const Column(
                            children: [
                              Icon(Icons.close_rounded, color: Colors.blue),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // if (snapshot.hasData) {
                  //   albumProviders.selectAlbum(
                  //     snapshot.data![index],
                  //   );
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 530,
                    left: 35,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 350,
                      height: 40,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Login dengan Email",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
