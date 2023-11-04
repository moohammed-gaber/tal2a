// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../app/application/categories_view_model.dart' as _i9;
import '../../../app/application/items_view_model.dart' as _i12;
import '../../../app/application/orders_view_model.dart' as _i13;
import '../../../app/domain/repositories/categories_repo.dart' as _i7;
import '../../../app/domain/repositories/categories_repo_impl.dart' as _i8;
import '../../../app/domain/repositories/Items_repo.dart' as _i10;
import '../../../app/domain/repositories/Items_repo_impl.dart' as _i11;
import '../../../app/domain/repositories/orders_repo.dart' as _i5;
import '../../../app/domain/repositories/orders_repo_impl.dart' as _i6;
import '../../data/local/clients/local_database_client.dart' as _i4;
import '../../infrastructure/device/device_printer.dart' as _i3;

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
    gh.lazySingleton<_i3.DevicePrinter>(() => _i3.DevicePrinter());
    gh.lazySingleton<_i4.LocalDatabaseClient>(() => _i4.LocalDatabaseClient());
    gh.lazySingleton<_i5.OrdersRepo>(
        () => _i6.OrdersRepoImpl(gh<_i4.LocalDatabaseClient>()));
    gh.lazySingleton<_i7.CategoriesRepo>(
        () => _i8.CategoriesRepoImpl(gh<_i4.LocalDatabaseClient>()));
    gh.factory<_i9.CategoriesViewModel>(
        () => _i9.CategoriesViewModel(gh<_i7.CategoriesRepo>()));
    gh.lazySingleton<_i10.ItemsRepo>(
        () => _i11.ItemsRepoImpl(gh<_i4.LocalDatabaseClient>()));
    gh.factory<_i12.ItemsViewModel>(() => _i12.ItemsViewModel(
          gh<_i10.ItemsRepo>(),
          gh<_i7.CategoriesRepo>(),
        ));
    gh.factory<_i13.OrdersViewModel>(() => _i13.OrdersViewModel(
          gh<_i5.OrdersRepo>(),
          gh<_i10.ItemsRepo>(),
        ));
    return this;
  }
}
