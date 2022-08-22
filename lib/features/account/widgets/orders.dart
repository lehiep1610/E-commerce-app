import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
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
      ],
    );
  }
}
