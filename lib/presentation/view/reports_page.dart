import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../cubit/home/cubit/home_cubit.dart';

class ReportsPage extends StatelessWidget {
  final HomePageOrdersEmitted homePageOrdersEmitted;
  const ReportsPage({super.key, required this.homePageOrdersEmitted});

  @override
  Widget build(BuildContext context) {
    final totalRevenue = homePageOrdersEmitted.allOrders
        .map((order) => order.drinkType.price)
        .fold(0.0, (sum, price) => sum + price);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Daily Reports',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: AppColors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's Summary",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),

            /// Summary Cards
            Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    icon: Icons.receipt_long,
                    title: "Total Orders",
                    value: homePageOrdersEmitted.allOrders.length.toString(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SummaryCard(
                    icon: Icons.attach_money_rounded,
                    title: "Total Revenue",
                    value: "${totalRevenue.toStringAsFixed(2)} LE",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Text(
              "Completed Orders",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: homePageOrdersEmitted.completedOrders.isEmpty
                  ? Center(
                      child: Text(
                        "No completed orders yet!",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: homePageOrdersEmitted.completedOrders.length,
                      itemBuilder: (context, index) {
                        final order =
                            homePageOrdersEmitted.completedOrders[index];
                        return Card(
                          color: AppColors.lightGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.grey.withAlpha(50),
                              child: Icon(
                                Icons.local_drink,
                                color: AppColors.black,
                              ),
                            ),
                            title: Text(
                              order.drinkType.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              "${order.drinkType.price.toStringAsFixed(2)} LE",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.black.withAlpha(180),
                              ),
                            ),
                            trailing: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SummaryCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightGrey,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: AppColors.black),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.black.withAlpha(180),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
