import 'package:vtp_appcaulong/config/config.dart';
import 'package:vtp_appcaulong/controllers/controllers.dart';
import 'package:vtp_appcaulong/formatter.dart';
import 'package:vtp_appcaulong/models/models.dart';
import 'package:vtp_appcaulong/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyBookingDetails extends StatelessWidget {
  const MyBookingDetails({Key? key, required this.myBookingData})
      : super(key: key);
  final MyBookingData myBookingData;
  static const String routeName = '/mybookingdetails';

  // static Route route() {
  //   return MaterialPageRoute(
  //       builder: (context) => const MyBookingDetails(myBookingData: myBookingData,),
  //       settings: const RouteSettings(name: routeName));
  // }

  @override
  Widget build(BuildContext context) {
    final CustomDrawerController drawerController = CustomDrawerController();

    return Scaffold(
      bottomNavigationBar: TextButton(
        onPressed: () {},
        child: Text(
          'Cancel the reservation',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.red),
        ),
      ),
      endDrawer: CustomDrawer(),
      key: drawerController.scaffoldKey,
      appBar: CustomHasTitleAppbar(
        backFunc: () => Get.back(),
        title: 'Booking ${myBookingData.revNo}',
        controller: drawerController,
      ),
      body: Column(children: [
        Container(
          child: Padding(
              padding: EdgeInsets.all(minPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    myBookingData.startTime,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' - ',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    myBookingData.endTime,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: minPadding / 2, horizontal: largePadding),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // color: Color(0x0C591B1B),
                    color: primaryColor.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultBorderRadius * 2)),
            child: Padding(
              padding: EdgeInsets.all(minPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: minPadding),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Booking date',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Branch',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Play Time',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Num of court',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              myBookingData.bookingDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              myBookingData.branch,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Formatter.playTimeString(
                                  Formatter.convertStringToTimeOfDay(
                                      myBookingData.startTime),
                                  Formatter.convertStringToTimeOfDay(
                                      myBookingData.endTime)),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              myBookingData.courtList.length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${myBookingData.prices}đ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: minPadding / 2, horizontal: largePadding),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // color: Color(0x0C591B1B),
                    color: primaryColor.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultBorderRadius * 2)),
            child: Padding(
              padding: EdgeInsets.all(minPadding),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: minPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Booked court(s)',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: myBookingData.courtList[0].courtName.length
                              .toDouble() *
                          10,
                      height: myBookingData.courtList.length * 35,
                      child: ListView.builder(
                          itemCount: myBookingData.courtList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                textAlign: TextAlign.end,
                                myBookingData.courtList[index].courtName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: minPadding / 2, horizontal: largePadding),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // color: Color(0x0C591B1B),
                    color: primaryColor.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultBorderRadius * 2)),
            child: Padding(
              padding: EdgeInsets.all(minPadding),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: minPadding),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
