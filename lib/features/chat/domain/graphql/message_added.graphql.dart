import '../../../../core/graphql/schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$MessageAdded {
  factory Variables$Subscription$MessageAdded({required String chatId}) =>
      Variables$Subscription$MessageAdded._({
        r'chatId': chatId,
      });

  Variables$Subscription$MessageAdded._(this._$data);

  factory Variables$Subscription$MessageAdded.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$chatId = data['chatId'];
    result$data['chatId'] = (l$chatId as String);
    return Variables$Subscription$MessageAdded._(result$data);
  }

  Map<String, dynamic> _$data;

  String get chatId => (_$data['chatId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$chatId = chatId;
    result$data['chatId'] = l$chatId;
    return result$data;
  }

  CopyWith$Variables$Subscription$MessageAdded<
          Variables$Subscription$MessageAdded>
      get copyWith => CopyWith$Variables$Subscription$MessageAdded(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$MessageAdded ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatId = chatId;
    final lOther$chatId = other.chatId;
    if (l$chatId != lOther$chatId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$chatId = chatId;
    return Object.hashAll([l$chatId]);
  }
}

abstract class CopyWith$Variables$Subscription$MessageAdded<TRes> {
  factory CopyWith$Variables$Subscription$MessageAdded(
    Variables$Subscription$MessageAdded instance,
    TRes Function(Variables$Subscription$MessageAdded) then,
  ) = _CopyWithImpl$Variables$Subscription$MessageAdded;

  factory CopyWith$Variables$Subscription$MessageAdded.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$MessageAdded;

  TRes call({String? chatId});
}

class _CopyWithImpl$Variables$Subscription$MessageAdded<TRes>
    implements CopyWith$Variables$Subscription$MessageAdded<TRes> {
  _CopyWithImpl$Variables$Subscription$MessageAdded(
    this._instance,
    this._then,
  );

  final Variables$Subscription$MessageAdded _instance;

  final TRes Function(Variables$Subscription$MessageAdded) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? chatId = _undefined}) =>
      _then(Variables$Subscription$MessageAdded._({
        ..._instance._$data,
        if (chatId != _undefined && chatId != null)
          'chatId': (chatId as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$MessageAdded<TRes>
    implements CopyWith$Variables$Subscription$MessageAdded<TRes> {
  _CopyWithStubImpl$Variables$Subscription$MessageAdded(this._res);

  TRes _res;

  call({String? chatId}) => _res;
}

class Subscription$MessageAdded {
  Subscription$MessageAdded({required this.messageAdded});

  factory Subscription$MessageAdded.fromJson(Map<String, dynamic> json) {
    final l$messageAdded = json['messageAdded'];
    return Subscription$MessageAdded(
        messageAdded: Subscription$MessageAdded$messageAdded.fromJson(
            (l$messageAdded as Map<String, dynamic>)));
  }

  final Subscription$MessageAdded$messageAdded messageAdded;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$messageAdded = messageAdded;
    _resultData['messageAdded'] = l$messageAdded.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$messageAdded = messageAdded;
    return Object.hashAll([l$messageAdded]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$MessageAdded ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$messageAdded = messageAdded;
    final lOther$messageAdded = other.messageAdded;
    if (l$messageAdded != lOther$messageAdded) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$MessageAdded
    on Subscription$MessageAdded {
  CopyWith$Subscription$MessageAdded<Subscription$MessageAdded> get copyWith =>
      CopyWith$Subscription$MessageAdded(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$MessageAdded<TRes> {
  factory CopyWith$Subscription$MessageAdded(
    Subscription$MessageAdded instance,
    TRes Function(Subscription$MessageAdded) then,
  ) = _CopyWithImpl$Subscription$MessageAdded;

  factory CopyWith$Subscription$MessageAdded.stub(TRes res) =
      _CopyWithStubImpl$Subscription$MessageAdded;

  TRes call({Subscription$MessageAdded$messageAdded? messageAdded});
  CopyWith$Subscription$MessageAdded$messageAdded<TRes> get messageAdded;
}

class _CopyWithImpl$Subscription$MessageAdded<TRes>
    implements CopyWith$Subscription$MessageAdded<TRes> {
  _CopyWithImpl$Subscription$MessageAdded(
    this._instance,
    this._then,
  );

  final Subscription$MessageAdded _instance;

  final TRes Function(Subscription$MessageAdded) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? messageAdded = _undefined}) => _then(
      Subscription$MessageAdded(
          messageAdded: messageAdded == _undefined || messageAdded == null
              ? _instance.messageAdded
              : (messageAdded as Subscription$MessageAdded$messageAdded)));

  CopyWith$Subscription$MessageAdded$messageAdded<TRes> get messageAdded {
    final local$messageAdded = _instance.messageAdded;
    return CopyWith$Subscription$MessageAdded$messageAdded(
        local$messageAdded, (e) => call(messageAdded: e));
  }
}

class _CopyWithStubImpl$Subscription$MessageAdded<TRes>
    implements CopyWith$Subscription$MessageAdded<TRes> {
  _CopyWithStubImpl$Subscription$MessageAdded(this._res);

  TRes _res;

  call({Subscription$MessageAdded$messageAdded? messageAdded}) => _res;

  CopyWith$Subscription$MessageAdded$messageAdded<TRes> get messageAdded =>
      CopyWith$Subscription$MessageAdded$messageAdded.stub(_res);
}

const documentNodeSubscriptionMessageAdded = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'MessageAdded'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'chatId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'messageAdded'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'chatId'),
            value: VariableNode(name: NameNode(value: 'chatId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'chatId'),
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
            name: NameNode(value: 'replyToId'),
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
Subscription$MessageAdded _parserFn$Subscription$MessageAdded(
        Map<String, dynamic> data) =>
    Subscription$MessageAdded.fromJson(data);

class Options$Subscription$MessageAdded
    extends graphql.SubscriptionOptions<Subscription$MessageAdded> {
  Options$Subscription$MessageAdded({
    String? operationName,
    required Variables$Subscription$MessageAdded variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$MessageAdded? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionMessageAdded,
          parserFn: _parserFn$Subscription$MessageAdded,
        );
}

class WatchOptions$Subscription$MessageAdded
    extends graphql.WatchQueryOptions<Subscription$MessageAdded> {
  WatchOptions$Subscription$MessageAdded({
    String? operationName,
    required Variables$Subscription$MessageAdded variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$MessageAdded? typedOptimisticResult,
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
          document: documentNodeSubscriptionMessageAdded,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$MessageAdded,
        );
}

class FetchMoreOptions$Subscription$MessageAdded
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$MessageAdded({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$MessageAdded variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionMessageAdded,
        );
}

extension ClientExtension$Subscription$MessageAdded on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$MessageAdded>> subscribe$MessageAdded(
          Options$Subscription$MessageAdded options) =>
      this.subscribe(options);
  graphql.ObservableQuery<Subscription$MessageAdded>
      watchSubscription$MessageAdded(
              WatchOptions$Subscription$MessageAdded options) =>
          this.watchQuery(options);
}

class Subscription$MessageAdded$messageAdded {
  Subscription$MessageAdded$messageAdded({
    required this.chatId,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.type,
    this.replyToId,
  });

  factory Subscription$MessageAdded$messageAdded.fromJson(
      Map<String, dynamic> json) {
    final l$chatId = json['chatId'];
    final l$userId = json['userId'];
    final l$content = json['content'];
    final l$createdAt = json['createdAt'];
    final l$id = json['id'];
    final l$type = json['type'];
    final l$replyToId = json['replyToId'];
    return Subscription$MessageAdded$messageAdded(
      chatId: (l$chatId as String),
      userId: (l$userId as String),
      content: (l$content as String),
      createdAt: DateTime.parse((l$createdAt as String)),
      id: (l$id as String),
      type: fromJson$Enum$MessageType((l$type as String)),
      replyToId: (l$replyToId as String?),
    );
  }

  final String chatId;

  final String userId;

  final String content;

  final DateTime createdAt;

  final String id;

  final Enum$MessageType type;

  final String? replyToId;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chatId = chatId;
    _resultData['chatId'] = l$chatId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$id = id;
    _resultData['id'] = l$id;
    final l$type = type;
    _resultData['type'] = toJson$Enum$MessageType(l$type);
    final l$replyToId = replyToId;
    _resultData['replyToId'] = l$replyToId;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chatId = chatId;
    final l$userId = userId;
    final l$content = content;
    final l$createdAt = createdAt;
    final l$id = id;
    final l$type = type;
    final l$replyToId = replyToId;
    return Object.hashAll([
      l$chatId,
      l$userId,
      l$content,
      l$createdAt,
      l$id,
      l$type,
      l$replyToId,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$MessageAdded$messageAdded ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatId = chatId;
    final lOther$chatId = other.chatId;
    if (l$chatId != lOther$chatId) {
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
    final l$replyToId = replyToId;
    final lOther$replyToId = other.replyToId;
    if (l$replyToId != lOther$replyToId) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$MessageAdded$messageAdded
    on Subscription$MessageAdded$messageAdded {
  CopyWith$Subscription$MessageAdded$messageAdded<
          Subscription$MessageAdded$messageAdded>
      get copyWith => CopyWith$Subscription$MessageAdded$messageAdded(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$MessageAdded$messageAdded<TRes> {
  factory CopyWith$Subscription$MessageAdded$messageAdded(
    Subscription$MessageAdded$messageAdded instance,
    TRes Function(Subscription$MessageAdded$messageAdded) then,
  ) = _CopyWithImpl$Subscription$MessageAdded$messageAdded;

  factory CopyWith$Subscription$MessageAdded$messageAdded.stub(TRes res) =
      _CopyWithStubImpl$Subscription$MessageAdded$messageAdded;

  TRes call({
    String? chatId,
    String? userId,
    String? content,
    DateTime? createdAt,
    String? id,
    Enum$MessageType? type,
    String? replyToId,
  });
}

class _CopyWithImpl$Subscription$MessageAdded$messageAdded<TRes>
    implements CopyWith$Subscription$MessageAdded$messageAdded<TRes> {
  _CopyWithImpl$Subscription$MessageAdded$messageAdded(
    this._instance,
    this._then,
  );

  final Subscription$MessageAdded$messageAdded _instance;

  final TRes Function(Subscription$MessageAdded$messageAdded) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chatId = _undefined,
    Object? userId = _undefined,
    Object? content = _undefined,
    Object? createdAt = _undefined,
    Object? id = _undefined,
    Object? type = _undefined,
    Object? replyToId = _undefined,
  }) =>
      _then(Subscription$MessageAdded$messageAdded(
        chatId: chatId == _undefined || chatId == null
            ? _instance.chatId
            : (chatId as String),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        content: content == _undefined || content == null
            ? _instance.content
            : (content as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as DateTime),
        id: id == _undefined || id == null ? _instance.id : (id as String),
        type: type == _undefined || type == null
            ? _instance.type
            : (type as Enum$MessageType),
        replyToId: replyToId == _undefined
            ? _instance.replyToId
            : (replyToId as String?),
      ));
}

class _CopyWithStubImpl$Subscription$MessageAdded$messageAdded<TRes>
    implements CopyWith$Subscription$MessageAdded$messageAdded<TRes> {
  _CopyWithStubImpl$Subscription$MessageAdded$messageAdded(this._res);

  TRes _res;

  call({
    String? chatId,
    String? userId,
    String? content,
    DateTime? createdAt,
    String? id,
    Enum$MessageType? type,
    String? replyToId,
  }) =>
      _res;
}
