import 'package:cashier/app/application/categories_view_model.dart';
import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/presentation/extenstions/extenstions.dart';
import 'package:cashier/app/presentation/pages/categories_form_page.dart';
import 'package:cashier/core/presentation/widgets/custom_list_tile.dart';
import 'package:cashier/core/presentation/widgets/state_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  final provider = categoriesViewModelProvider;

  late final viewModel = ref.read(provider.notifier);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);

    return Scaffold(
        appBar: AppBar(title: Text('الاقسام')),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.to(CategoriesFormPage());
            }),
        body: StateHandler<List<Category>>(
            onTapRetry: viewModel.getAll,
            customState: state.categoriesState,
            onData: (data) => ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return CustomListTile(
                        onTap: () {},
                        onTabDelete: () => viewModel.delete(index),
                        leading: (item.id.toString()),
                        title: (item.data.title));
                  },
                  itemCount: data!.length,
                )));
  }
}
