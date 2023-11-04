// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:device_info_plus/device_info_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../app/application/add_orders_view_model.dart' as _i19;
import '../../../app/application/categories_view_model.dart' as _i13;
import '../../../app/application/items_view_model.dart' as _i16;
import '../../../app/application/order_details_view_model.dart' as _i17;
import '../../../app/application/orders_view_model.dart' as _i9;
import '../../../app/domain/repositories/categories_repo.dart' as _i11;
import '../../../app/domain/repositories/categories_repo_impl.dart' as _i12;
import '../../../app/domain/repositories/Items_repo.dart' as _i14;
import '../../../app/domain/repositories/Items_repo_impl.dart' as _i15;
import '../../../app/domain/repositories/orders_repo.dart' as _i7;
import '../../../app/domain/repositories/orders_repo_impl.dart' as _i8;
import '../../../app/presentation/pages/order_details.dart' as _i18;
import '../../data/local/clients/local_database_client.dart' as _i6;
import '../../data/repositories/security_repo.dart' as _i10;
import '../../infrastructure/device/device_printer.dart' as _i4;
import '../../infrastructure/helper_modules.dart' as _i20;

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
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => helpersModule.firebaseFireStore);
    gh.lazySingleton<_i6.LocalDatabaseClient>(() => _i6.LocalDatabaseClient());
    gh.lazySingleton<_i7.OrdersRepo>(
        () => _i8.OrdersRepoImpl(gh<_i6.LocalDatabaseClient>()));
    gh.factory<_i9.OrdersViewModel>(
        () => _i9.OrdersViewModel(gh<_i7.OrdersRepo>()));
    gh.lazySingleton<_i10.UserDeviceInfo>(
        () => _i10.UserDeviceInfo(gh<_i3.DeviceInfoPlugin>()));
    gh.lazySingleton<_i11.CategoriesRepo>(
        () => _i12.CategoriesRepoImpl(gh<_i6.LocalDatabaseClient>()));
    gh.factory<_i13.CategoriesViewModel>(
        () => _i13.CategoriesViewModel(gh<_i11.CategoriesRepo>()));
    gh.lazySingleton<_i14.ItemsRepo>(
        () => _i15.ItemsRepoImpl(gh<_i6.LocalDatabaseClient>()));
    gh.factory<_i16.ItemsViewModel>(() => _i16.ItemsViewModel(
          gh<_i14.ItemsRepo>(),
          gh<_i11.CategoriesRepo>(),
        ));
    gh.factoryParam<_i17.OrderDetailsViewModel, _i18.OrderDetailsArguments,
        dynamic>((
      arguments,
      _,
    ) =>
        _i17.OrderDetailsViewModel(
          gh<_i7.OrdersRepo>(),
          arguments,
        ));
    gh.lazySingleton<_i10.SecurityRepo>(() => _i10.SecurityRepo(
          gh<_i5.FirebaseFirestore>(),
          gh<_i10.UserDeviceInfo>(),
        ));
    gh.factory<_i19.AddOrdersViewModel>(() => _i19.AddOrdersViewModel(
          gh<_i7.OrdersRepo>(),
          gh<_i14.ItemsRepo>(),
        ));
    return this;
  }
}

class _$HelpersModule extends _i20.HelpersModule {}
