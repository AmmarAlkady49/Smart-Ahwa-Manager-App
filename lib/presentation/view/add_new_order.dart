import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentorship/core/constants/app_colors.dart';
import 'package:omar_ahmed_mentorship/presentation/widgets/drop_down_button.dart';
import 'package:omar_ahmed_mentorship/presentation/widgets/my_text_input_field.dart';

import '../../cubit/new_order.dart/cubit/new_order_cubit.dart';
import '../../cubit/home/cubit/home_cubit.dart';
import '../../model/order_repository.dart';

class AddNewOrder extends StatelessWidget {
  final InMemoryOrderRepository orderRepository;
  final HomeCubit? homeCubit;
  const AddNewOrder({super.key, required this.orderRepository, this.homeCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'New Order',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.black,
        foregroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => NewOrderCubit(orderRepository),
        child: BlocListener<NewOrderCubit, NewOrderState>(
          listener: (context, state) {
            if (state is NewOrderCreated) {
              if (homeCubit != null) {
                homeCubit!.emitHomePageOrders();
              }

              Navigator.pop(context, true);
            }
          },
          child: Builder(
            builder: (context) {
              final cubit = context.read<NewOrderCubit>();

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    MyTextInputField(
                      label: 'Customer Name',
                      hint: 'Enter customer name',
                      controller: cubit.customerNameController,
                    ),
                    DropDownButton(label: 'Drink Type'),
                    MyTextInputField(
                      label: 'Special Instructions',
                      hint: 'e.g., extra mint, ya rais',
                      maxLines: 4,
                      controller: cubit.specialInstructionsController,
                    ),

                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: BlocBuilder<NewOrderCubit, NewOrderState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: state is AddingNewOrder
                                ? null
                                : () {
                                    cubit.createOrder();
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: state is AddingNewOrder
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Add Order',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
