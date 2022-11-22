import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerTest extends StatefulWidget {
  const TimerTest({Key? key}) : super(key: key);

  @override
  State<TimerTest> createState() => _TimerTestState();
}

class _TimerTestState extends State<TimerTest> {
  late StopWatchTimer stopWatchTimer;

  @override
  void initState() {
    stopWatchTimer = StopWatchTimer();
    stopWatchTimer.setPresetTime(mSec: 1234000);
    print("value:: ${stopWatchTimer.rawTime.value}");
    super.initState();
  }

  @override
  void dispose() async {
    stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<int>(
              stream: stopWatchTimer.rawTime,
              initialData: 1234000,
              builder: (context, snapshot) {
                var value = snapshot.data!;
                print("data:: ${snapshot.data!}");
                final displayTime = StopWatchTimer.getDisplayTime(value, milliSecond: false);
                return Text(
                  displayTime,
                  style: const TextStyle(
                    fontSize: 40,
                    color: MyColors.text,
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
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
            Text("${stopWatchTimer.rawTime.value}"),
          ],
        ),
      ),
    );
  }
}
