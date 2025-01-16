import 'package:draft_co/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:draft_co/widgets/footer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/footer.dart';

class TheExoticBoutiquePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(), // 공통 AppBar 사용
      drawer: Drawer(
        // 왼쪽 드로어 설정
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('exotic ordinary'),
              onTap: () async {
                final url =
                    'https://smartstore.naver.com/exoticordinary'; // 외부 링크
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  // 링크를 열 수 없는 경우 처리
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('링크를 열 수 없습니다.'),
                  ));
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('the exotic boutique'),
              onTap: () {
                Navigator.pushNamed(context, '/the-exotic-boutique');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('dusty draft'),
              onTap: () {
                Navigator.pushNamed(context, '/dusty-draft');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_draft_transparentBG2.png', height: 200),
            SizedBox(height: 20),
            Text(
              'Welcome to the Service Page!',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(),
    );
  }
}
