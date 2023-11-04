import 'package:cashier/app/application/items_view_model.dart';
import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/presentation/extenstions/extenstions.dart';
import 'package:cashier/app/presentation/pages/items_form_page.dart';
import 'package:cashier/core/presentation/widgets/custom_list_tile.dart';
import 'package:cashier/core/presentation/widgets/state_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemsPage extends ConsumerStatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends ConsumerState<ItemsPage> {
  final provider = itemsViewModelProvider;

  late final viewModel = ref.read(provider.notifier);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);
    // viewModel.repo.getAll().then((value) => print(value));
/*
    viewModel.add(ItemData(
        title: 'Test',
        category: Category(id: 3, data: CategoryData(title: 'حادق'))));
*/
    return Scaffold(
        appBar: AppBar(title: Text('الاصناف')),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.to(ItemsFormPage());
            }),
        body: StateHandler<List<Item>>(
            onTapRetry: viewModel.getAll,
            customState: state.itemsState,
            onData: (data) => ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return CustomListTile(
                        onTap: () {},
                        subtitle: Text(item.data.category.data.title),
                        onTabDelete: () => viewModel.delete(index),
                        leading: (item.id.toString()),
                        title: (item.data.title));
                  },
                  itemCount: data!.length,
                )));
  }
}
