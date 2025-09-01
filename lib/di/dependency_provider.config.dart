// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/dio/dio.dart' as _i13;
import '../core/services/isar/isar.dart' as _i5;
import '../feature/data/datasource/local/news_local_datasource.dart' as _i6;
import '../feature/data/datasource/remote/news_remote_datasource.dart' as _i4;
import '../feature/data/repository/news_repository_impl.dart' as _i8;
import '../feature/domain/repository/news_repository.dart' as _i7;
import '../feature/domain/usecase/news_detail_usecase.dart' as _i9;
import '../feature/domain/usecase/news_usecase.dart' as _i10;
import '../feature/presentation/news_detail/cubit/news_detail_cubit.dart'
    as _i11;
import '../feature/presentation/news_list/cubit/news_list_cubit.dart' as _i12;

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
    final dioModule = _$DioModule();
    gh.lazySingleton<_i3.Dio>(() => dioModule.provideDio());
    gh.factory<_i4.INewsRemoteDataSource>(
        () => _i4.NewsRemoteDataSourceImpl(httpClient: gh<_i3.Dio>()));
    gh.lazySingleton<_i5.IsarService>(() => _i5.IsarService());
    gh.factory<_i6.INewsLocalDataSource>(
        () => _i6.NewsLocalDataSourceImpl(isarService: gh<_i5.IsarService>()));
    gh.factory<_i7.INewsRepository>(() => _i8.NewsRepositoryImpl(
          remoteDataSource: gh<_i4.INewsRemoteDataSource>(),
          localDataSource: gh<_i6.INewsLocalDataSource>(),
        ));
    gh.factory<_i9.NewsDetailUseCase>(
        () => _i9.NewsDetailUseCase(gh<_i7.INewsRepository>()));
    gh.factory<_i10.NewsListUseCase>(
        () => _i10.NewsListUseCase(gh<_i7.INewsRepository>()));
    gh.factoryParam<_i11.NewsDetailCubit, String, dynamic>((
      articleTitle,
      _,
    ) =>
        _i11.NewsDetailCubit(
          gh<_i9.NewsDetailUseCase>(),
          articleTitle,
        ));
    gh.factory<_i12.NewsListCubit>(
        () => _i12.NewsListCubit(gh<_i10.NewsListUseCase>()));
    return this;
  }
}

class _$DioModule extends _i13.DioModule {}
