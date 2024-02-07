import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'MyFamily.dart';

const List<String> list = <String>[
  'EN',
  'ID',
];

const List<Widget> _post = <Widget>[
  BodyApp(),
  //ActivityBody(),
  MyFamilyBody(),
  //ProfileBody(),
];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: BodyApp(),
        floatingActionButton: CallCenter(),
        bottomNavigationBar: BottomBar(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.blue),
      //elevation: 16,
      style: const TextStyle(color: Colors.blue),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class BodyApp extends StatelessWidget {
  const BodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.7,
            1,
          ],
          colors: [
            Colors.white,
            Colors.blue.shade200,
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
          top: 40,
          left: 25,
        ),
        child: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: TopBar(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: OurServices(),
              ),
              PromoBanner(),
              TestiBanner(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.values[3],
      children: [
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
                builder: (context) => const LoginPage(),
              ),
            );
          },
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
        const Row(
          children: [
            Icon(
              Icons.notifications_none,
              color: Colors.blue,
            ),
            SizedBox(
              width: 20,
            ),
            DropdownButtonExample(),
          ],
        ),
      ],
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.blue,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Activity',
          icon: Icon(Icons.dashboard_customize),
        ),
        BottomNavigationBarItem(
          label: 'My Family',
          icon: Icon(Icons.family_restroom),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Our Services',
              style: TextStyle(
                height: 3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        GridView(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0,
          ),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/logo/appointment-book.png',
                          height: 55,
                          width: 55,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Appointment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      bottom: -3,
                      child: Image.asset(
                        'assets/logo/doctor.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Our Doctors",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      bottom: -3,
                      child: Image.asset(
                        'assets/logo/treatments.png',
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Treatments",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CallCenter extends StatelessWidget {
  const CallCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.blue,
      tooltip: 'Call Center',
      onPressed: () => {},
      child: const Icon(
        Icons.chat_bubble_rounded,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Promotion',
              style: TextStyle(
                height: 3,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/promotion/Banner-SWA-website-KMN.jpg',
                  fit: BoxFit.cover,
                  width: 350,
                  //height: 100,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/promotion/BAO-Image.jpg',
                  fit: BoxFit.cover,
                  width: 350,
                  //height: 100,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/promotion/HomePage-LASIK-Promo-Jan24.jpg',
                  fit: BoxFit.cover,
                  width: 350,
                  //height: 100,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class TestiBanner extends StatelessWidget {
  const TestiBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.values[3],
            children: const <Widget>[
              Text(
                'Testimonals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.blue,
                      //height: 3,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 250,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 220,
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/testimonials/3-ZDQ-RWzyo.png'),
                      const Text(
                        "Ingrid Wijanarko",
                        style: TextStyle(
                          height: 2,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit!\"",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 220,
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/testimonials/s8PWaSMOdew.png'),
                      const Text(
                        "Rio Matret",
                        style: TextStyle(
                          height: 2,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit!\"",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  width: 220,
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/testimonials/w0Y8XmFKZtw.png'),
                      const Text(
                        "Edho Zell & Mami El",
                        style: TextStyle(
                          height: 2,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit!\"",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
