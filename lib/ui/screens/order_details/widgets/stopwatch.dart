import 'dart:developer';

import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:bright_life_providers/utils/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CustomStopwatch extends StatefulWidget {
  final int orderId;
  final String docId;

  const CustomStopwatch({
    Key? key,
    required this.orderId,
    required this.docId,
  }) : super(key: key);

  @override
  State<CustomStopwatch> createState() => _CustomStopwatchState();
}

class _CustomStopwatchState extends State<CustomStopwatch> {
  final stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);
  final orderCollection = FirebaseFirestore.instance.collection('orders');
  int? seconds;
  String? docId;

  @override
  void initState() {
    log('orderId:: ${widget.orderId}');
    stopWatchTimer.secondTime.listen((seconds) {
      log("event:: $seconds");
      kOrderCollection.doc(widget.docId).update({
        'work_time': seconds,
      });
    });
    super.initState();
  }

  @override
  void dispose() async {
    stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      decoration: BoxDecoration(
        color: MyColors.greenFAA.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: 0,
            builder: (context, snapshot) {
              final displayTime = StopWatchTimer.getDisplayTime(snapshot.data!, milliSecond: false);
              return Text(
                displayTime,
                style: const TextStyle(
                  fontSize: 40,
                  color: MyColors.text,
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      stopWatchTimer.onStartTimer();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.greenFAA,
                      ),
                      width: 45,
                      height: 45,
                      child: Center(
                        child: SvgPicture.asset('assets/icons/play.svg'),
                      ),
                    ),
                  ),
                  const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.text,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      stopWatchTimer.onStopTimer();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.greenFAA,
                      ),
                      width: 45,
                      height: 45,
                      child: Center(
                        child: SvgPicture.asset('assets/icons/pause.svg'),
                      ),
                    ),
                  ),
                  const Text(
                    'Pause',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.text,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      stopWatchTimer.onStopTimer();
                      // stopWatchTimer.onResetTimer();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.greenFAA,
                      ),
                      width: 45,
                      height: 45,
                      child: Center(
                        child: SvgPicture.asset('assets/icons/stop.svg'),
                      ),
                    ),
                  ),
                  const Text(
                    'End',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
