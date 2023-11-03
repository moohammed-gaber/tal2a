import 'package:cashier/app/application/categories_view_model.dart';
import 'package:cashier/app/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CategoriesFormPage extends ConsumerStatefulWidget {
  const CategoriesFormPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesFormPage> createState() => _CategoriesFormPageState();
}

class _CategoriesFormPageState extends ConsumerState<CategoriesFormPage> {
  final provider = categoriesViewModelProvider;

  late final viewModel = ref.read(provider.notifier);
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            if (formKey.currentState!.saveAndValidate()) {
              await viewModel.add(
                  CategoryData.fromForm(data: formKey.currentState!.value));
              formKey.currentState!.reset();
            }
          }),
      appBar: AppBar(title: Text('الاقسام')),
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
              ],
            )),
      ),
    );
  }
}
