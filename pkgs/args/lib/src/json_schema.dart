// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Copied from https://github.com/dart-lang/ai/blob/failures-only/pkgs/dart_mcp/lib/src/api/tools.dart

/// The valid types for properties in a JSON-RCP2 schema.
enum JsonType {
  object('object'),
  list('array'),
  string('string'),
  num('number'),
  int('integer'),
  bool('boolean'),
  nil('null');

  const JsonType(this.typeName);

  final String typeName;
}

/// A JSON Schema object defining the any kind of property.
///
/// See the subtypes [ObjectSchema], [ListSchema], [StringSchema],
/// [NumberSchema], [IntegerSchema], [BooleanSchema], [NullSchema].
///
/// To get an instance of a subtype, you should inspect the [type] as well as
/// check for any schema combinators ([allOf], [anyOf], [oneOf], [not]), as both
/// may be present.
///
/// If a [type] is provided, it applies to all sub-schemas, and you can cast all
/// the sub-schemas directly to the specified type from the parent schema.
///
/// See https://json-schema.org/understanding-json-schema/reference for the full
/// specification.
///
/// **Note:** Only a subset of the json schema spec is supported by these types,
/// if you need something more complex you can create your own
/// `Map<String, Object?>` and cast it to [Schema] (or [ObjectSchema]) directly.
extension type Schema.fromMap(Map<String, Object?> _value) {
  /// A combined schema, see
  /// https://json-schema.org/understanding-json-schema/reference/combining#schema-composition
  factory Schema.combined({
    JsonType? type,
    String? title,
    String? description,
    List<Schema>? allOf,
    List<Schema>? anyOf,
    List<Schema>? oneOf,
    List<Schema>? not,
  }) =>
      Schema.fromMap({
        if (type != null) 'type': type.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (allOf != null) 'allOf': allOf,
        if (anyOf != null) 'anyOf': anyOf,
        if (oneOf != null) 'oneOf': oneOf,
        if (not != null) 'not': not,
      });

  /// Alias for [StringSchema.new].
  static const string = StringSchema.new;

  /// Alias for [BooleanSchema.new].
  static const bool = BooleanSchema.new;

  /// Alias for [NumberSchema.new].
  static const num = NumberSchema.new;

  /// Alias for [IntegerSchema.new].
  static const int = IntegerSchema.new;

  /// Alias for [ListSchema.new].
  static const list = ListSchema.new;

  /// Alias for [ObjectSchema.new].
  static const object = ObjectSchema.new;

  /// Alias for [NullSchema.new].
  static const nil = NullSchema.new;

  /// The [JsonType] of this schema, if present.
  ///
  /// Use this in switch statements to determine the type of schema and cast to
  /// the appropriate subtype.
  ///
  /// Note that it is good practice to include a default case, to avoid breakage
  /// in the case that a new type is added.
  ///
  /// This is not required, and commonly won't be present if one of the schema
  /// combinators ([allOf], [anyOf], [oneOf], or [not]) are used.
  JsonType? get type => JsonType.values
      .where(
        (t) => (_value['type'] as String? ?? '') == t.typeName,
      )
      .firstOrNull;

  /// A title for this schema, should be short.
  String? get title => _value['title'] as String?;

  /// A description of this schema.
  String? get description => _value['description'] as String?;

  /// Schema combinator that requires all sub-schemas to match.
  List<Schema>? get allOf => (_value['allOf'] as List?)?.cast<Schema>();

  /// Schema combinator that requires at least one of the sub-schemas to match.
  List<Schema>? get anyOf => (_value['anyOf'] as List?)?.cast<Schema>();

  /// Schema combinator that requires exactly one of the sub-schemas to match.
  List<Schema>? get oneOf => (_value['oneOf'] as List?)?.cast<Schema>();

  /// Schema combinator that requires none of the sub-schemas to match.
  List<Schema>? get not => (_value['not'] as List?)?.cast<Schema>();

  Map<String, Object?> asMap() => _value;
}

/// A JSON Schema definition for an object with properties.
///
/// `ObjectSchema` is used to define the expected structure, data types, and
/// constraints for MCP argument objects. It allows you to specify:
///
/// - Which properties an object can or must have ([properties], [required]).
/// - The schema for each of those properties (e.g., string, number, nested
///   object).
/// - Whether additional properties not explicitly defined are allowed
///   ([additionalProperties], [unevaluatedProperties]).
/// - Constraints on the number of properties ([minProperties],
///   [maxProperties]).
/// - Constraints on property names ([propertyNames]).
///
/// See https://json-schema.org/understanding-json-schema/reference/object.html
/// for more details on object schemas.
///
/// Example:
///
/// To define a schema for a product object that requires `productId` and
/// `productName`, has an optional `price` (non-negative number) and optional
/// `tags` (list of unique strings), and optional `dimensions` (an object with
/// required numeric length, width, and height):
///
/// ```dart
/// final productSchema = ObjectSchema(
///   title: 'Product',
///   description: 'Schema for a product object',
///   required: ['productId', 'productName'],
///   properties: {
///     'productId': Schema.string(
///       description: 'Unique identifier for the product',
///     ),
///     'productName': Schema.string(description: 'Name of the product'),
///     'price': Schema.num(
///       description: 'Price of the product',
///       minimum: 0,
///     ),
///     'tags': Schema.list(
///       description: 'Optional list of tags for the product',
///       items: Schema.string(),
///       uniqueItems: true,
///     ),
///     'dimensions': ObjectSchema(
///       description: 'Optional product dimensions',
///       properties: {
///         'length': Schema.num(),
///         'width': Schema.num(),
///         'height': Schema.num(),
///       },
///       required: ['length', 'width', 'height'],
///     ),
///   },
///   additionalProperties: false, // No other properties allowed beyond those defined
/// );
/// ```
///
/// This schema can then be used with the `validate` method to check if a given
/// JSON-like map conforms to the defined structure.
///
/// For example, valid data might look like:
///
/// ```json
/// {
///   "productId": "ABC12345",
///   "productName": "Super Widget",
///   "price": 19.99,
///   "tags": ["electronics", "gadget"],
///   "dimensions": {"length": 10, "width": 5, "height": 2.5}
/// }
/// ```
///
/// And invalid data (e.g., missing productName, or an extra undefined
/// property):
/// ```json
/// {
///   "productId": "XYZ67890",
///   "price": 9.99
/// }
/// ```
///
/// ```json
/// {
///   "productId": "DEF4567",
///   "productName": "Another Gadget",
///   "color": "blue" // Invalid if additionalProperties is false
/// }
/// ```
extension type ObjectSchema.fromMap(Map<String, Object?> _value)
    implements Schema {
  factory ObjectSchema({
    String? title,
    String? description,
    Map<String, Schema>? properties,
    Map<String, Schema>? patternProperties,
    List<String>? required,

    /// Must be one of bool, Schema, or Null
    Object? additionalProperties,
    bool? unevaluatedProperties,
    StringSchema? propertyNames,
    int? minProperties,
    int? maxProperties,
  }) =>
      ObjectSchema.fromMap({
        'type': JsonType.object.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (properties != null) 'properties': properties,
        if (patternProperties != null) 'patternProperties': patternProperties,
        if (required != null) 'required': required,
        if (additionalProperties != null)
          'additionalProperties': additionalProperties,
        if (unevaluatedProperties != null)
          'unevaluatedProperties': unevaluatedProperties,
        if (propertyNames != null) 'propertyNames': propertyNames,
        if (minProperties != null) 'minProperties': minProperties,
        if (maxProperties != null) 'maxProperties': maxProperties,
      });

  /// A map of the properties of the object to the nested [Schema]s for those
  /// properties.
  Map<String, Schema>? get properties =>
      (_value['properties'] as Map?)?.cast<String, Schema>();

  /// A map of the property patterns of the object to the nested [Schema]s for
  /// those properties.
  ///
  /// For example, to define a schema where any property name starting with
  /// "x-" should have a string value:
  ///
  /// ```dart
  /// final schema = ObjectSchema(patternProperties: {r'^x-': Schema.string()});
  /// ```
  ///
  Map<String, Schema>? get patternProperties =>
      (_value['patternProperties'] as Map?)?.cast<String, Schema>();

  /// A list of the required properties by name.
  ///
  /// For example, to define a schema for an object that requires a `name`
  /// property:
  ///
  /// ```dart
  /// final schema = ObjectSchema(
  ///   required: ['name'],
  ///   properties: {'name': Schema.string()},
  /// );
  /// ```
  ///
  /// In this schema, an object like `{'name': 'John'}` would be valid, but
  /// `{}` or `{'age': 30}` would be invalid because they do not contain the
  /// required `name` property. Note that the type of the `name` property is
  /// also defined using the `properties` field; `required` only enforces the
  /// presence of the property, not its type or value, which are handled by
  /// the corresponding schema in the `properties` map (if provided, otherwise
  /// any value is accepted).
  ///
  /// Properties in this list must be set in the object.
  List<String>? get required => (_value['required'] as List?)?.cast<String>();

  /// Rules for additional properties that don't match the
  /// [properties] or [patternProperties] schemas.
  ///
  /// Can be either a [bool] or a [Schema], if it is a [Schema] then additional
  /// properties should match that [Schema].
  ///
  /// For example, to define a schema where any property not explicitly defined
  /// in `properties` should have an integer value:
  ///
  /// ```dart
  /// final schema = ObjectSchema(
  ///   properties: {'name': Schema.string()},
  ///   additionalProperties: Schema.int(),
  /// );
  /// ```
  ///
  /// In this schema, an object like `{'name': 'John', 'age': 30}` would be
  /// valid, but `{'name': 'John', 'age': 'thirty'}` would be invalid because
  /// `age` is not a defined property and its value is not an integer as
  /// required by `additionalProperties`.
  Object? get additionalProperties => _value['additionalProperties'];

  /// Similar to [additionalProperties] but more flexible, see
  /// https://json-schema.org/understanding-json-schema/reference/object#unevaluatedproperties
  /// for more details.
  ///
  /// For example, to define a schema where any property not explicitly defined
  /// in `properties` or matched by `patternProperties` is disallowed:
  ///
  /// ```dart
  /// final schema = ObjectSchema(
  ///   properties: {'name': Schema.string()},
  ///   patternProperties: {r'^x-': Schema.string()},
  ///   unevaluatedProperties: false,
  /// );
  /// ```
  ///
  /// In this schema, an object like `{'name': 'John', 'x-id': '123'}` would be
  /// valid, but `{'name': 'John', 'age': 30}` would be invalid because `age` is
  /// neither a defined property nor matches the pattern, and
  /// `unevaluatedProperties` is set to `false`.
  bool? get unevaluatedProperties => _value['unevaluatedProperties'] as bool?;

  /// A list of valid patterns for all property names.
  ///
  /// For example, to define a schema where all property names must start with
  /// a lowercase letter:
  ///
  /// ```dart
  /// final schema = ObjectSchema(
  ///   propertyNames: Schema.string(pattern: r'^[a-z].*$'),
  /// );
  /// ```
  ///
  /// In this schema, an object like `{'name': 'John', 'age': 30}` would be
  /// valid, but `{'Name': 'John', 'Age': 30}` would be invalid because the
  /// property names do not start with a lowercase letter.
  StringSchema? get propertyNames =>
      (_value['propertyNames'] as Map?)?.cast<String, Object?>()
          as StringSchema?;

  /// The minimum number of properties in this object.
  ///
  /// If the object has less than this many properties, it will be invalid.
  int? get minProperties => _value['minProperties'] as int?;

  /// The maximum number of properties in this object.
  ///
  /// If the object has more than this many properties, it will be invalid.
  int? get maxProperties => _value['maxProperties'] as int?;
}

/// A JSON Schema definition for a String.
extension type const StringSchema.fromMap(Map<String, Object?> _value)
    implements Schema {
  factory StringSchema({
    String? title,
    String? description,
    int? minLength,
    int? maxLength,
    String? pattern,
  }) =>
      StringSchema.fromMap({
        'type': JsonType.string.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (minLength != null) 'minLength': minLength,
        if (maxLength != null) 'maxLength': maxLength,
        if (pattern != null) 'pattern': pattern,
      });

  /// The minimum allowed length of this String.
  int? get minLength => _value['minLength'] as int?;

  /// The maximum allowed length of this String.
  int? get maxLength => _value['maxLength'] as int?;

  /// A regular expression pattern that the String must match.
  String? get pattern => _value['pattern'] as String?;
}

/// A JSON Schema definition for a [num].
extension type NumberSchema.fromMap(Map<String, Object?> _value)
    implements Schema {
  factory NumberSchema({
    String? title,
    String? description,
    num? minimum,
    num? maximum,
    num? exclusiveMinimum,
    num? exclusiveMaximum,
    num? multipleOf,
  }) =>
      NumberSchema.fromMap({
        'type': JsonType.num.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (minimum != null) 'minimum': minimum,
        if (maximum != null) 'maximum': maximum,
        if (exclusiveMinimum != null) 'exclusiveMinimum': exclusiveMinimum,
        if (exclusiveMaximum != null) 'exclusiveMaximum': exclusiveMaximum,
        if (multipleOf != null) 'multipleOf': multipleOf,
      });

  /// The minimum value (inclusive) for this number.
  num? get minimum => _value['minimum'] as num?;

  /// The maximum value (inclusive) for this number.
  num? get maximum => _value['maximum'] as num?;

  /// The minimum value (exclusive) for this number.
  num? get exclusiveMinimum => _value['exclusiveMinimum'] as num?;

  /// The maximum value (exclusive) for this number.
  num? get exclusiveMaximum => _value['exclusiveMaximum'] as num?;

  /// The value must be a multiple of this number.
  num? get multipleOf => _value['multipleOf'] as num?;
}

/// A JSON Schema definition for an [int].
extension type IntegerSchema.fromMap(Map<String, Object?> _value)
    implements Schema {
  factory IntegerSchema({
    String? title,
    String? description,
    int? minimum,
    int? maximum,
    int? exclusiveMinimum,
    int? exclusiveMaximum,
    num? multipleOf,
  }) =>
      IntegerSchema.fromMap({
        'type': JsonType.int.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (minimum != null) 'minimum': minimum,
        if (maximum != null) 'maximum': maximum,
        if (exclusiveMinimum != null) 'exclusiveMinimum': exclusiveMinimum,
        if (exclusiveMaximum != null) 'exclusiveMaximum': exclusiveMaximum,
        if (multipleOf != null) 'multipleOf': multipleOf,
      });

  /// The minimum value (inclusive) for this integer.
  int? get minimum => _value['minimum'] as int?;

  /// The maximum value (inclusive) for this integer.
  int? get maximum => _value['maximum'] as int?;

  /// The minimum value (exclusive) for this integer.
  int? get exclusiveMinimum => _value['exclusiveMinimum'] as int?;

  /// The maximum value (exclusive) for this integer.
  int? get exclusiveMaximum => _value['exclusiveMaximum'] as int?;

  /// The value must be a multiple of this number.
  num? get multipleOf => _value['multipleOf'] as num?;
}

/// A JSON Schema definition for a [bool].
extension type BooleanSchema.fromMap(Map<String, Object?> _value)
    implements Schema {
  factory BooleanSchema({String? title, String? description}) =>
      BooleanSchema.fromMap({
        'type': JsonType.bool.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
      });
}

/// A JSON Schema definition for `null`.
extension type NullSchema.fromMap(Map<String, Object?> _value)
    implements Schema {
  factory NullSchema({String? title, String? description}) =>
      NullSchema.fromMap({
        'type': JsonType.nil.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
      });
}

/// A JSON Schema definition for a [List].
extension type ListSchema.fromMap(Map<String, Object?> _value)
    implements Schema {
  factory ListSchema({
    String? title,
    String? description,
    Schema? items,
    List<Schema>? prefixItems,
    bool? unevaluatedItems,
    int? minItems,
    int? maxItems,
    bool? uniqueItems,
  }) =>
      ListSchema.fromMap({
        'type': JsonType.list.typeName,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (items != null) 'items': items,
        if (prefixItems != null) 'prefixItems': prefixItems,
        if (unevaluatedItems != null) 'unevaluatedItems': unevaluatedItems,
        if (minItems != null) 'minItems': minItems,
        if (maxItems != null) 'maxItems': maxItems,
        if (uniqueItems != null) 'uniqueItems': uniqueItems,
      });

  /// The schema for all the items in this list, or all those after
  /// [prefixItems] (if present).
  ///
  /// For example, to define a schema for a list where all items must be
  /// strings:
  ///
  /// ```dart
  /// final schema = ListSchema(items: Schema.string());
  /// ```
  ///
  /// In this schema, a list like `['apple', 'banana', 'cherry']` would be
  /// valid, but `['apple', 42, 'cherry']` would be invalid because it
  /// contains a non-string item.
  ///
  /// Note that if you want to define a schema for a list where the initial
  /// items have specific types and the remaining items follow a different
  /// schema, you can use the `prefixItems` property in conjunction with
  /// `items`. For example, to allow a string followed by an integer, and
  /// then any number of booleans:
  ///
  /// ```dart
  /// final schema = ListSchema(
  ///   prefixItems: [Schema.string(), Schema.int()],
  ///   items: Schema.bool(),
  /// );
  /// ```
  Schema? get items => _value['items'] as Schema?;

  /// The schema for the initial items in this list, if specified.
  ///
  /// For example, to define a schema for a list where the first item must be
  /// a string and the second item must be an integer:
  ///
  /// ```dart
  /// final schema = ListSchema(
  ///   prefixItems: [Schema.string(), Schema.int()],
  /// );
  /// ```
  ///
  /// In this schema, a list like `['hello', 42]` would be valid, but
  /// `[42, 'hello']` or `['hello']` would be invalid because they do not
  /// conform to the specified order and types of the prefix items.
  ///
  /// Note that if you want to allow additional items in the list that do not
  /// match the prefix items, you can use the `items` property to define a
  /// schema for those additional items. For example, to allow any number of
  /// additional strings after the initial string and integer:
  ///
  /// ```dart
  /// final schema = ListSchema(
  ///   prefixItems: [Schema.string(), Schema.int()],
  ///   items: Schema.string()
  /// );
  /// ```
  List<Schema>? get prefixItems =>
      (_value['prefixItems'] as List?)?.cast<Schema>();

  /// Whether or not  additional items in the list are allowed that don't
  /// match the [items] or [prefixItems] schemas.
  ///
  /// For example, to define a schema for a list where only items matching
  /// `prefixItems` or `items` are allowed:
  ///
  /// ```dart
  /// final schema = ListSchema(
  ///   prefixItems: [Schema.string(), Schema.int()],
  ///   items: Schema.bool(),
  ///   unevaluatedItems: false,
  /// );
  /// ```
  ///
  /// In this schema, a list like `['hello', 42, true]` would be valid, but
  /// `['hello', 42, true, 123]` would be invalid because the last item does
  /// not match the schema defined by `items` (which applies to items
  /// beyond those covered by `prefixItems`), and `unevaluatedItems` is set
  /// to `false`, disallowing any items not explicitly matched by the
  /// schema.
  bool? get unevaluatedItems => _value['unevaluatedItems'] as bool?;

  /// The minimum number of items in this list.
  int? get minItems => _value['minItems'] as int?;

  /// The maximum number of items in this list.
  int? get maxItems => _value['maxItems'] as int?;

  /// Whether or not all the items in this list must be unique.
  ///
  /// For example, to define a schema for a list where all items must be
  /// unique:
  ///
  /// ```dart
  /// final schema = ListSchema(
  ///   items: Schema.string(),
  ///   uniqueItems: true,
  /// );
  /// ```
  ///
  /// In this schema, a list like `['apple', 'banana', 'cherry']` would be
  /// valid, but `['apple', 'banana', 'apple']` would be invalid because it
  /// contains duplicate items. Note that the type of the items is also
  /// defined using the `items` property; `uniqueItems` only enforces the
  /// uniqueness of the items, not their type or value, which are handled by
  /// the corresponding schema in the `items` property.
  bool? get uniqueItems => _value['uniqueItems'] as bool?;
}
