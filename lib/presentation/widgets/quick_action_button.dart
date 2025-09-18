import 'package:flutter/material.dart';
import 'package:omar_ahmed_mentorship/core/constants/app_colors.dart';
import 'package:omar_ahmed_mentorship/cubit/home/cubit/home_cubit.dart';

import '../../model/order_repository.dart';
import '../view/add_new_order.dart';
import '../view/reports_page.dart';

class QuickActionButton extends StatelessWidget {
  final bool isAddNewOrderButton;
  final InMemoryOrderRepository orderRepository;
  final HomeCubit? cubit;
  final HomePageOrdersEmitted? homePageOrdersEmitted;
  const QuickActionButton({
    super.key,
    this.isAddNewOrderButton = false,
    required this.orderRepository,
    this.cubit,
    this.homePageOrdersEmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () async {
          if (isAddNewOrderButton) {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewOrder(
                  orderRepository: orderRepository,
                  homeCubit: cubit,
                ),
              ),
            );

            if (result == true) {
              cubit!.emitHomePageOrders();
            }
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ReportsPage(homePageOrdersEmitted: homePageOrdersEmitted!),
              ),
            );
          }
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: isAddNewOrderButton ? AppColors.black : Colors.white,
            border: Border.all(color: Colors.grey.withAlpha(50)),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isAddNewOrderButton ? Icons.add : Icons.bar_chart_rounded,
                size: 30,
                color: isAddNewOrderButton ? Colors.white : AppColors.darkGrey,
              ),
              const SizedBox(height: 4),
              Text(
                isAddNewOrderButton ? "New Order" : "Reports",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: isAddNewOrderButton
                      ? Colors.white
                      : AppColors.darkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
