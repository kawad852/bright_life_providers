import 'package:bright_life_providers/ui/screens/home/builders/orders_builder.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/home_header.dart';
import 'package:bright_life_providers/ui/screens/home/widgets/orders_filer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DateTime now = DateTime.now();
          var timer = Timestamp.fromDate(DateTime(now.year, now.month, now.day));
          DateTime start = DateTime(now.year, now.month - 3, now.day);
          DateTime end = DateTime(now.year, now.month, now.day, 1000, 10000, 1000);
          print("time:: $start");
          var myDoc = await FirebaseFirestore.instance.collection('orders').where('created_at', isGreaterThanOrEqualTo: start).get();
          print("Test:: ${myDoc.docs.length}");
        },
      ),
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
