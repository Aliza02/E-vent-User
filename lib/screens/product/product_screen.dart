import 'package:eventually_user/constants/constant.dart';
import 'package:eventually_user/screens/home_page/home_page.dart';
import 'package:eventually_user/widget/text_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/order_pic_controller.dart';
import '../../widget/button.dart';
import '../../widget/price_people_text.dart';
import '../../widget/product_categories.dart';
import '../../widget/product_image_view.dart';
import '../../widget/product_title_text.dart';

import 'components/change_people_count_row.dart';
import 'components/duration_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  OrderPicController orderPicController = Get.put(OrderPicController());
  DateTime selectedDate = DateTime.now();
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  final buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Color(constant.red),
    elevation: 8,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 0.50,
        color: Color(constant.red),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsets.zero,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNabBar(),
      appBar: const TextAppBar(title: ''),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .07),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProductImageView(orderPicController: orderPicController),
                SizedBox(height: Get.height * .02),
                const ProductTitleText(),
                SizedBox(height: Get.height * .02),
                const ProductCategories(),
                SizedBox(height: Get.height * .01),
                const PriceAndPeopleText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '50,000 Rs',
                      style: TextStyle(
                        color: Color(0xFF555454),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ChangePeopleCountRow()
                  ],
                ),
                SizedBox(height: Get.height * .01),
                const Row(
                  children: [
                    Text(
                      'Select a date',
                      style: TextStyle(
                        color: Color(0xFF555454),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Row(
                  children: [
                    // Container(
                    //   width: 100,
                    //   height: 40,
                    //   decoration: ShapeDecoration(
                    //     color: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         width: 0.50,
                    //         strokeAlign: BorderSide.strokeAlignCenter,
                    //         color: Color(0xFFCB585A),
                    //       ),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     shadows: [
                    //       BoxShadow(
                    //         color: Color(0x0C1C252C),
                    //         blurRadius: 8,
                    //         offset: Offset(0, 4),
                    //         spreadRadius: 0,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   width: 100,
                    //   height: 40,
                    //   decoration: ShapeDecoration(
                    //     color: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         width: 0.50,
                    //         strokeAlign: BorderSide.strokeAlignCenter,
                    //         color: Color(0xFFCB585A),
                    //       ),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     shadows: [
                    //       BoxShadow(
                    //         color: Color(0x0C1C252C),
                    //         blurRadius: 8,
                    //         offset: Offset(0, 4),
                    //         spreadRadius: 0,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   width: 100,
                    //   height: 40,
                    //   decoration: ShapeDecoration(
                    //     color: Colors.white,
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         width: 0.50,
                    //         strokeAlign: BorderSide.strokeAlignCenter,
                    //         color: Color(0xFFCB585A),
                    //       ),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     shadows: [
                    //       BoxShadow(
                    //         color: Color(0x0C1C252C),
                    //         blurRadius: 8,
                    //         offset: Offset(0, 4),
                    //         spreadRadius: 0,
                    //       )
                    //     ],
                    //   ),
                    // )

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: Get.width * .04),
                        child: ElevatedButton(
                          onPressed: () {
                            _showDatePicker(context, DatePickerMode.day);
                          },
                          style: buttonStyle,
                          child: const Text(
                            'DD',
                            style: TextStyle(
                              color: Color(0x7F555454),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _showMonthPicker(context);
                        },
                        style: buttonStyle,
                        child: const Text(
                          'MM',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0x7F555454),
                            fontSize: 16,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: Get.width * .04),
                        child: ElevatedButton(
                          onPressed: () {
                            _showDatePicker(context, DatePickerMode.year);
                          },
                          style: buttonStyle,
                          child: const Text(
                            'YYYY',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color(0x7F555454),
                              fontSize: 16,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .01),
                const Row(
                  children: [
                    Text(
                      'Select a location',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF555454),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(height: Get.height * .01),
                TextFormField(
                  style: const TextStyle(
                    color: Color(0x7F555454),
                    fontSize: 16,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    hintText: 'Enter the address',
                    hintStyle: const TextStyle(
                      color: Color(0x7F555454),
                      fontSize: 16,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.50,
                        color: Color(0xFF4285F4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0.50,
                        color: Color(0xFF4285F4),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * .01),
                const Row(
                  children: [
                    Text(
                      'Select a Duration',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF555454),
                        fontSize: 14,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(height: Get.height * .01),
                Row(
                  children: [
                    DurationButton(
                      imagePath: 'assets/images/flag.svg',
                      buttonText: 'Start Time',
                    ),
                    SizedBox(width: Get.width * .03),
                    DurationButton(
                      imagePath: 'assets/images/flag-alt.svg',
                      buttonText: 'End Time',
                    ),
                  ],
                ),
                SizedBox(height: Get.height * .005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Button(
                      label: 'Add to Cart',
                      onPressed: () {
                        Get.toNamed('/mycart');
                      },
                    )),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * .02),
                      child: const Text(
                        'Or',
                        style: TextStyle(
                          color: Color(0x7F555454),
                          fontSize: 12,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 38,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF4285F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          shadows: shadowsBelow,
                        ),
                        child: const Center(
                          child: Text(
                            'Chat With Vendor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.18,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(
      BuildContext context, DatePickerMode mode) async {
    DateTime initialDate;
    DateTime firstDate;
    DateTime lastDate;

    Function(DateTime) setSelectedValue;

    if (mode == DatePickerMode.day) {
      initialDate = selectedDate;
      firstDate = DateTime(1900);
      lastDate = DateTime(2100);
      setSelectedValue = (DateTime date) {
        setState(() {
          selectedDate = date;
        });
      };
    } else {
      initialDate = DateTime(selectedYear, selectedMonth);
      firstDate = DateTime(DateTime.now().year, 1);
      lastDate = DateTime(DateTime.now().year, 12);
      setSelectedValue = (DateTime date) {
        setState(() {
          selectedMonth = date.month;
        });
      };
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDatePickerMode: mode,
    );

    if (pickedDate != null) {
      setSelectedValue(pickedDate);
    }
  }

  Future<void> _showMonthPicker(BuildContext context) async {
    final List<String> months =
        DateFormat.MMMM().format(DateTime.now()).split(' ');

    final pickedMonth = await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          child: CupertinoPicker(
            itemExtent: 50,
            onSelectedItemChanged: (int index) {},
            children: months.map((String month) {
              return Center(
                child: Text(
                  month,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

    if (pickedMonth != null) {
      setState(() {
        selectedMonth =
            pickedMonth + 1; // Add 1 to match DateTime month range (1-12)
      });
    }
  }
}
