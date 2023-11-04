import 'package:cashier/app/application/order_details_view_model.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/entities/order.dart';
import 'package:cashier/core/presentation/widgets/state_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailsArguments {
  int get orderId => order.id;
  final OrderEntity order;

  OrderDetailsArguments({required this.order});
}

class OrderDetailsPage extends ConsumerStatefulWidget {
  final OrderDetailsArguments arguments;
  const OrderDetailsPage({Key? key, required this.arguments}) : super(key: key);

  @override
  ConsumerState<OrderDetailsPage> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetailsPage> {
  late final provider = ordersDetailsViewModelProvider(widget.arguments);
  late final viewModel = ref.read(provider.notifier);
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الاوردر'),
      ),
      body: StateHandler<List<OrderItem>>(
          onTapRetry: viewModel.getAll,
          customState: state.ordersState,
          onData: (data) {
            if (data == null) return SizedBox.shrink();
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildRow('تكلفه الاوردر الاجماليه',
                          state.orderEntity.orderData.price.toString()),
                      buildRow('تكلفه التوصيل',
                          state.orderEntity.orderData.deliveryPrice.toString()),

                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          trailing: Text(data[index].totalPrice.toString()),
                          title: Text(
                              '${data[index].quantity.toString()} ${data[index].item.data.title} - ${data[index].item.data.category.data.title.toString()} '),
                          subtitle: Text(
                              '${data[index].item.data.price.toString()} '));
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }

  Row buildRow(String title, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title),
      Text(value, style: TextStyle(color: Colors.orange)),
    ]);
  }
}
