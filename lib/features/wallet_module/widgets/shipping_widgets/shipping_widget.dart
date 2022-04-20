import 'package:advertisers/features/wallet_module/controllers/charge_controller.dart';
import 'package:advertisers/features/wallet_module/request/charge_request.dart';
import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/points_widget_chart.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ShippingWidget extends GetWidget<ChargeController> {
  ShippingWidget({Key? key}) : super(key: key);

  final _chargeController = Get.put(ChargeController());
  final WalletController _walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List<PointsItem>? pointsItems = [
          if(_walletController.userData!.role == "advertiser")  PointsItem(
              title: "رصيد معلق", name: "ريال", value: state?.data?.pending),
          if(_walletController.userData!.role == "advertiser")   PointsItem(
              title: "ر.قابل للسحب", name: "ريال", value: state?.data?.ready),
          PointsItem(
              title: "رصيد المحفظة", name: "ريال", value: state?.data?.wallet),
        ];
        return ListView(
          children: [
            SizedBox(
              height: 125.h,
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: pointsItems.length,
                      itemBuilder: (context, index) {
                        return PointsChartWidget(
                            value: "${pointsItems[index].value}",
                            name: "${pointsItems[index].name}",
                            title: "${pointsItems[index].title}",
                          isExtended: _walletController.userData!.role == "advertiser" ? false:true,
                        );
                      }),
                ),
              ),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    GetBuilder<ChargeController>(
                      id: 'ChargeCard',
                      init: ChargeController(),
                      builder: (chargeController) => ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          // scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: state?.data?.cards?.length ?? 0,
                          itemBuilder: (context, index) {
                            return state?.data?.cards?[index].status == true ? InkWell(
                                onTap: () {
                                  if (chargeController.paymentId !=
                                      state?.data?.cards?[index].id) {
                                    chargeController.passPaymentIndex(
                                        state?.data?.cards?[index].id);
                                  } else {
                                    chargeController.passPaymentIndex(-1);
                                  }

                                  // debugPrint("${walletController.tabId}");
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      chargeController.paymentId ==
                                              state?.data?.cards?[index].id
                                          ? selectedBigRadio()
                                          : unSelectedBigRadio(),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 70,
                                        child: state?.data?.cards?[index].type != "mastercard" ? Image.asset(
                                          state?.data?.cards?[index].type ==
                                              'visa'
                                              ? "images/visa.png"
                                              : state?.data?.cards?[index].type ==
                                              'mada'
                                              ? "images/mada.png"
                                              : state?.data?.cards?[index]
                                              .type ==
                                              'stc'
                                              ? "images/stc.png"
                                              : state?.data?.cards?[index]
                                              .type ==
                                              'apple_pay'
                                              ? "images/apple.png"
                                              : state
                                              ?.data
                                              ?.cards?[
                                          index]
                                              .type ==
                                              'bian'
                                              ? "images/bian.png"
                                              : '',
                                          // height: 21,
                                          // width: 40,
                                        ):SvgPicture.asset(
                                          'images/Mastercard.svg',
                                          // width: 45.0,
                                          // height: 45.0,
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      if(state?.data?.cards?[index].type == "apple_pay") Spacer(),
                                      if(state?.data?.cards?[index].type != "apple_pay")    if(state?.data?.cards?[index].type == "bian" || state?.data?.cards?[index].type == "stc") Expanded(child: Text("${state?.data?.cards?[index].info!.mobile}",style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                                   if(state?.data?.cards?[index].type != "apple_pay")   if(state?.data?.cards?[index].type != "bian" && state?.data?.cards?[index].type != "stc")  Expanded(child: Text("${state?.data?.cards?[index].info!.cardNumberFour}",style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                                      // state?.data?.cards?[index].status == true ?  FaIcon(FontAwesomeIcons.checkDouble,color: const Color(0xff129835),size: 17.sp,):const FaIcon(FontAwesomeIcons.stop,
                                      //   color:  Color(0xffffad00),)
                                    ],
                                  ),
                                )):Container();
                          }),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                    child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          "أدخل مبلغ الشحن",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xff486ac7)),
                                        ))),
                                const SizedBox(
                                  width: 25,
                                ),
                                Image.asset(
                                  "images/income@3x.png",
                                  width: 40,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 3),
                                          child: TextFormField(
                                            controller: controller.amountController,
                                            cursorColor: Colors.black,
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                hintText: '0.0',
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                hintStyle: TextStyle(
                                                    fontSize: 21,
                                                    color: Color(0XffC8714B))),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Text(
                                        "ريال",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff486ac7)),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    // margin: const EdgeInsets.symmetric(horizontal: 5),
                                    width: 105.w,
                                    // height: 75.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xff6fd3de),
                                              Color(0xff486ac7),
                                            ]),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[300]!,
                                            blurRadius: 20.0,
                                            spreadRadius: 1.0,
                                          )
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        Image.asset(
                                          "images/making-money@3x.png",
                                          width: 50,
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        const Text("اشحن",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white)),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    if (controller.amountController.text.isNotEmpty &&
                                        _chargeController.paymentId != -1) {
                                      controller.chargeWallet(
                                          request: ChargeRequest(
                                              cardId:
                                                  _chargeController.paymentId,
                                              total: controller.amountController.text));
                                    } else {
                                      Get.snackbar(
                                        "مطلوب",
                                        controller.amountController.text.isEmpty &&
                                                _chargeController.paymentId ==
                                                    -1
                                            ? 'اختر طريقة الدفع\nادخل مبلغ الشحن'
                                            : controller.amountController.text.isEmpty
                                                ? "ادخل مبلغ الشحن"
                                                : 'اختر طريقة الدفع',
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    child: const Center(
                                      child: Text(
                                        "تأكيد",
                                        style: TextStyle(
                                            color: Color(0xff4391D4),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xffE8E8E8),
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    _chargeController.passPaymentIndex(-1);
                                    controller.amountController.clear();
                                  },
                                  child: Container(
                                    height: 40,
                                    child: const Center(
                                      child: Text(
                                        "رجوع",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xff4391D4),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            const SizedBox(
                              height: 45,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class Payments {
  int? id;
  String? img, number, name;
  Payments({this.id, this.img, this.number, this.name});
}

List<Payments> payments = [
  Payments(
      id: 0,
      name: "Master Card",
      img: "images/Mastercard.svg",
      number: "**** **** **** 078"),
  Payments(
      id: 1,
      name: "Master Card",
      img: "images/Mastercard.svg",
      number: "**** **** **** 078"),
  Payments(
      id: 2,
      name: "Visa",
      img: "images/Visa.svg",
      number: "**** **** **** 078"),
];
