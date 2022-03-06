import 'package:flutix/controllers/select_seat_page_controller.dart';
import 'package:flutix/model/movie.dart';
import 'package:flutix/model/seat_row.dart';
import 'package:flutix/screens/widgets/button_next.dart';
import 'package:flutix/screens/widgets/textbox_widget.dart';
import 'package:flutix/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectSeatPage extends StatelessWidget {
  const SelectSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SelectSeatPageController>();

    List<int> seatList = [
      3,
      5,
      5,
      5,
      5,
    ];
    var phoneWidth = MediaQuery.of(context).size.width;
    var phoneHeight = MediaQuery.of(context).size.height;
    Movie movie = Get.arguments['movie'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 56,
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                movie.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: largeText.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage('assets/movies/' + movie.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: phoneWidth - 2 * 40,
                height: 84,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/screen.png'),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: dummySeats.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummySeats[index].seats.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, i) {
                          var seat = dummySeats[index].seats[i];
                          return Container(
                            margin: EdgeInsets.only(
                              right: i == dummySeats[index].seats.length - 1
                                  ? 0
                                  : 16,
                              bottom: 16,
                            ),
                            child: Obx(
                              () => GestureDetector(
                                onTap: () => controller.addSelectedSeats(seat),
                                child: TextBoxWidget(
                                  width: 45,
                                  height: 50,
                                  color: controller.selectedSeats.contains(seat)
                                      ? yellowColor
                                      : Colors.transparent,
                                  text: seat,
                                  isCurrency: true,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: lightGreyColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Available',
                    style: greySmallText.copyWith(fontSize: 10),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: lightGreyColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Booked',
                    style: greySmallText.copyWith(fontSize: 10),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Selected',
                    style: greySmallText.copyWith(fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                () => InkWell(
                  onTap: () => Get.toNamed('/checkout', arguments: {
                    'movie': movie,
                    'cinema': Get.arguments['cinema'],
                    'seat': controller.selectedSeats,
                    'time': Get.arguments['time'],
                    'date': Get.arguments['date'],
                  }),
                  child: ButtonNext(
                    arrowColor: controller.isCanNextStep.value
                        ? Colors.white
                        : darkGreyColor,
                    backgroundColor: controller.isCanNextStep.value
                        ? purpleColor
                        : lightGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
