import 'package:draft_home/utils/color_map.dart';
import 'package:draft_home/utils/floating_action.dart';
import 'package:draft_home/utils/font_map.dart';
import 'package:draft_home/utils/pdf_button.dart';
import 'package:draft_home/utils/url_button.dart';
import 'package:draft_home/utils/url_utils.dart';
import 'package:draft_home/widgets/app_bar.dart';
import 'package:draft_home/widgets/common_drawer.dart';
import 'package:draft_home/widgets/email_input.dart';
import 'package:draft_home/widgets/footer.dart';
import 'package:draft_home/widgets/video_player.dart';
import 'package:flutter/material.dart';

class DustyDraftPage extends StatelessWidget {
  const DustyDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    String logoPath = 'assets/dusty/logo_symbol_draft_grey.png';
    Color? appBarBackgroundColor = dustyColorSet['primary'];
    Color appBarIconColor = Colors.white;

    return Scaffold(
      backgroundColor: dustyColorSet['background'],
      drawer: CommonDrawer(pageKey: 'dusty'),
      appBar: CommonAppBar(
        logoPath: logoPath,
        backgroundColor:
            appBarBackgroundColor ?? Color.fromARGB(255, 161, 136, 127),
        iconColor: appBarIconColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            FutureBuilder<void>(
              future: _initializeVideoPlayer(), // 비디오 초기화 작업을 위한 Future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()); // 로딩 표시
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return VideoPlayerWidget(
                  videoUrl: 'assets/videos/7624037-uhd_2160_3840_30fps.mp4',
                  isLooping: true,
                  autoPlay: true,
                );
              },
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    '날려버리고 잃어버리기 전에, 당신의 초안을 현실로.', //컴퓨터 프로그래밍 및 AGI(인공일반지능) 서비스 컨설팅',
                    style: dustyFontSet['heading']!
                        .copyWith(color: dustyColorSet['accent']),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                  //   style: TextStyle(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black),
                  // ),
                  SizedBox(height: 100),
                  Text(
                    '창의력은 기회를 만들어 잡아내는 자의 것입니다. \n 모래처럼 흩어지기 전에, 당신의 아이디어를 현실로 만들어보세요.\n 우리의 도구와 플랫폼이 함께합니다.',
                    style: dustyFontSet['heading']!
                        .copyWith(color: dustyColorSet['accent']),
                    textAlign: TextAlign.center, // 텍스트 중앙 정렬
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: UrlButton(
                label: '웹사이트 바로가기',
                onPressed: () =>
                    launchURL('https://www.dustydraft.com', context),
                colorSet: dustyColorSet,
                fontFamily: 'dustyFont',
                fontSize: FontSizeOptions.medium,
              ),
            ),
            SizedBox(height: 200),
            Image.asset('assets/dusty/logo_dustydraft.png', height: 200),
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '당신의 오래된 초안을 꺼내세요. 지금이 바로 실현할 때입니다!',
                style: dustyFontSet['heading']!
                    .copyWith(color: dustyColorSet['accent']),
                textAlign: TextAlign.center, // 텍스트 중앙 정렬
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: UrlButton(
                label: '소개자료 열어보기',
                onPressed: () => launchURL(
                    'https://github.com/theplaceyoung/draft_co/blob/main/assets/DRAFT_dustydraft_service-description_24.pdf',
                    context),
                colorSet: dustyColorSet,
                fontFamily: 'dustyFont',
                fontSize: FontSizeOptions.medium,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: UrlButton(
                label: '소개자료 다운로드',
                onPressed: () => launchURL(
                    'https://raw.githubusercontent.com/theplaceyoung/draft_home/gh-pages/assets/assets/DRAFT_dustydraft_service-description_24.pdf',
                    context),
                colorSet: dustyColorSet,
                fontFamily: 'dustyFont',
                fontSize: FontSizeOptions.medium,
              ),
            ),
            // padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // child: PdfButton(
            //     label: '소개자료 다운받기',
            //     pdfUrl:
            //         'https://raw.githubusercontent.com/theplaceyoung/draft_home/gh-pages/assets/assets/DRAFT_dustydraft_service-description_24.pdf',
            //     colorSet: dustyColorSet)
            // child: ElevatedButton(
            //   onPressed: () async {
            //     try {
            //       const pdfPath =
            //           'https://raw.githubusercontent.com/theplaceyoung/draft_home/gh-pages/assets/assets/DRAFT_dustydraft_service-description_24.pdf';
            //       await openPDF(pdfPath);
            //     } catch (e) {
            //       _showError(context, 'PDF 열기 실패: $e');
            //     }
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            //     textStyle: TextStyle(fontSize: 18),
            //     backgroundColor: Colors.black,
            //     foregroundColor: Colors.white,
            //   ),
            //   child: Text('소개자료 다운받기'),
            // ),
            SizedBox(height: 100),
            EmailInputWidget(
              colorSet: dustyColorSet,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: FloatingAction(
        imagePath: 'assets/dusty/dusty-agent-white.png', // 다른 이미지 경로
        onPressed: () => launchURL('https://www.dustydraft.chat', context),
        pageKey: 'dusty', // 페이지 키 전달
      ),
    );
  }

  // 비디오 초기화 작업
  Future<void> _initializeVideoPlayer() async {
    // 비디오 초기화 작업 (예: 비디오 로드, 준비 등)
    await Future.delayed(Duration(seconds: 1)); // 더미 대기 시간
  }

  Future<void> _showError(BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
