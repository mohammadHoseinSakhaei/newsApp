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
import '../feature/data/datasource/local/article_local_datasource.dart' as _i6;
import '../feature/data/datasource/remote/article_remote_datasource.dart'
    as _i4;
import '../feature/data/repository/article_repository_impl.dart' as _i8;
import '../feature/domain/repository/article_repository.dart' as _i7;
import '../feature/domain/usecase/article_detail_usecase.dart' as _i9;
import '../feature/domain/usecase/article_usecase.dart' as _i10;
import '../feature/presentation/article_detail/cubit/article_detail_cubit.dart'
    as _i11;
import '../feature/presentation/article_list/cubit/article_list_cubit.dart'
    as _i12;

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
    gh.factory<_i4.IArticleRemoteDataSource>(
        () => _i4.ArticleRemoteDatasource(httpClient: gh<_i3.Dio>()));
    gh.lazySingleton<_i5.IsarService>(() => _i5.IsarService());
    gh.factory<_i6.IArticleLocalDataSource>(() =>
        _i6.ArticleLocalDataSourceImpl(isarService: gh<_i5.IsarService>()));
    gh.factory<_i7.IArticleRepository>(() => _i8.ArticleRepositoryImpl(
          remoteDataSource: gh<_i4.IArticleRemoteDataSource>(),
          localDataSource: gh<_i6.IArticleLocalDataSource>(),
        ));
    gh.factory<_i9.ArticleDetailUseCase>(
        () => _i9.ArticleDetailUseCase(gh<_i7.IArticleRepository>()));
    gh.factory<_i10.ArticleListUseCase>(
        () => _i10.ArticleListUseCase(gh<_i7.IArticleRepository>()));
    gh.factoryParam<_i11.ArticleDetailCubit, String, dynamic>((
      articleTitle,
      _,
    ) =>
        _i11.ArticleDetailCubit(
          gh<_i9.ArticleDetailUseCase>(),
          articleTitle,
        ));
    gh.factory<_i12.ArticleListCubit>(
        () => _i12.ArticleListCubit(gh<_i10.ArticleListUseCase>()));
    return this;
  }
}

class _$DioModule extends _i13.DioModule {}
