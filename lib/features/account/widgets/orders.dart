import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:e_commerce_app/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://i.ibb.co/PccVw0r/iphone-13-pro-max-sierra-blue-600x600.jpg',
    'https://i.ibb.co/XpPWFs8/oppo-reno7-5g-den-thumb-1-600x600.jpg',
    'https://i.ibb.co/6vw1Z36/oppo-reno8z-5g-den-thumb-600x600.jpg',
    'https://i.ibb.co/NYXQS6k/samsung-galaxy-a33-5g-xanh-thumb-600x600.jpg',
    'https://i.ibb.co/yB8gR68/samsung-galaxy-z-fold4-120822-014401-600x600.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      GlobalVariables.selectedNavBarColor),
                ),
                onPressed: () {},
                child: const Text('See all'),
              ),
            ),
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SingleProduct(image: list[index]);
            },
          ),
        )
      ],
    );
  }
}
