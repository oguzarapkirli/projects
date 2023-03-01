import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeThree extends StatelessWidget {
  const WelcomeThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/welcome2.svg',
            height: 350,
          ),
          const SizedBox(height: 100),
          const Text(
            'ZAMANINIZ BİZİM İÇİN DEĞERLİ',
          ),
          const SizedBox(height: 30),
          const Text(
            'Alışverişleriniz için siparişlerinizi önceden hazırlatın,size sadece gelip almak kalsın!.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
