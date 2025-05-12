import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/common/custom_appbar.dart';
import 'package:restaurant_app/common/home_tile.dart';
import 'package:restaurant_app/constants/constant.dart';
import 'package:restaurant_app/views/home/widget/home_tabs.dart';
import 'package:restaurant_app/views/home/widget/home_tiles.dart';
import 'package:restaurant_app/views/home/widget/orders/cancelled_oders.dart';
import 'package:restaurant_app/views/home/widget/orders/delivered_orders.dart';
import 'package:restaurant_app/views/home/widget/orders/new_orders.dart';
import 'package:restaurant_app/views/home/widget/orders/picked_orders.dart';
import 'package:restaurant_app/views/home/widget/orders/preparing.dart';
import 'package:restaurant_app/views/home/widget/orders/ready_orders.dart';
import 'package:restaurant_app/views/home/widget/orders/self_deliveries.dart';

import '../../common/tab_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: orderList.length,
      vsync: this
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        flexibleSpace: const CustomAppbar(),
      ),
        body: BackgroundContainer(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 15.h,
              ),
              const HomeTiles(),
              SizedBox(
                height: 15.h,
              ),
              HomeTabs(tabController: _tabController),

              SizedBox(
                height: 15.h,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                height: height * 0.7,
                color: Colors.transparent,
                child: TabBarView(
                    controller: _tabController,
                    children: const [
                      NewOrders(),
                      Preparing(),
                      ReadyOrders(),
                      PickedOrders(),
                      SelfDeliveries(),
                      DeliveredOrders(),
                      CancelledOders(),
                    ],
                ),
              )
            ],
          ),
        ),
    );
  }
}



