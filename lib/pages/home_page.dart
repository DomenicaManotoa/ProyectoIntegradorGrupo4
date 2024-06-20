// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lbp/pages/about_us.dart';
import 'package:lbp/pages/catalogo_page.dart';
import 'package:lbp/pages/user.dart';
import 'package:lbp/services/auth/auth_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> images = [
    '/images/image1.jpg',
    '/images/image2.jpg',
    '/images/image3.jpg',
    '/images/image4.jpg',
    '/images/image5.jpg',
    '/images/image6.jpg',
    '/images/image7.jpg',
    '/images/image8.jpg',
  ];

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  void navigateToAboutUsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AboutUsPage(),
      ),
    );
  }

  void navigateToProfileUserPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserProfilePage(),
      ),
    );
  }
  void navigateToCatalogePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Catalogo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 99),
      appBar: AppBar(
        title: Text('Inicio'),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
            accountName: Text(_auth.currentUser?.displayName ?? 'User'),
            accountEmail: Text(_auth.currentUser?.email ?? 'Email'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 240, 240, 99),
              child: Text(
                _auth.currentUser?.displayName?.substring(0, 1) ?? 'U',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Acerca de nosotros'),
              onTap: () {
                Navigator.pop(context);
                navigateToAboutUsPage();
              },
            ),
            
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mi cuenta'),
              onTap: () {
                Navigator.pop(context);
                navigateToProfileUserPage();
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Productos'),
              onTap: () {
                Navigator.pop(context);
                navigateToCatalogePage();
              },
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Little Big Pet',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: images.map((String imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 300.0,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Nuestras mascotas son lo más importante en nuestras vidas, aquí encontrarás los mejores productos para ellas',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


