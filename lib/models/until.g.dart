// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'until.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUntilCollection on Isar {
  IsarCollection<Until> get untils => this.collection();
}

const UntilSchema = CollectionSchema(
  name: r'Until',
  id: 6631315795742780038,
  properties: {
    r'couleur': PropertySchema(
      id: 0,
      name: r'couleur',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'event': PropertySchema(
      id: 2,
      name: r'event',
      type: IsarType.string,
    ),
    r'finished': PropertySchema(
      id: 3,
      name: r'finished',
      type: IsarType.bool,
    )
  },
  estimateSize: _untilEstimateSize,
  serialize: _untilSerialize,
  deserialize: _untilDeserialize,
  deserializeProp: _untilDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _untilGetId,
  getLinks: _untilGetLinks,
  attach: _untilAttach,
  version: '3.1.0+1',
);

int _untilEstimateSize(
  Until object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.couleur.length * 3;
  bytesCount += 3 + object.event.length * 3;
  return bytesCount;
}

void _untilSerialize(
  Until object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.couleur);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.event);
  writer.writeBool(offsets[3], object.finished);
}

Until _untilDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Until(
    reader.readString(offsets[2]),
    reader.readDateTime(offsets[1]),
    reader.readString(offsets[0]),
    reader.readBool(offsets[3]),
  );
  object.id = id;
  return object;
}

P _untilDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _untilGetId(Until object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _untilGetLinks(Until object) {
  return [];
}

void _untilAttach(IsarCollection<dynamic> col, Id id, Until object) {
  object.id = id;
}

extension UntilQueryWhereSort on QueryBuilder<Until, Until, QWhere> {
  QueryBuilder<Until, Until, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UntilQueryWhere on QueryBuilder<Until, Until, QWhereClause> {
  QueryBuilder<Until, Until, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Until, Until, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Until, Until, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Until, Until, QAfterWhereClause> idBetween(
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

extension UntilQueryFilter on QueryBuilder<Until, Until, QFilterCondition> {
  QueryBuilder<Until, Until, QAfterFilterCondition> couleurEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'couleur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'couleur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'couleur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'couleur',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'couleur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'couleur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'couleur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'couleur',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'couleur',
        value: '',
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> couleurIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'couleur',
        value: '',
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'event',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'event',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'event',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'event',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'event',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'event',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'event',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'event',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'event',
        value: '',
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> eventIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'event',
        value: '',
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> finishedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'finished',
        value: value,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Until, Until, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Until, Until, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Until, Until, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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
}

extension UntilQueryObject on QueryBuilder<Until, Until, QFilterCondition> {}

extension UntilQueryLinks on QueryBuilder<Until, Until, QFilterCondition> {}

extension UntilQuerySortBy on QueryBuilder<Until, Until, QSortBy> {
  QueryBuilder<Until, Until, QAfterSortBy> sortByCouleur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couleur', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> sortByCouleurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couleur', Sort.desc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> sortByEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> sortByEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event', Sort.desc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> sortByFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finished', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> sortByFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finished', Sort.desc);
    });
  }
}

extension UntilQuerySortThenBy on QueryBuilder<Until, Until, QSortThenBy> {
  QueryBuilder<Until, Until, QAfterSortBy> thenByCouleur() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couleur', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByCouleurDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couleur', Sort.desc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByEvent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByEventDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'event', Sort.desc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finished', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'finished', Sort.desc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Until, Until, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension UntilQueryWhereDistinct on QueryBuilder<Until, Until, QDistinct> {
  QueryBuilder<Until, Until, QDistinct> distinctByCouleur(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'couleur', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Until, Until, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Until, Until, QDistinct> distinctByEvent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'event', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Until, Until, QDistinct> distinctByFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'finished');
    });
  }
}

extension UntilQueryProperty on QueryBuilder<Until, Until, QQueryProperty> {
  QueryBuilder<Until, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Until, String, QQueryOperations> couleurProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'couleur');
    });
  }

  QueryBuilder<Until, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Until, String, QQueryOperations> eventProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'event');
    });
  }

  QueryBuilder<Until, bool, QQueryOperations> finishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'finished');
    });
  }
}
