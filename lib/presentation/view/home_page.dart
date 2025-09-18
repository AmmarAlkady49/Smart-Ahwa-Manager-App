import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentorship/cubit/home/cubit/home_cubit.dart';
import 'package:omar_ahmed_mentorship/presentation/widgets/order_status_widget_box.dart';
import 'package:omar_ahmed_mentorship/presentation/widgets/pending_orders_widget.dart';

import '../../core/constants/app_colors.dart';
import '../../model/order_repository.dart';
import '../widgets/quick_action_button.dart';

class HomePage extends StatelessWidget {
  final InMemoryOrderRepository orderRepository;
  const HomePage({super.key, required this.orderRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset('assets/coffee_logo.png'),
        title: Text(
          "Smart Ahwa Manager",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: AppColors.black,
        foregroundColor: Colors.white,
        toolbarHeight: 60,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: BlocProvider.of<HomeCubit>(context),
        buildWhen: (previous, current) =>
            current is HomePageOrdersEmitted || current is HomeError,
        builder: (context, state) {
          if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            );
          } else if (state is HomePageOrdersEmitted) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OrderStatusWidgetBox(
                        orderStatusTitle: 'Pending',
                        orderCount: state.pendingOrders.length,
                      ),
                      const SizedBox(width: 10),
                      OrderStatusWidgetBox(
                        orderStatusTitle: 'Completed',
                        orderCount: state.completedOrders.length,
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  Text(
                    "Quick Actions",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickActionButton(
                        isAddNewOrderButton: true,
                        orderRepository: orderRepository,
                        cubit: BlocProvider.of<HomeCubit>(context),
                      ),
                      const SizedBox(width: 10),
                      QuickActionButton(
                        orderRepository: orderRepository,
                        homePageOrdersEmitted: state,
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pending Orders",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.black, fontSize: 20),
                      ),
                      Text(
                        "${state.pendingOrders.length} Orders", // Use actual pending count
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.darkGrey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  PendingOrdersWidget(
                    state: state,
                    cubit: BlocProvider.of<HomeCubit>(context),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
