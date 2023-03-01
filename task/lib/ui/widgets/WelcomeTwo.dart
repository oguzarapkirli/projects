import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/welcome1.svg',
            height: 350,
          ),
          const SizedBox(height: 100),
          const Text(
            'QUPO’LARI TOPLA!',
          ),
          const SizedBox(height: 30),
          const Text(
            'Topladığın Qupo’larla kampanyalardan faydalan,fırsatları kaçırma!',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
