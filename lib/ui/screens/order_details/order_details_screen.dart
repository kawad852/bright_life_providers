import 'package:bright_life_providers/controllers/home/view_order_ctrl.dart';
import 'package:bright_life_providers/models/orders/view_order_model.dart';
import 'package:bright_life_providers/ui/screens/order_details/widgets/order_item.dart';
import 'package:bright_life_providers/ui/screens/order_details/widgets/price_item.dart';
import 'package:bright_life_providers/ui/screens/order_details/widgets/stopwatch.dart';
import 'package:bright_life_providers/ui/widgets/base_app_bar.dart';
import 'package:bright_life_providers/ui/widgets/custom_network_image.dart';
import 'package:bright_life_providers/ui/widgets/failed_widget.dart';
import 'package:bright_life_providers/utils/base/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int id;
  const OrderDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String? statusDDV;
  List<String> status = [
    'Pending',
    'In Progress',
    'Completed',
    'Cancelled',
    'On Delivery',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '#${widget.id}',
      ),
      body: FutureBuilder<ViewOrderModel?>(
          future: ViewOrderCtrl.find.initialize,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
              default:
                if (snapshot.hasData) {
                  return ListView(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 30),
                    children: [
                      const Text(
                        'Client Information',
                        style: TextStyle(
                          color: MyColors.green9AD,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomNetworkImage(
                            url: '${snapshot.data!.order!.user!.image}',
                            border: 10,
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data!.order!.user!.name} ${snapshot.data!.order!.user!.lastName}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: MyColors.text,
                                ),
                              ),
                              Text(
                                '${snapshot.data!.order!.user!.phone}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: MyColors.text,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/location.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Delivery Address',
                                style: TextStyle(
                                  color: MyColors.text,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${snapshot.data!.order!.user!.address!.city} , ${snapshot.data!.order!.user!.address!.region}',
                                style: const TextStyle(
                                  color: MyColors.grey070,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${snapshot.data!.order!.user!.address!.street} , ${snapshot.data!.order!.user!.address!.apartmentNumber} , ${snapshot.data!.order!.user!.address!.floorNumber}',
                                style: const TextStyle(
                                  color: MyColors.grey070,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      const Text(
                        'Order Details',
                        style: TextStyle(
                          color: MyColors.green9AD,
                          fontSize: 16,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: snapshot.data!.order!.products!.length,
                        itemBuilder: (context, index) {
                          return OrderItemTile(
                            count: snapshot.data!.order!.products![index].quantity ?? 0,
                            title: '${snapshot.data!.order!.products![index].productName}',
                            price: '${snapshot.data!.order!.products![index].price}',
                          );
                        },
                      ),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      PriceItemTile(title: 'Total', price: '${snapshot.data!.order!.total}'),
                      PriceItemTile(title: 'Tax', price: '${snapshot.data!.order!.tax}'),
                      PriceItemTile(title: 'delivery fee', price: '${snapshot.data!.order!.deliveryFee}'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Payment method',
                              style: TextStyle(
                                fontSize: 14,
                                color: MyColors.text,
                              ),
                            ),
                            Text(
                              '${snapshot.data!.order!.paymentMethod}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: MyColors.text,
                              ),
                            )
                          ],
                        ),
                      ),
                      PriceItemTile(title: 'Discount', price: '${snapshot.data!.order!.discount}'),
                      PriceItemTile(title: 'Bright Life Percentage', price: '${snapshot.data!.order!.percentage}'),
                      PriceItemTile(title: 'order value', price: '${snapshot.data!.order!.orderValue}'),
                      const Divider(
                        height: 25,
                        thickness: 1,
                      ),
                      const Text(
                        'Order Status',
                        style: TextStyle(
                          color: MyColors.green9AD,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          value: statusDDV,
                          hint: const Center(
                            child: Text(
                              'Order Status',
                              style: TextStyle(color: Colors.black, fontFamily: 'Montserrat', fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                          items: status
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Center(child: Text(e)),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              statusDDV = value;
                            });
                          },
                          buttonDecoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: MyColors.greenFAA.withOpacity(0.4),
                          ),
                          buttonWidth: Get.width,
                          buttonHeight: 50,
                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                          isExpanded: true,
                          icon: const RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 15,
                            ),
                          ),
                          style: const TextStyle(
                            color: MyColors.textBlack,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const CustomStopwatch(),
                      SizedBox(
                        width: double.infinity,
                        height: 66,
                        child: FloatingActionButton.extended(
                          backgroundColor: MyColors.primary.withOpacity(0.5),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {},
                          label: const Text(
                            'SAVE',
                            style: TextStyle(fontSize: 22, color: MyColors.text),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const FailedWidget();
                }
            }
          }),
    );
  }
}
