import 'package:bright_life_providers/ui/widgets/failed_widget.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTimeBox extends StatelessWidget {
  final String docId;

  const OrderTimeBox({Key? key, required this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      decoration: BoxDecoration(
        color: MyColors.greenFAA.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: FutureBuilder<DocumentSnapshot>(
        future: kOrderCollection.doc(docId).get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
            default:
              if (snapshot.hasData) {
                final data = snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                  '${(data['work_time'] / 60).toStringAsFixed(2)} ${'min'.tr}',
                  style: const TextStyle(
                    fontSize: 40,
                    color: MyColors.text,
                  ),
                );
              } else {
                return const FailedWidget();
              }
          }
        },
      ),
    );
  }
}
