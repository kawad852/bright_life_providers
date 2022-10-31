import 'package:bright_life_providers/ui/screens/home/builders/orders_builder.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/home_header.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/orders_filer_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: Column(
            children: [
              const HomeHeader(),
              OrdersFilterWidget(),
              const OrdersBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
