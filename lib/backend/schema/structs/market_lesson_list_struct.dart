// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketLessonListStruct extends BaseStruct {
  MarketLessonListStruct({
    int? estimateInDay,
    String? organizationId,
    String? id,
    String? status,
    String? name,
    String? description,
    int? durationHours,
    int? template,
    List<LessonMarketStruct>? lessions,
    List<TestsMarketStruct>? tests,
    String? price,
    AuthorIdMarketStruct? authorId,
    DomainsIdStruct? domainId,
    String? imageCover,
    int? orderCount,
    List<ReactsMarketStruct>? reacts,
    CategoryIdStruct? categoryId,
  })  : _estimateInDay = estimateInDay,
        _organizationId = organizationId,
        _id = id,
        _status = status,
        _name = name,
        _description = description,
        _durationHours = durationHours,
        _template = template,
        _lessions = lessions,
        _tests = tests,
        _price = price,
        _authorId = authorId,
        _domainId = domainId,
        _imageCover = imageCover,
        _orderCount = orderCount,
        _reacts = reacts,
        _categoryId = categoryId;

  // "estimate_in_day" field.
  int? _estimateInDay;
  int get estimateInDay => _estimateInDay ?? 0;
  set estimateInDay(int? val) => _estimateInDay = val;
  void incrementEstimateInDay(int amount) =>
      _estimateInDay = estimateInDay + amount;
  bool hasEstimateInDay() => _estimateInDay != null;

  // "organization_id" field.
  String? _organizationId;
  String get organizationId => _organizationId ?? '';
  set organizationId(String? val) => _organizationId = val;
  bool hasOrganizationId() => _organizationId != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "duration_hours" field.
  int? _durationHours;
  int get durationHours => _durationHours ?? 0;
  set durationHours(int? val) => _durationHours = val;
  void incrementDurationHours(int amount) =>
      _durationHours = durationHours + amount;
  bool hasDurationHours() => _durationHours != null;

  // "template" field.
  int? _template;
  int get template => _template ?? 0;
  set template(int? val) => _template = val;
  void incrementTemplate(int amount) => _template = template + amount;
  bool hasTemplate() => _template != null;

  // "lessions" field.
  List<LessonMarketStruct>? _lessions;
  List<LessonMarketStruct> get lessions => _lessions ?? const [];
  set lessions(List<LessonMarketStruct>? val) => _lessions = val;
  void updateLessions(Function(List<LessonMarketStruct>) updateFn) =>
      updateFn(_lessions ??= []);
  bool hasLessions() => _lessions != null;

  // "tests" field.
  List<TestsMarketStruct>? _tests;
  List<TestsMarketStruct> get tests => _tests ?? const [];
  set tests(List<TestsMarketStruct>? val) => _tests = val;
  void updateTests(Function(List<TestsMarketStruct>) updateFn) =>
      updateFn(_tests ??= []);
  bool hasTests() => _tests != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;
  bool hasPrice() => _price != null;

  // "author_id" field.
  AuthorIdMarketStruct? _authorId;
  AuthorIdMarketStruct get authorId => _authorId ?? AuthorIdMarketStruct();
  set authorId(AuthorIdMarketStruct? val) => _authorId = val;
  void updateAuthorId(Function(AuthorIdMarketStruct) updateFn) =>
      updateFn(_authorId ??= AuthorIdMarketStruct());
  bool hasAuthorId() => _authorId != null;

  // "domain_id" field.
  DomainsIdStruct? _domainId;
  DomainsIdStruct get domainId => _domainId ?? DomainsIdStruct();
  set domainId(DomainsIdStruct? val) => _domainId = val;
  void updateDomainId(Function(DomainsIdStruct) updateFn) =>
      updateFn(_domainId ??= DomainsIdStruct());
  bool hasDomainId() => _domainId != null;

  // "image_cover" field.
  String? _imageCover;
  String get imageCover => _imageCover ?? '';
  set imageCover(String? val) => _imageCover = val;
  bool hasImageCover() => _imageCover != null;

  // "order_count" field.
  int? _orderCount;
  int get orderCount => _orderCount ?? 0;
  set orderCount(int? val) => _orderCount = val;
  void incrementOrderCount(int amount) => _orderCount = orderCount + amount;
  bool hasOrderCount() => _orderCount != null;

  // "reacts" field.
  List<ReactsMarketStruct>? _reacts;
  List<ReactsMarketStruct> get reacts => _reacts ?? const [];
  set reacts(List<ReactsMarketStruct>? val) => _reacts = val;
  void updateReacts(Function(List<ReactsMarketStruct>) updateFn) =>
      updateFn(_reacts ??= []);
  bool hasReacts() => _reacts != null;

  // "category_id" field.
  CategoryIdStruct? _categoryId;
  CategoryIdStruct get categoryId => _categoryId ?? CategoryIdStruct();
  set categoryId(CategoryIdStruct? val) => _categoryId = val;
  void updateCategoryId(Function(CategoryIdStruct) updateFn) =>
      updateFn(_categoryId ??= CategoryIdStruct());
  bool hasCategoryId() => _categoryId != null;

  static MarketLessonListStruct fromMap(Map<String, dynamic> data) =>
      MarketLessonListStruct(
        estimateInDay: castToType<int>(data['estimate_in_day']),
        organizationId: data['organization_id'] as String?,
        id: data['id'] as String?,
        status: data['status'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        durationHours: castToType<int>(data['duration_hours']),
        template: castToType<int>(data['template']),
        lessions: getStructList(
          data['lessions'],
          LessonMarketStruct.fromMap,
        ),
        tests: getStructList(
          data['tests'],
          TestsMarketStruct.fromMap,
        ),
        price: data['price'] as String?,
        authorId: AuthorIdMarketStruct.maybeFromMap(data['author_id']),
        domainId: DomainsIdStruct.maybeFromMap(data['domain_id']),
        imageCover: data['image_cover'] as String?,
        orderCount: castToType<int>(data['order_count']),
        reacts: getStructList(
          data['reacts'],
          ReactsMarketStruct.fromMap,
        ),
        categoryId: CategoryIdStruct.maybeFromMap(data['category_id']),
      );

  static MarketLessonListStruct? maybeFromMap(dynamic data) => data is Map
      ? MarketLessonListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'estimate_in_day': _estimateInDay,
        'organization_id': _organizationId,
        'id': _id,
        'status': _status,
        'name': _name,
        'description': _description,
        'duration_hours': _durationHours,
        'template': _template,
        'lessions': _lessions?.map((e) => e.toMap()).toList(),
        'tests': _tests?.map((e) => e.toMap()).toList(),
        'price': _price,
        'author_id': _authorId?.toMap(),
        'domain_id': _domainId?.toMap(),
        'image_cover': _imageCover,
        'order_count': _orderCount,
        'reacts': _reacts?.map((e) => e.toMap()).toList(),
        'category_id': _categoryId?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estimate_in_day': serializeParam(
          _estimateInDay,
          ParamType.int,
        ),
        'organization_id': serializeParam(
          _organizationId,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration_hours': serializeParam(
          _durationHours,
          ParamType.int,
        ),
        'template': serializeParam(
          _template,
          ParamType.int,
        ),
        'lessions': serializeParam(
          _lessions,
          ParamType.DataStruct,
          true,
        ),
        'tests': serializeParam(
          _tests,
          ParamType.DataStruct,
          true,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'author_id': serializeParam(
          _authorId,
          ParamType.DataStruct,
        ),
        'domain_id': serializeParam(
          _domainId,
          ParamType.DataStruct,
        ),
        'image_cover': serializeParam(
          _imageCover,
          ParamType.String,
        ),
        'order_count': serializeParam(
          _orderCount,
          ParamType.int,
        ),
        'reacts': serializeParam(
          _reacts,
          ParamType.DataStruct,
          true,
        ),
        'category_id': serializeParam(
          _categoryId,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MarketLessonListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MarketLessonListStruct(
        estimateInDay: deserializeParam(
          data['estimate_in_day'],
          ParamType.int,
          false,
        ),
        organizationId: deserializeParam(
          data['organization_id'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        durationHours: deserializeParam(
          data['duration_hours'],
          ParamType.int,
          false,
        ),
        template: deserializeParam(
          data['template'],
          ParamType.int,
          false,
        ),
        lessions: deserializeStructParam<LessonMarketStruct>(
          data['lessions'],
          ParamType.DataStruct,
          true,
          structBuilder: LessonMarketStruct.fromSerializableMap,
        ),
        tests: deserializeStructParam<TestsMarketStruct>(
          data['tests'],
          ParamType.DataStruct,
          true,
          structBuilder: TestsMarketStruct.fromSerializableMap,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        authorId: deserializeStructParam(
          data['author_id'],
          ParamType.DataStruct,
          false,
          structBuilder: AuthorIdMarketStruct.fromSerializableMap,
        ),
        domainId: deserializeStructParam(
          data['domain_id'],
          ParamType.DataStruct,
          false,
          structBuilder: DomainsIdStruct.fromSerializableMap,
        ),
        imageCover: deserializeParam(
          data['image_cover'],
          ParamType.String,
          false,
        ),
        orderCount: deserializeParam(
          data['order_count'],
          ParamType.int,
          false,
        ),
        reacts: deserializeStructParam<ReactsMarketStruct>(
          data['reacts'],
          ParamType.DataStruct,
          true,
          structBuilder: ReactsMarketStruct.fromSerializableMap,
        ),
        categoryId: deserializeStructParam(
          data['category_id'],
          ParamType.DataStruct,
          false,
          structBuilder: CategoryIdStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MarketLessonListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MarketLessonListStruct &&
        estimateInDay == other.estimateInDay &&
        organizationId == other.organizationId &&
        id == other.id &&
        status == other.status &&
        name == other.name &&
        description == other.description &&
        durationHours == other.durationHours &&
        template == other.template &&
        listEquality.equals(lessions, other.lessions) &&
        listEquality.equals(tests, other.tests) &&
        price == other.price &&
        authorId == other.authorId &&
        domainId == other.domainId &&
        imageCover == other.imageCover &&
        orderCount == other.orderCount &&
        listEquality.equals(reacts, other.reacts) &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        estimateInDay,
        organizationId,
        id,
        status,
        name,
        description,
        durationHours,
        template,
        lessions,
        tests,
        price,
        authorId,
        domainId,
        imageCover,
        orderCount,
        reacts,
        categoryId
      ]);
}

MarketLessonListStruct createMarketLessonListStruct({
  int? estimateInDay,
  String? organizationId,
  String? id,
  String? status,
  String? name,
  String? description,
  int? durationHours,
  int? template,
  String? price,
  AuthorIdMarketStruct? authorId,
  DomainsIdStruct? domainId,
  String? imageCover,
  int? orderCount,
  CategoryIdStruct? categoryId,
}) =>
    MarketLessonListStruct(
      estimateInDay: estimateInDay,
      organizationId: organizationId,
      id: id,
      status: status,
      name: name,
      description: description,
      durationHours: durationHours,
      template: template,
      price: price,
      authorId: authorId ?? AuthorIdMarketStruct(),
      domainId: domainId ?? DomainsIdStruct(),
      imageCover: imageCover,
      orderCount: orderCount,
      categoryId: categoryId ?? CategoryIdStruct(),
    );
