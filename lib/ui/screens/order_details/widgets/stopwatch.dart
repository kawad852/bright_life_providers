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
  final int initialTime;

  const CustomStopwatch({
    Key? key,
    required this.orderId,
    required this.docId,
    required this.initialTime,
  }) : super(key: key);

  @override
  State<CustomStopwatch> createState() => _CustomStopwatchState();
}

class _CustomStopwatchState extends State<CustomStopwatch> {
  late StopWatchTimer stopWatchTimer;
  final orderCollection = FirebaseFirestore.instance.collection('orders');
  String? docId;

  @override
  void initState() {
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
      presetMillisecond: widget.initialTime,
    );
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
          //TODO: fix start time
          StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: widget.initialTime,
            builder: (context, snapshot) {
              if (snapshot.data == 0.0) {
                return Text(
                  widget.initialTime.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: MyColors.text,
                  ),
                );
              } else {
                final displayTime = StopWatchTimer.getDisplayTime(snapshot.data!, milliSecond: false);
                return Text(
                  displayTime,
                  style: const TextStyle(
                    fontSize: 40,
                    color: MyColors.text,
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              // Column(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         stopWatchTimer.onStopTimer();
              //         // stopWatchTimer.onResetTimer();
              //       },
              //       child: Container(
              //         decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: MyColors.greenFAA,
              //         ),
              //         width: 45,
              //         height: 45,
              //         child: Center(
              //           child: SvgPicture.asset('assets/icons/stop.svg'),
              //         ),
              //       ),
              //     ),
              //     const Text(
              //       'End',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: MyColors.text,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
