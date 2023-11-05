// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../app/application/add_orders_view_model.dart' as _i17;
import '../../../app/application/categories_view_model.dart' as _i11;
import '../../../app/application/items_view_model.dart' as _i14;
import '../../../app/application/order_details_view_model.dart' as _i15;
import '../../../app/application/orders_view_model.dart' as _i8;
import '../../../app/domain/repositories/categories_repo.dart' as _i9;
import '../../../app/domain/repositories/categories_repo_impl.dart' as _i10;
import '../../../app/domain/repositories/Items_repo.dart' as _i12;
import '../../../app/domain/repositories/Items_repo_impl.dart' as _i13;
import '../../../app/domain/repositories/orders_repo.dart' as _i6;
import '../../../app/domain/repositories/orders_repo_impl.dart' as _i7;
import '../../../app/presentation/pages/order_details.dart' as _i16;
import '../../data/local/clients/local_database_client.dart' as _i5;
import '../../infrastructure/device/device_printer.dart' as _i4;
import '../../infrastructure/helper_modules.dart' as _i18;

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
    final helpersModule = _$HelpersModule();
    gh.lazySingleton<_i3.DeviceInfoPlugin>(
        () => helpersModule.deviceInfoPlugin);
    gh.lazySingleton<_i4.DevicePrinter>(() => _i4.DevicePrinter());
    gh.lazySingleton<_i5.LocalDatabaseClient>(() => _i5.LocalDatabaseClient());
    gh.lazySingleton<_i6.OrdersRepo>(
        () => _i7.OrdersRepoImpl(gh<_i5.LocalDatabaseClient>()));
    gh.factory<_i8.OrdersViewModel>(
        () => _i8.OrdersViewModel(gh<_i6.OrdersRepo>()));
    gh.lazySingleton<_i9.CategoriesRepo>(
        () => _i10.CategoriesRepoImpl(gh<_i5.LocalDatabaseClient>()));
    gh.factory<_i11.CategoriesViewModel>(
        () => _i11.CategoriesViewModel(gh<_i9.CategoriesRepo>()));
    gh.lazySingleton<_i12.ItemsRepo>(
        () => _i13.ItemsRepoImpl(gh<_i5.LocalDatabaseClient>()));
    gh.factory<_i14.ItemsViewModel>(() => _i14.ItemsViewModel(
          gh<_i12.ItemsRepo>(),
          gh<_i9.CategoriesRepo>(),
        ));
    gh.factoryParam<_i15.OrderDetailsViewModel, _i16.OrderDetailsArguments,
        dynamic>((
      arguments,
      _,
    ) =>
        _i15.OrderDetailsViewModel(
          gh<_i6.OrdersRepo>(),
          arguments,
        ));
    gh.factory<_i17.AddOrdersViewModel>(() => _i17.AddOrdersViewModel(
          gh<_i6.OrdersRepo>(),
          gh<_i12.ItemsRepo>(),
        ));
    return this;
  }
}

class _$HelpersModule extends _i18.HelpersModule {}
