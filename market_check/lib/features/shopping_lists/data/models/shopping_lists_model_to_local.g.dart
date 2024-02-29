// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_lists_model_to_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShoppingListModelCollection on Isar {
  IsarCollection<ShoppingListModelToLocal> get shoppingListModels => this.collection();
}

const ShoppingListModelSchema = CollectionSchema(
  name: r'ShoppingListModel',
  id: 3989608519231480221,
  properties: {
    r'nameList': PropertySchema(
      id: 0,
      name: r'nameList',
      type: IsarType.string,
    ),
    r'products': PropertySchema(
      id: 1,
      name: r'products',
      type: IsarType.stringList,
    ),
    r'totalProductsCounter': PropertySchema(
      id: 2,
      name: r'totalProductsCounter',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _shoppingListModelEstimateSize,
  serialize: _shoppingListModelSerialize,
  deserialize: _shoppingListModelDeserialize,
  deserializeProp: _shoppingListModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _shoppingListModelGetId,
  getLinks: _shoppingListModelGetLinks,
  attach: _shoppingListModelAttach,
  version: '3.1.0+1',
);

int _shoppingListModelEstimateSize(
  ShoppingListModelToLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nameList.length * 3;
  bytesCount += 3 + object.products.length * 3;
  {
    for (var i = 0; i < object.products.length; i++) {
      final value = object.products[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _shoppingListModelSerialize(
  ShoppingListModelToLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nameList);
  writer.writeStringList(offsets[1], object.products);
  writer.writeLong(offsets[2], object.totalProductsCounter);
  writer.writeLong(offsets[3], object.userId);
}

ShoppingListModelToLocal _shoppingListModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShoppingListModelToLocal(
    nameList: reader.readString(offsets[0]),
    products: reader.readStringList(offsets[1]) ?? [],
    totalProductsCounter: reader.readLong(offsets[2]),
    userId: reader.readLong(offsets[3]),
  );
  object.id = id;
  return object;
}

P _shoppingListModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _shoppingListModelGetId(ShoppingListModelToLocal object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _shoppingListModelGetLinks(
    ShoppingListModelToLocal object) {
  return [];
}

void _shoppingListModelAttach(
    IsarCollection<dynamic> col, Id id, ShoppingListModelToLocal object) {
  object.id = id;
}

extension ShoppingListModelQueryWhereSort
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QWhere> {
  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShoppingListModelQueryWhere
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QWhereClause> {
  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ShoppingListModelQueryFilter
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QFilterCondition> {
  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameList',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      nameListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameList',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'products',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'products',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'products',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'products',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'products',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'products',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'products',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'products',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'products',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'products',
        value: '',
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      productsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'products',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      totalProductsCounterEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalProductsCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      totalProductsCounterGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalProductsCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      totalProductsCounterLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalProductsCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      totalProductsCounterBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalProductsCounter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ShoppingListModelQueryObject
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QFilterCondition> {}

extension ShoppingListModelQueryLinks
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QFilterCondition> {}

extension ShoppingListModelQuerySortBy
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QSortBy> {
  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      sortByNameList() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameList', Sort.asc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      sortByNameListDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameList', Sort.desc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      sortByTotalProductsCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProductsCounter', Sort.asc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      sortByTotalProductsCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProductsCounter', Sort.desc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ShoppingListModelQuerySortThenBy
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QSortThenBy> {
  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      thenByNameList() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameList', Sort.asc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      thenByNameListDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameList', Sort.desc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      thenByTotalProductsCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProductsCounter', Sort.asc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      thenByTotalProductsCounterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalProductsCounter', Sort.desc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension ShoppingListModelQueryWhereDistinct
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QDistinct> {
  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QDistinct>
      distinctByNameList({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameList', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QDistinct>
      distinctByProducts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'products');
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QDistinct>
      distinctByTotalProductsCounter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalProductsCounter');
    });
  }

  QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension ShoppingListModelQueryProperty
    on QueryBuilder<ShoppingListModelToLocal, ShoppingListModelToLocal, QQueryProperty> {
  QueryBuilder<ShoppingListModelToLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShoppingListModelToLocal, String, QQueryOperations> nameListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameList');
    });
  }

  QueryBuilder<ShoppingListModelToLocal, List<String>, QQueryOperations>
      productsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'products');
    });
  }

  QueryBuilder<ShoppingListModelToLocal, int, QQueryOperations>
      totalProductsCounterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalProductsCounter');
    });
  }

  QueryBuilder<ShoppingListModelToLocal, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
