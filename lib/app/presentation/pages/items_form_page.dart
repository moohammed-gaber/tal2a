import 'package:cashier/app/application/items_view_model.dart';
import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ItemsFormPage extends ConsumerStatefulWidget {
  const ItemsFormPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ItemsFormPage> createState() => _ItemsFormPageState();
}

class _ItemsFormPageState extends ConsumerState<ItemsFormPage> {
  final provider = itemsViewModelProvider;

  late final viewModel = ref.read(provider.notifier);
  final formKey = GlobalKey<FormBuilderState>();
  final textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            if (formKey.currentState!.saveAndValidate() &&
                state.selectedCategory.isSome()) {
              print(formKey.currentState!.value);
              await viewModel.add(ItemData(
                  price: num.parse(formKey.currentState!.value['price']),
                  title: formKey.currentState!.value['title'],
                  category: state.selectedCategory.toNullable()!));
              formKey.currentState!.reset();
              viewModel.onSelectCategory(none());
              textEditingController.text = '';
            }
          }),
      appBar: AppBar(title: Text('الاصناف')),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'title',
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'price',
                  decoration: InputDecoration(
                    labelText: 'السعر',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                SizedBox(height: 10),
                TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: textEditingController,
                      autofocus: true,
                      decoration: InputDecoration(labelText: 'القسم')),
                  suggestionsCallback: (pattern) =>
                      viewModel.getCategory(pattern),
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      leading: Icon(
                        Icons.category_outlined,
                        color: Colors.orange,
                      ),
                      title: Text(suggestion.data.title,
                          style: TextStyle(color: Colors.orange)),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    textEditingController.text = suggestion.data.title;
                    viewModel.onSelectCategory(some(suggestion));
                  },
                )
              ],
            )),
      ),
    );
  }
}
