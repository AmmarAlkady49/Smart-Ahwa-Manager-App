import 'package:flutter/material.dart';
import 'package:omar_ahmed_mentorship/core/constants/app_colors.dart';

class OrderStatusWidgetBox extends StatelessWidget {
  final String orderStatusTitle;
  final int orderCount;
  const OrderStatusWidgetBox({
    super.key,
    required this.orderStatusTitle,
    required this.orderCount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          border: Border.all(color: AppColors.grey.withAlpha(50)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha(30),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.watch_later,
                    color: AppColors.black.withAlpha(210),
                    size: 19,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    orderStatusTitle,
                    style: TextStyle(
                      color: AppColors.black.withAlpha(210),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                orderCount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
