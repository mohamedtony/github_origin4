import 'package:advertisers/features/wallet_module/controllers/withdraw_controller.dart';
import 'package:advertisers/features/wallet_module/request/charge_request.dart';
import 'package:advertisers/features/wallet_module/wallet_controller.dart';
import 'package:advertisers/features/wallet_module/widgets/points_widget_chart.dart';
import 'package:advertisers/shared/radio_buttons/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PullsWidget extends GetWidget<WithdrawController> {
  PullsWidget({Key? key}) : super(key: key);

  final _withdrawController = Get.put(WithdrawController());
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      List<PointsItem>? pointsItems = [
        PointsItem(
            title: "رصيد معلق", name: "ريال", value: state?.data?.pending),
        PointsItem(
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
                          title: "${pointsItems[index].title}");
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
                  GetBuilder<WithdrawController>(
                    id: 'WithdrawCard',
                    init: WithdrawController(),
                    builder: (withdrawController) => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state?.data?.cards?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                if (withdrawController.paymentId !=
                                    state?.data?.cards?[index].id) {
                                  withdrawController.passPaymentIndex(
                                      state?.data?.cards?[index].id);
                                } else {
                                  withdrawController.passPaymentIndex(-1);
                                }
                                // print("${controller.tabId}");
                              },
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    withdrawController.paymentId ==
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

                                    if(state?.data?.cards?[index].type != "apple_pay")     if(state?.data?.cards?[index].type == "bian" || state?.data?.cards?[index].type == "stc") Expanded(child: Text("${state?.data?.cards?[index].info!.mobile}",style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                                    if(state?.data?.cards?[index].type != "apple_pay")    if(state?.data?.cards?[index].type != "bian" && state?.data?.cards?[index].type != "stc")  Expanded(child: Text("${state?.data?.cards?[index].info!.cardNumberFour}",style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                                    state?.data?.cards?[index].status == true ?  FaIcon(FontAwesomeIcons.checkDouble,color: const Color(0xff129835),size: 17.sp,):const FaIcon(FontAwesomeIcons.stop,
                                      color:  Color(0xffffad00),)
                                  ],
                                ),
                              ));
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
                                        "أدخل المبلغ الذي تطلب سحبه",
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          controller: amountController,
                                          cursorColor: Colors.black,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText: '0.0',
                                              contentPadding: EdgeInsets.all(0),
                                              hintStyle: TextStyle(
                                                  fontSize: 21,
                                                  color: Color(0XffC8714B))),
                                        ),
                                        // Text(
                                        //   '0.0',
                                        //   style: TextStyle(fontSize: 24,color: Color(0XffC8714B)),
                                        //   textScaleFactor: 1.2,
                                        // ),
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
                                      const Text("اسحب",
                                          style: TextStyle(
                                              fontSize: 18,
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
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  state?.data?.pendingWithdrawRequest?.length ??
                                      0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 8),
                                        height: 12,
                                        width: 12,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    100.0) //                 <--- border radius here
                                                ),
                                            color: Color(0xff636363)),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                          child: Text(
                                        "لديك طلب سحب قيد المعالجة رقم ${state?.data?.pendingWithdrawRequest?[index].billingCardId} بقيمة ${state?.data?.pendingWithdrawRequest?[index].total} ريال",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xff636363),
                                            height: 1.6),
                                      ))
                                    ],
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  if (amountController.text.isNotEmpty &&
                                      _withdrawController.paymentId != -1) {
                                    controller.withdraw(
                                        request: ChargeRequest(
                                            cardId:
                                                _withdrawController.paymentId,
                                            total: amountController.text));
                                  } else {
                                    Get.snackbar(
                                      "مطلوب",
                                      amountController.text.isEmpty &&
                                              _withdrawController.paymentId ==
                                                  -1
                                          ? 'اختر طريقة الدفع\nادخل المبلغ الذي تطلب سحبه'
                                          : amountController.text.isEmpty
                                              ? "ادخل المبلغ الذي تطلب سحبه"
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
                                  _withdrawController.passPaymentIndex(-1);
                                  amountController.clear();
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
    });
  }
}

class Payments {
  int? id;
  String? img, number, name;
  Payments({this.id, this.img, this.number, this.name});
}

// List<Payments> payments = [
//   Payments(
//       id: 1,
//       name: "Master Card",
//       img: "images/Mastercard.svg",
//       number: "**** **** **** 078"),
//   Payments(
//       id: 2,
//       name: "Visa",
//       img: "images/Visa.svg",
//       number: "**** **** **** 078"),
// ];

class PullsPointsItem {
  int? id;
  String? desc;
  PullsPointsItem({this.id, this.desc});
}

// List<PullsPointsItem> items = [
//   PullsPointsItem(
//       id: 0, desc: "لديك طلب سحب قيد المعالجة رقم 5321 بقيمة 15000 ريال"),
//   PullsPointsItem(
//       id: 1, desc: "لديك طلب سحب قيد المعالجة رقم 5321 بقيمة 15000 ريال"),
// ];
