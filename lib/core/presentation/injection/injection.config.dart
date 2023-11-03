// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../app/application/categories_view_model.dart' as _i6;
import '../../../app/application/items_view_model.dart' as _i9;
import '../../../app/domain/repositories/categories_repo.dart' as _i4;
import '../../../app/domain/repositories/categories_repo_impl.dart' as _i5;
import '../../../app/domain/repositories/Items_repo.dart' as _i7;
import '../../../app/domain/repositories/Items_repo_impl.dart' as _i8;
import '../../data/local/clients/local_database_client.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.LocalDatabaseClient>(() => _i3.LocalDatabaseClient());
    gh.lazySingleton<_i4.CategoriesRepo>(
        () => _i5.CategoriesRepoImpl(gh<_i3.LocalDatabaseClient>()));
    gh.factory<_i6.CategoriesViewModel>(
        () => _i6.CategoriesViewModel(gh<_i4.CategoriesRepo>()));
    gh.lazySingleton<_i7.ItemsRepo>(
        () => _i8.ItemsRepoImpl(gh<_i3.LocalDatabaseClient>()));
    gh.factory<_i9.ItemsViewModel>(
        () => _i9.ItemsViewModel(gh<_i7.ItemsRepo>()));
    return this;
  }
}
