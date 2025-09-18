import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_mentorship/cubit/home/cubit/home_cubit.dart';

import 'model/order_repository.dart';
import 'presentation/view/home_page.dart';

void main() {
  final orderRepository = InMemoryOrderRepository();

  runApp(MainApp(orderRepository: orderRepository));
}

class MainApp extends StatelessWidget {
  final InMemoryOrderRepository orderRepository;
  const MainApp({super.key, required this.orderRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BlocProvider(
        create: (context) => HomeCubit(orderRepository)..emitHomePageOrders(),
        child: HomePage(orderRepository: orderRepository),
      ),
    );
  }
}
