import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeOne extends StatelessWidget {
  const WelcomeOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/welcome0.svg',
            height: 350,
          ),
          const SizedBox(height: 100),
          const Text(
            'CEBİNDEKİ İNDİRİM REHBERİ',
          ),
          const SizedBox(height: 30),
          const Text(
            'Gittiğin yerleri uygulamada bul, her an indirimlerden faydalan!',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
