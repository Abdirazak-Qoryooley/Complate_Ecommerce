import 'package:flutter/material.dart';
import 'package:complete_ecommerce/src/constants.dart';

class banner_card extends StatelessWidget {
  const banner_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apple Store',
                    style: theme.kBigtitle,
                  ),
                  Text(
                    'Find the Apple product and accessories you’re looking for',
                    style: theme.kbodytext.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Shop new Year')
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 20),
            child: Image.asset(
              'image/banner.jpg',
              width: 125,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }
}
