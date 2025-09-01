// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsEntity {
  List<ArticleEntity> get articles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsEntityCopyWith<NewsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEntityCopyWith<$Res> {
  factory $NewsEntityCopyWith(
          NewsEntity value, $Res Function(NewsEntity) then) =
      _$NewsEntityCopyWithImpl<$Res, NewsEntity>;
  @useResult
  $Res call({List<ArticleEntity> articles});
}

/// @nodoc
class _$NewsEntityCopyWithImpl<$Res, $Val extends NewsEntity>
    implements $NewsEntityCopyWith<$Res> {
  _$NewsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsEntityImplCopyWith<$Res>
    implements $NewsEntityCopyWith<$Res> {
  factory _$$NewsEntityImplCopyWith(
          _$NewsEntityImpl value, $Res Function(_$NewsEntityImpl) then) =
      __$$NewsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ArticleEntity> articles});
}

/// @nodoc
class __$$NewsEntityImplCopyWithImpl<$Res>
    extends _$NewsEntityCopyWithImpl<$Res, _$NewsEntityImpl>
    implements _$$NewsEntityImplCopyWith<$Res> {
  __$$NewsEntityImplCopyWithImpl(
      _$NewsEntityImpl _value, $Res Function(_$NewsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$NewsEntityImpl(
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleEntity>,
    ));
  }
}

/// @nodoc

class _$NewsEntityImpl implements _NewsEntity {
  const _$NewsEntityImpl({required final List<ArticleEntity> articles})
      : _articles = articles;

  final List<ArticleEntity> _articles;
  @override
  List<ArticleEntity> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'NewsEntity(articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsEntityImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsEntityImplCopyWith<_$NewsEntityImpl> get copyWith =>
      __$$NewsEntityImplCopyWithImpl<_$NewsEntityImpl>(this, _$identity);
}

abstract class _NewsEntity implements NewsEntity {
  const factory _NewsEntity({required final List<ArticleEntity> articles}) =
      _$NewsEntityImpl;

  @override
  List<ArticleEntity> get articles;
  @override
  @JsonKey(ignore: true)
  _$$NewsEntityImplCopyWith<_$NewsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticleEntity {
  SourceEntity get source => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get urlToImage => throw _privateConstructorUsedError;
  DateTime get publishedAt => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleEntityCopyWith<ArticleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleEntityCopyWith<$Res> {
  factory $ArticleEntityCopyWith(
          ArticleEntity value, $Res Function(ArticleEntity) then) =
      _$ArticleEntityCopyWithImpl<$Res, ArticleEntity>;
  @useResult
  $Res call(
      {SourceEntity source,
      String? author,
      String title,
      String description,
      String url,
      String urlToImage,
      DateTime publishedAt,
      String content,
      String query});

  $SourceEntityCopyWith<$Res> get source;
}

/// @nodoc
class _$ArticleEntityCopyWithImpl<$Res, $Val extends ArticleEntity>
    implements $ArticleEntityCopyWith<$Res> {
  _$ArticleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? author = freezed,
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? urlToImage = null,
    Object? publishedAt = null,
    Object? content = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceEntity,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: null == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SourceEntityCopyWith<$Res> get source {
    return $SourceEntityCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleEntityImplCopyWith<$Res>
    implements $ArticleEntityCopyWith<$Res> {
  factory _$$ArticleEntityImplCopyWith(
          _$ArticleEntityImpl value, $Res Function(_$ArticleEntityImpl) then) =
      __$$ArticleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SourceEntity source,
      String? author,
      String title,
      String description,
      String url,
      String urlToImage,
      DateTime publishedAt,
      String content,
      String query});

  @override
  $SourceEntityCopyWith<$Res> get source;
}

/// @nodoc
class __$$ArticleEntityImplCopyWithImpl<$Res>
    extends _$ArticleEntityCopyWithImpl<$Res, _$ArticleEntityImpl>
    implements _$$ArticleEntityImplCopyWith<$Res> {
  __$$ArticleEntityImplCopyWithImpl(
      _$ArticleEntityImpl _value, $Res Function(_$ArticleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? author = freezed,
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? urlToImage = null,
    Object? publishedAt = null,
    Object? content = null,
    Object? query = null,
  }) {
    return _then(_$ArticleEntityImpl(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SourceEntity,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: null == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ArticleEntityImpl implements _ArticleEntity {
  const _$ArticleEntityImpl(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      required this.query});

  @override
  final SourceEntity source;
  @override
  final String? author;
  @override
  final String title;
  @override
  final String description;
  @override
  final String url;
  @override
  final String urlToImage;
  @override
  final DateTime publishedAt;
  @override
  final String content;
  @override
  final String query;

  @override
  String toString() {
    return 'ArticleEntity(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleEntityImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, author, title,
      description, url, urlToImage, publishedAt, content, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleEntityImplCopyWith<_$ArticleEntityImpl> get copyWith =>
      __$$ArticleEntityImplCopyWithImpl<_$ArticleEntityImpl>(this, _$identity);
}

abstract class _ArticleEntity implements ArticleEntity {
  const factory _ArticleEntity(
      {required final SourceEntity source,
      required final String? author,
      required final String title,
      required final String description,
      required final String url,
      required final String urlToImage,
      required final DateTime publishedAt,
      required final String content,
      required final String query}) = _$ArticleEntityImpl;

  @override
  SourceEntity get source;
  @override
  String? get author;
  @override
  String get title;
  @override
  String get description;
  @override
  String get url;
  @override
  String get urlToImage;
  @override
  DateTime get publishedAt;
  @override
  String get content;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$ArticleEntityImplCopyWith<_$ArticleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SourceEntity {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SourceEntityCopyWith<SourceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceEntityCopyWith<$Res> {
  factory $SourceEntityCopyWith(
          SourceEntity value, $Res Function(SourceEntity) then) =
      _$SourceEntityCopyWithImpl<$Res, SourceEntity>;
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class _$SourceEntityCopyWithImpl<$Res, $Val extends SourceEntity>
    implements $SourceEntityCopyWith<$Res> {
  _$SourceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceEntityImplCopyWith<$Res>
    implements $SourceEntityCopyWith<$Res> {
  factory _$$SourceEntityImplCopyWith(
          _$SourceEntityImpl value, $Res Function(_$SourceEntityImpl) then) =
      __$$SourceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name});
}

/// @nodoc
class __$$SourceEntityImplCopyWithImpl<$Res>
    extends _$SourceEntityCopyWithImpl<$Res, _$SourceEntityImpl>
    implements _$$SourceEntityImplCopyWith<$Res> {
  __$$SourceEntityImplCopyWithImpl(
      _$SourceEntityImpl _value, $Res Function(_$SourceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$SourceEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SourceEntityImpl implements _SourceEntity {
  const _$SourceEntityImpl({required this.id, required this.name});

  @override
  final String? id;
  @override
  final String name;

  @override
  String toString() {
    return 'SourceEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceEntityImplCopyWith<_$SourceEntityImpl> get copyWith =>
      __$$SourceEntityImplCopyWithImpl<_$SourceEntityImpl>(this, _$identity);
}

abstract class _SourceEntity implements SourceEntity {
  const factory _SourceEntity(
      {required final String? id,
      required final String name}) = _$SourceEntityImpl;

  @override
  String? get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SourceEntityImplCopyWith<_$SourceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
