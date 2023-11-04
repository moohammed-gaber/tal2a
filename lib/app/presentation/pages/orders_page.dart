import 'package:cashier/app/application/categories_view_model.dart';
import 'package:cashier/app/application/orders_view_model.dart';
import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/order.dart';
import 'package:cashier/app/presentation/extenstions/extenstions.dart';
import 'package:cashier/app/presentation/pages/categories_form_page.dart';
import 'package:cashier/app/presentation/pages/order_details.dart';
import 'package:cashier/core/presentation/widgets/custom_list_tile.dart';
import 'package:cashier/core/presentation/widgets/state_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OrdersPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<OrdersPage> {
  final provider = ordersViewModelProvider;

  late final viewModel = ref.read(provider.notifier);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);

    return Scaffold(
        appBar: AppBar(title: Text('الاوردرات')),
        body: StateHandler<List<OrderEntity>>(
            onTapRetry: viewModel.getAll,
            customState: state.ordersState,
            onData: (data) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                itemBuilder: (context, index) {
                  final item = data[index];
                  return CustomListTile(
                      onTap: () {
                        context.to(OrderDetailsPage(
                            arguments: OrderDetailsArguments(order: item)));
                      },
                      onTabDelete: () => viewModel.delete(index),
                      leading: (item.id.toString()),
                      subtitle:
                          Text('التوصيل : ${item.orderData.deliveryPrice}'),
                      title: (item.orderData.price.toString()));
                },
                itemCount: data!.length,
              );
            }));
  }
}
