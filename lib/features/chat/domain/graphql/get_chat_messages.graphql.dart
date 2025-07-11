import '../../../../core/graphql/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Query$GetChatMessages {
  factory Variables$Query$GetChatMessages({
    required String chatId,
    String? before,
    int? last,
  }) =>
      Variables$Query$GetChatMessages._({
        r'chatId': chatId,
        if (before != null) r'before': before,
        if (last != null) r'last': last,
      });

  Variables$Query$GetChatMessages._(this._$data);

  factory Variables$Query$GetChatMessages.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chatId = data['chatId'];
    result$data['chatId'] = (l$chatId as String);
    if (data.containsKey('before')) {
      final l$before = data['before'];
      result$data['before'] = (l$before as String?);
    }
    if (data.containsKey('last')) {
      final l$last = data['last'];
      result$data['last'] = (l$last as int?);
    }
    return Variables$Query$GetChatMessages._(result$data);
  }

  Map<String, dynamic> _$data;

  String get chatId => (_$data['chatId'] as String);

  String? get before => (_$data['before'] as String?);

  int? get last => (_$data['last'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chatId = chatId;
    result$data['chatId'] = l$chatId;
    if (_$data.containsKey('before')) {
      final l$before = before;
      result$data['before'] = l$before;
    }
    if (_$data.containsKey('last')) {
      final l$last = last;
      result$data['last'] = l$last;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetChatMessages<Variables$Query$GetChatMessages>
      get copyWith => CopyWith$Variables$Query$GetChatMessages(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetChatMessages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatId = chatId;
    final lOther$chatId = other.chatId;
    if (l$chatId != lOther$chatId) {
      return false;
    }
    final l$before = before;
    final lOther$before = other.before;
    if (_$data.containsKey('before') != other._$data.containsKey('before')) {
      return false;
    }
    if (l$before != lOther$before) {
      return false;
    }
    final l$last = last;
    final lOther$last = other.last;
    if (_$data.containsKey('last') != other._$data.containsKey('last')) {
      return false;
    }
    if (l$last != lOther$last) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chatId = chatId;
    final l$before = before;
    final l$last = last;
    return Object.hashAll([
      l$chatId,
      _$data.containsKey('before') ? l$before : const {},
      _$data.containsKey('last') ? l$last : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetChatMessages<TRes> {
  factory CopyWith$Variables$Query$GetChatMessages(
    Variables$Query$GetChatMessages instance,
    TRes Function(Variables$Query$GetChatMessages) then,
  ) = _CopyWithImpl$Variables$Query$GetChatMessages;

  factory CopyWith$Variables$Query$GetChatMessages.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetChatMessages;

  TRes call({
    String? chatId,
    String? before,
    int? last,
  });
}

class _CopyWithImpl$Variables$Query$GetChatMessages<TRes>
    implements CopyWith$Variables$Query$GetChatMessages<TRes> {
  _CopyWithImpl$Variables$Query$GetChatMessages(
    this._instance,
    this._then,
  );

  final Variables$Query$GetChatMessages _instance;

  final TRes Function(Variables$Query$GetChatMessages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chatId = _undefined,
    Object? before = _undefined,
    Object? last = _undefined,
  }) =>
      _then(Variables$Query$GetChatMessages._({
        ..._instance._$data,
        if (chatId != _undefined && chatId != null)
          'chatId': (chatId as String),
        if (before != _undefined) 'before': (before as String?),
        if (last != _undefined) 'last': (last as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetChatMessages<TRes>
    implements CopyWith$Variables$Query$GetChatMessages<TRes> {
  _CopyWithStubImpl$Variables$Query$GetChatMessages(this._res);

  TRes _res;

  call({
    String? chatId,
    String? before,
    int? last,
  }) =>
      _res;
}

class Query$GetChatMessages {
  Query$GetChatMessages({required this.getChatMessages});

  factory Query$GetChatMessages.fromJson(Map<String, dynamic> json) {
    final l$getChatMessages = json['getChatMessages'];
    return Query$GetChatMessages(
        getChatMessages: Query$GetChatMessages$getChatMessages.fromJson(
            (l$getChatMessages as Map<String, dynamic>)));
  }

  final Query$GetChatMessages$getChatMessages getChatMessages;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getChatMessages = getChatMessages;
    _resultData['getChatMessages'] = l$getChatMessages.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getChatMessages = getChatMessages;
    return Object.hashAll([l$getChatMessages]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetChatMessages || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getChatMessages = getChatMessages;
    final lOther$getChatMessages = other.getChatMessages;
    if (l$getChatMessages != lOther$getChatMessages) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetChatMessages on Query$GetChatMessages {
  CopyWith$Query$GetChatMessages<Query$GetChatMessages> get copyWith =>
      CopyWith$Query$GetChatMessages(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetChatMessages<TRes> {
  factory CopyWith$Query$GetChatMessages(
    Query$GetChatMessages instance,
    TRes Function(Query$GetChatMessages) then,
  ) = _CopyWithImpl$Query$GetChatMessages;

  factory CopyWith$Query$GetChatMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetChatMessages;

  TRes call({Query$GetChatMessages$getChatMessages? getChatMessages});
  CopyWith$Query$GetChatMessages$getChatMessages<TRes> get getChatMessages;
}

class _CopyWithImpl$Query$GetChatMessages<TRes>
    implements CopyWith$Query$GetChatMessages<TRes> {
  _CopyWithImpl$Query$GetChatMessages(
    this._instance,
    this._then,
  );

  final Query$GetChatMessages _instance;

  final TRes Function(Query$GetChatMessages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? getChatMessages = _undefined}) =>
      _then(Query$GetChatMessages(
          getChatMessages: getChatMessages == _undefined ||
                  getChatMessages == null
              ? _instance.getChatMessages
              : (getChatMessages as Query$GetChatMessages$getChatMessages)));

  CopyWith$Query$GetChatMessages$getChatMessages<TRes> get getChatMessages {
    final local$getChatMessages = _instance.getChatMessages;
    return CopyWith$Query$GetChatMessages$getChatMessages(
        local$getChatMessages, (e) => call(getChatMessages: e));
  }
}

class _CopyWithStubImpl$Query$GetChatMessages<TRes>
    implements CopyWith$Query$GetChatMessages<TRes> {
  _CopyWithStubImpl$Query$GetChatMessages(this._res);

  TRes _res;

  call({Query$GetChatMessages$getChatMessages? getChatMessages}) => _res;

  CopyWith$Query$GetChatMessages$getChatMessages<TRes> get getChatMessages =>
      CopyWith$Query$GetChatMessages$getChatMessages.stub(_res);
}

const documentNodeQueryGetChatMessages = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetChatMessages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'chatId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'before')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'last')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getChatMessages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'chatId'),
            value: VariableNode(name: NameNode(value: 'chatId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'before'),
            value: VariableNode(name: NameNode(value: 'before')),
          ),
          ArgumentNode(
            name: NameNode(value: 'last'),
            value: VariableNode(name: NameNode(value: 'last')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'userId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'content'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'createdAt'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'replyToId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'hasPreviousPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'startCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'endCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  ),
]);
Query$GetChatMessages _parserFn$Query$GetChatMessages(
        Map<String, dynamic> data) =>
    Query$GetChatMessages.fromJson(data);
typedef OnQueryComplete$Query$GetChatMessages = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetChatMessages?,
);

class Options$Query$GetChatMessages
    extends graphql.QueryOptions<Query$GetChatMessages> {
  Options$Query$GetChatMessages({
    String? operationName,
    required Variables$Query$GetChatMessages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetChatMessages? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetChatMessages? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetChatMessages(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetChatMessages,
          parserFn: _parserFn$Query$GetChatMessages,
        );

  final OnQueryComplete$Query$GetChatMessages? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetChatMessages
    extends graphql.WatchQueryOptions<Query$GetChatMessages> {
  WatchOptions$Query$GetChatMessages({
    String? operationName,
    required Variables$Query$GetChatMessages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetChatMessages? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetChatMessages,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetChatMessages,
        );
}

class FetchMoreOptions$Query$GetChatMessages extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetChatMessages({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetChatMessages variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetChatMessages,
        );
}

extension ClientExtension$Query$GetChatMessages on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetChatMessages>> query$GetChatMessages(
          Options$Query$GetChatMessages options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetChatMessages> watchQuery$GetChatMessages(
          WatchOptions$Query$GetChatMessages options) =>
      this.watchQuery(options);
  void writeQuery$GetChatMessages({
    required Query$GetChatMessages data,
    required Variables$Query$GetChatMessages variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetChatMessages),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetChatMessages? readQuery$GetChatMessages({
    required Variables$Query$GetChatMessages variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetChatMessages),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetChatMessages.fromJson(result);
  }
}

class Query$GetChatMessages$getChatMessages {
  Query$GetChatMessages$getChatMessages({
    required this.edges,
    required this.pageInfo,
    required this.totalCount,
  });

  factory Query$GetChatMessages$getChatMessages.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$totalCount = json['totalCount'];
    return Query$GetChatMessages$getChatMessages(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$GetChatMessages$getChatMessages$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$GetChatMessages$getChatMessages$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      totalCount: (l$totalCount as num).toDouble(),
    );
  }

  final List<Query$GetChatMessages$getChatMessages$edges> edges;

  final Query$GetChatMessages$getChatMessages$pageInfo pageInfo;

  final double totalCount;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$totalCount = totalCount;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$totalCount,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetChatMessages$getChatMessages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetChatMessages$getChatMessages
    on Query$GetChatMessages$getChatMessages {
  CopyWith$Query$GetChatMessages$getChatMessages<
          Query$GetChatMessages$getChatMessages>
      get copyWith => CopyWith$Query$GetChatMessages$getChatMessages(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetChatMessages$getChatMessages<TRes> {
  factory CopyWith$Query$GetChatMessages$getChatMessages(
    Query$GetChatMessages$getChatMessages instance,
    TRes Function(Query$GetChatMessages$getChatMessages) then,
  ) = _CopyWithImpl$Query$GetChatMessages$getChatMessages;

  factory CopyWith$Query$GetChatMessages$getChatMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetChatMessages$getChatMessages;

  TRes call({
    List<Query$GetChatMessages$getChatMessages$edges>? edges,
    Query$GetChatMessages$getChatMessages$pageInfo? pageInfo,
    double? totalCount,
  });
  TRes edges(
      Iterable<Query$GetChatMessages$getChatMessages$edges> Function(
              Iterable<
                  CopyWith$Query$GetChatMessages$getChatMessages$edges<
                      Query$GetChatMessages$getChatMessages$edges>>)
          _fn);
  CopyWith$Query$GetChatMessages$getChatMessages$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetChatMessages$getChatMessages<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages<TRes> {
  _CopyWithImpl$Query$GetChatMessages$getChatMessages(
    this._instance,
    this._then,
  );

  final Query$GetChatMessages$getChatMessages _instance;

  final TRes Function(Query$GetChatMessages$getChatMessages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? totalCount = _undefined,
  }) =>
      _then(Query$GetChatMessages$getChatMessages(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$GetChatMessages$getChatMessages$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$GetChatMessages$getChatMessages$pageInfo),
        totalCount: totalCount == _undefined || totalCount == null
            ? _instance.totalCount
            : (totalCount as double),
      ));

  TRes edges(
          Iterable<Query$GetChatMessages$getChatMessages$edges> Function(
                  Iterable<
                      CopyWith$Query$GetChatMessages$getChatMessages$edges<
                          Query$GetChatMessages$getChatMessages$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$GetChatMessages$getChatMessages$edges(
                    e,
                    (i) => i,
                  ))).toList());

  CopyWith$Query$GetChatMessages$getChatMessages$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetChatMessages$getChatMessages$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$GetChatMessages$getChatMessages<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages<TRes> {
  _CopyWithStubImpl$Query$GetChatMessages$getChatMessages(this._res);

  TRes _res;

  call({
    List<Query$GetChatMessages$getChatMessages$edges>? edges,
    Query$GetChatMessages$getChatMessages$pageInfo? pageInfo,
    double? totalCount,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$GetChatMessages$getChatMessages$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetChatMessages$getChatMessages$pageInfo.stub(_res);
}

class Query$GetChatMessages$getChatMessages$edges {
  Query$GetChatMessages$getChatMessages$edges({
    required this.cursor,
    required this.node,
  });

  factory Query$GetChatMessages$getChatMessages$edges.fromJson(
      Map<String, dynamic> json) {
    final l$cursor = json['cursor'];
    final l$node = json['node'];
    return Query$GetChatMessages$getChatMessages$edges(
      cursor: (l$cursor as String),
      node: Query$GetChatMessages$getChatMessages$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
    );
  }

  final String cursor;

  final Query$GetChatMessages$getChatMessages$edges$node node;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cursor = cursor;
    final l$node = node;
    return Object.hashAll([
      l$cursor,
      l$node,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetChatMessages$getChatMessages$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetChatMessages$getChatMessages$edges
    on Query$GetChatMessages$getChatMessages$edges {
  CopyWith$Query$GetChatMessages$getChatMessages$edges<
          Query$GetChatMessages$getChatMessages$edges>
      get copyWith => CopyWith$Query$GetChatMessages$getChatMessages$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetChatMessages$getChatMessages$edges<TRes> {
  factory CopyWith$Query$GetChatMessages$getChatMessages$edges(
    Query$GetChatMessages$getChatMessages$edges instance,
    TRes Function(Query$GetChatMessages$getChatMessages$edges) then,
  ) = _CopyWithImpl$Query$GetChatMessages$getChatMessages$edges;

  factory CopyWith$Query$GetChatMessages$getChatMessages$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$edges;

  TRes call({
    String? cursor,
    Query$GetChatMessages$getChatMessages$edges$node? node,
  });
  CopyWith$Query$GetChatMessages$getChatMessages$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetChatMessages$getChatMessages$edges<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages$edges<TRes> {
  _CopyWithImpl$Query$GetChatMessages$getChatMessages$edges(
    this._instance,
    this._then,
  );

  final Query$GetChatMessages$getChatMessages$edges _instance;

  final TRes Function(Query$GetChatMessages$getChatMessages$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cursor = _undefined,
    Object? node = _undefined,
  }) =>
      _then(Query$GetChatMessages$getChatMessages$edges(
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetChatMessages$getChatMessages$edges$node),
      ));

  CopyWith$Query$GetChatMessages$getChatMessages$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetChatMessages$getChatMessages$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$edges<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages$edges<TRes> {
  _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$edges(this._res);

  TRes _res;

  call({
    String? cursor,
    Query$GetChatMessages$getChatMessages$edges$node? node,
  }) =>
      _res;

  CopyWith$Query$GetChatMessages$getChatMessages$edges$node<TRes> get node =>
      CopyWith$Query$GetChatMessages$getChatMessages$edges$node.stub(_res);
}

class Query$GetChatMessages$getChatMessages$edges$node {
  Query$GetChatMessages$getChatMessages$edges$node({
    required this.id,
    required this.type,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.replyToId,
  });

  factory Query$GetChatMessages$getChatMessages$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$type = json['type'];
    final l$userId = json['userId'];
    final l$content = json['content'];
    final l$createdAt = json['createdAt'];
    final l$replyToId = json['replyToId'];
    return Query$GetChatMessages$getChatMessages$edges$node(
      id: (l$id as String),
      type: fromJson$Enum$MessageType((l$type as String)),
      userId: (l$userId as String),
      content: (l$content as String),
      createdAt: DateTime.parse((l$createdAt as String)),
      replyToId: (l$replyToId as String?),
    );
  }

  final String id;

  final Enum$MessageType type;

  final String userId;

  final String content;

  final DateTime createdAt;

  final String? replyToId;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MessageType(l$type);
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$replyToId = replyToId;
    _resultData['replyToId'] = l$replyToId;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$type = type;
    final l$userId = userId;
    final l$content = content;
    final l$createdAt = createdAt;
    final l$replyToId = replyToId;
    return Object.hashAll([
      l$id,
      l$type,
      l$userId,
      l$content,
      l$createdAt,
      l$replyToId,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetChatMessages$getChatMessages$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$replyToId = replyToId;
    final lOther$replyToId = other.replyToId;
    if (l$replyToId != lOther$replyToId) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetChatMessages$getChatMessages$edges$node
    on Query$GetChatMessages$getChatMessages$edges$node {
  CopyWith$Query$GetChatMessages$getChatMessages$edges$node<
          Query$GetChatMessages$getChatMessages$edges$node>
      get copyWith => CopyWith$Query$GetChatMessages$getChatMessages$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetChatMessages$getChatMessages$edges$node<TRes> {
  factory CopyWith$Query$GetChatMessages$getChatMessages$edges$node(
    Query$GetChatMessages$getChatMessages$edges$node instance,
    TRes Function(Query$GetChatMessages$getChatMessages$edges$node) then,
  ) = _CopyWithImpl$Query$GetChatMessages$getChatMessages$edges$node;

  factory CopyWith$Query$GetChatMessages$getChatMessages$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$edges$node;

  TRes call({
    String? id,
    Enum$MessageType? type,
    String? userId,
    String? content,
    DateTime? createdAt,
    String? replyToId,
  });
}

class _CopyWithImpl$Query$GetChatMessages$getChatMessages$edges$node<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages$edges$node<TRes> {
  _CopyWithImpl$Query$GetChatMessages$getChatMessages$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetChatMessages$getChatMessages$edges$node _instance;

  final TRes Function(Query$GetChatMessages$getChatMessages$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? type = _undefined,
    Object? userId = _undefined,
    Object? content = _undefined,
    Object? createdAt = _undefined,
    Object? replyToId = _undefined,
  }) =>
      _then(Query$GetChatMessages$getChatMessages$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MessageType),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        replyToId: replyToId == _undefined
            ? _instance.replyToId
            : (replyToId as String?),
      ));
}

class _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$edges$node<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    Enum$MessageType? type,
    String? userId,
    String? content,
    DateTime? createdAt,
    String? replyToId,
  }) =>
      _res;
}

class Query$GetChatMessages$getChatMessages$pageInfo {
  Query$GetChatMessages$getChatMessages$pageInfo({
    required this.hasPreviousPage,
    this.startCursor,
    required this.hasNextPage,
    this.endCursor,
  });

  factory Query$GetChatMessages$getChatMessages$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    return Query$GetChatMessages$getChatMessages$pageInfo(
      hasPreviousPage: (l$hasPreviousPage as bool),
      startCursor: (l$startCursor as String?),
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
    );
  }

  final bool hasPreviousPage;

  final String? startCursor;

  final bool hasNextPage;

  final String? endCursor;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasPreviousPage = hasPreviousPage;
    _resultData['hasPreviousPage'] = l$hasPreviousPage;
    final l$startCursor = startCursor;
    _resultData['startCursor'] = l$startCursor;
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasPreviousPage = hasPreviousPage;
    final l$startCursor = startCursor;
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    return Object.hashAll([
      l$hasPreviousPage,
      l$startCursor,
      l$hasNextPage,
      l$endCursor,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetChatMessages$getChatMessages$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasPreviousPage = hasPreviousPage;
    final lOther$hasPreviousPage = other.hasPreviousPage;
    if (l$hasPreviousPage != lOther$hasPreviousPage) {
      return false;
    }
    final l$startCursor = startCursor;
    final lOther$startCursor = other.startCursor;
    if (l$startCursor != lOther$startCursor) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetChatMessages$getChatMessages$pageInfo
    on Query$GetChatMessages$getChatMessages$pageInfo {
  CopyWith$Query$GetChatMessages$getChatMessages$pageInfo<
          Query$GetChatMessages$getChatMessages$pageInfo>
      get copyWith => CopyWith$Query$GetChatMessages$getChatMessages$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetChatMessages$getChatMessages$pageInfo<TRes> {
  factory CopyWith$Query$GetChatMessages$getChatMessages$pageInfo(
    Query$GetChatMessages$getChatMessages$pageInfo instance,
    TRes Function(Query$GetChatMessages$getChatMessages$pageInfo) then,
  ) = _CopyWithImpl$Query$GetChatMessages$getChatMessages$pageInfo;

  factory CopyWith$Query$GetChatMessages$getChatMessages$pageInfo.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$pageInfo;

  TRes call({
    bool? hasPreviousPage,
    String? startCursor,
    bool? hasNextPage,
    String? endCursor,
  });
}

class _CopyWithImpl$Query$GetChatMessages$getChatMessages$pageInfo<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages$pageInfo<TRes> {
  _CopyWithImpl$Query$GetChatMessages$getChatMessages$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetChatMessages$getChatMessages$pageInfo _instance;

  final TRes Function(Query$GetChatMessages$getChatMessages$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
  }) =>
      _then(Query$GetChatMessages$getChatMessages$pageInfo(
        hasPreviousPage:
            hasPreviousPage == _undefined || hasPreviousPage == null
                ? _instance.hasPreviousPage
                : (hasPreviousPage as bool),
        startCursor: startCursor == _undefined
            ? _instance.startCursor
            : (startCursor as String?),
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
      ));
}

class _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$pageInfo<TRes>
    implements CopyWith$Query$GetChatMessages$getChatMessages$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetChatMessages$getChatMessages$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasPreviousPage,
    String? startCursor,
    bool? hasNextPage,
    String? endCursor,
  }) =>
      _res;
}
