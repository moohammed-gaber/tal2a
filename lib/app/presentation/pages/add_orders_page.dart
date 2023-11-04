import 'package:cashier/app/application/categories_view_model.dart';
import 'package:cashier/app/application/add_orders_view_model.dart';
import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/presentation/extenstions/extenstions.dart';
import 'package:cashier/app/presentation/pages/categories_form_page.dart';
import 'package:cashier/core/presentation/widgets/custom_list_tile.dart';
import 'package:cashier/core/presentation/widgets/state_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddOrdersPage extends ConsumerStatefulWidget {
  const AddOrdersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddOrdersPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<AddOrdersPage> {
  final provider = addOrdersViewModelProvider;
  late final viewModel = ref.read(provider.notifier);
  final textEditingController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);

    return Scaffold(
        appBar: AppBar(title: Text('الاوردرات')),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              if (formKey.currentState!.saveAndValidate()) {
                await viewModel.add(
                    num.parse(formKey.currentState!.value['delivery_price']));
                formKey.currentState!.reset();
                viewModel.reset();
              }
            }),
        body: FormBuilder(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            children: [
              FormBuilderTextField(
                name: 'delivery_price',
                decoration: InputDecoration(
                  labelText: 'سعر الدليفري',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: textEditingController,
                    autofocus: true,
                    decoration: InputDecoration(labelText: ('الصنف'))),
                suggestionsCallback: (pattern) => viewModel.getItem(pattern),
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Icon(Icons.food_bank, color: Colors.orange),
                    title: Text(suggestion.data.title,
                        style: TextStyle(color: Colors.orange)),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  // textEditingController.text = suggestion.data.title;
                  viewModel
                      .onSelectItem(OrderItem(item: suggestion, quantity: 1));
                },
              ),
              SizedBox(height: 30),
              Column(
                children: state.selectedItems
                    .mapIndexed((i, e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(e.item.data.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  Text(e.item.data.category.data.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Text('  ${e.totalPrice}',
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 20)),
                              Spacer(),
                              FloatingActionButton(
                                  onPressed: () =>
                                      viewModel.increaseQuantity(i),
                                  child: Icon(Icons.add)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(e.quantity.toString(),
                                    style: TextStyle(fontSize: 20)),
                              ),
                              FloatingActionButton(
                                  onPressed: () =>
                                      viewModel.decreaseQuantity(i),
                                  child: Icon(Icons.remove)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
/*
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: state.selectedItems
                    .map((e) => Chip(label: Text(e.data.title)))
                    .toList(),
              )
*/
            ],
          ),
        ));
  }
}
