
import 'package:bright_life_providers/ui/widgets/blur_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../controllers/pages/pages_ctrl.dart';
import '../../../models/pages/page_model.dart';
import '../../../utils/base/colors.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/failed_widget.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    Get.put(PagesCtrl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlurImage(),
          FutureBuilder<PageModel?>(
            future: PagesCtrl.find.fetchPage(slug: 'privacy-policy'),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 20,
                            ),
                            CustomBackButton(),
                            Spacer(),
                          ],
                        ),
                        const Spacer(),
                        const Center(
                          child: CircularProgressIndicator(
                            color: MyColors.primary,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 120),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomBackButton(),
                                  Text(
                                    snapshot.data!.data.title,
                                    style: const TextStyle(
                                        fontSize: 28,
                                        color: MyColors.primary,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 20,horizontal: 20.0),
                              child: Html(data: snapshot.data!.data.content),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return SafeArea(
                      bottom: false,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 20,
                              ),
                              CustomBackButton(),
                              Spacer(),
                            ],
                          ),
                          const Spacer(),
                          const FailedWidget(),
                          const Spacer(),
                        ],
                      ),
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
