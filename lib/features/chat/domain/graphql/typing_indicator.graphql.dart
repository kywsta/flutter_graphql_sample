import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Variables$Subscription$TypingIndicator {
  factory Variables$Subscription$TypingIndicator(
          {required String typingIndicatorChatId2}) =>
      Variables$Subscription$TypingIndicator._({
        r'typingIndicatorChatId2': typingIndicatorChatId2,
      });

  Variables$Subscription$TypingIndicator._(this._$data);

  factory Variables$Subscription$TypingIndicator.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$typingIndicatorChatId2 = data['typingIndicatorChatId2'];
    result$data['typingIndicatorChatId2'] =
        (l$typingIndicatorChatId2 as String);
    return Variables$Subscription$TypingIndicator._(result$data);
  }

  Map<String, dynamic> _$data;

  String get typingIndicatorChatId2 =>
      (_$data['typingIndicatorChatId2'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$typingIndicatorChatId2 = typingIndicatorChatId2;
    result$data['typingIndicatorChatId2'] = l$typingIndicatorChatId2;
    return result$data;
  }

  CopyWith$Variables$Subscription$TypingIndicator<
          Variables$Subscription$TypingIndicator>
      get copyWith => CopyWith$Variables$Subscription$TypingIndicator(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$TypingIndicator ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$typingIndicatorChatId2 = typingIndicatorChatId2;
    final lOther$typingIndicatorChatId2 = other.typingIndicatorChatId2;
    if (l$typingIndicatorChatId2 != lOther$typingIndicatorChatId2) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$typingIndicatorChatId2 = typingIndicatorChatId2;
    return Object.hashAll([l$typingIndicatorChatId2]);
  }
}

abstract class CopyWith$Variables$Subscription$TypingIndicator<TRes> {
  factory CopyWith$Variables$Subscription$TypingIndicator(
    Variables$Subscription$TypingIndicator instance,
    TRes Function(Variables$Subscription$TypingIndicator) then,
  ) = _CopyWithImpl$Variables$Subscription$TypingIndicator;

  factory CopyWith$Variables$Subscription$TypingIndicator.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$TypingIndicator;

  TRes call({String? typingIndicatorChatId2});
}

class _CopyWithImpl$Variables$Subscription$TypingIndicator<TRes>
    implements CopyWith$Variables$Subscription$TypingIndicator<TRes> {
  _CopyWithImpl$Variables$Subscription$TypingIndicator(
    this._instance,
    this._then,
  );

  final Variables$Subscription$TypingIndicator _instance;

  final TRes Function(Variables$Subscription$TypingIndicator) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? typingIndicatorChatId2 = _undefined}) =>
      _then(Variables$Subscription$TypingIndicator._({
        ..._instance._$data,
        if (typingIndicatorChatId2 != _undefined &&
            typingIndicatorChatId2 != null)
          'typingIndicatorChatId2': (typingIndicatorChatId2 as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$TypingIndicator<TRes>
    implements CopyWith$Variables$Subscription$TypingIndicator<TRes> {
  _CopyWithStubImpl$Variables$Subscription$TypingIndicator(this._res);

  TRes _res;

  call({String? typingIndicatorChatId2}) => _res;
}

class Subscription$TypingIndicator {
  Subscription$TypingIndicator({required this.typingIndicator});

  factory Subscription$TypingIndicator.fromJson(Map<String, dynamic> json) {
    final l$typingIndicator = json['typingIndicator'];
    return Subscription$TypingIndicator(
        typingIndicator: Subscription$TypingIndicator$typingIndicator.fromJson(
            (l$typingIndicator as Map<String, dynamic>)));
  }

  final Subscription$TypingIndicator$typingIndicator typingIndicator;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$typingIndicator = typingIndicator;
    _resultData['typingIndicator'] = l$typingIndicator.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$typingIndicator = typingIndicator;
    return Object.hashAll([l$typingIndicator]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$TypingIndicator ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$typingIndicator = typingIndicator;
    final lOther$typingIndicator = other.typingIndicator;
    if (l$typingIndicator != lOther$typingIndicator) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$TypingIndicator
    on Subscription$TypingIndicator {
  CopyWith$Subscription$TypingIndicator<Subscription$TypingIndicator>
      get copyWith => CopyWith$Subscription$TypingIndicator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$TypingIndicator<TRes> {
  factory CopyWith$Subscription$TypingIndicator(
    Subscription$TypingIndicator instance,
    TRes Function(Subscription$TypingIndicator) then,
  ) = _CopyWithImpl$Subscription$TypingIndicator;

  factory CopyWith$Subscription$TypingIndicator.stub(TRes res) =
      _CopyWithStubImpl$Subscription$TypingIndicator;

  TRes call({Subscription$TypingIndicator$typingIndicator? typingIndicator});
  CopyWith$Subscription$TypingIndicator$typingIndicator<TRes>
      get typingIndicator;
}

class _CopyWithImpl$Subscription$TypingIndicator<TRes>
    implements CopyWith$Subscription$TypingIndicator<TRes> {
  _CopyWithImpl$Subscription$TypingIndicator(
    this._instance,
    this._then,
  );

  final Subscription$TypingIndicator _instance;

  final TRes Function(Subscription$TypingIndicator) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? typingIndicator = _undefined}) =>
      _then(Subscription$TypingIndicator(
          typingIndicator:
              typingIndicator == _undefined || typingIndicator == null
                  ? _instance.typingIndicator
                  : (typingIndicator
                      as Subscription$TypingIndicator$typingIndicator)));

  CopyWith$Subscription$TypingIndicator$typingIndicator<TRes>
      get typingIndicator {
    final local$typingIndicator = _instance.typingIndicator;
    return CopyWith$Subscription$TypingIndicator$typingIndicator(
        local$typingIndicator, (e) => call(typingIndicator: e));
  }
}

class _CopyWithStubImpl$Subscription$TypingIndicator<TRes>
    implements CopyWith$Subscription$TypingIndicator<TRes> {
  _CopyWithStubImpl$Subscription$TypingIndicator(this._res);

  TRes _res;

  call({Subscription$TypingIndicator$typingIndicator? typingIndicator}) => _res;

  CopyWith$Subscription$TypingIndicator$typingIndicator<TRes>
      get typingIndicator =>
          CopyWith$Subscription$TypingIndicator$typingIndicator.stub(_res);
}

const documentNodeSubscriptionTypingIndicator = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'TypingIndicator'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'typingIndicatorChatId2')),
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
        name: NameNode(value: 'typingIndicator'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'chatId'),
            value:
                VariableNode(name: NameNode(value: 'typingIndicatorChatId2')),
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
            name: NameNode(value: 'isTyping'),
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
            name: NameNode(value: 'username'),
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
Subscription$TypingIndicator _parserFn$Subscription$TypingIndicator(
        Map<String, dynamic> data) =>
    Subscription$TypingIndicator.fromJson(data);

class Options$Subscription$TypingIndicator
    extends graphql.SubscriptionOptions<Subscription$TypingIndicator> {
  Options$Subscription$TypingIndicator({
    String? operationName,
    required Variables$Subscription$TypingIndicator variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$TypingIndicator? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionTypingIndicator,
          parserFn: _parserFn$Subscription$TypingIndicator,
        );
}

class WatchOptions$Subscription$TypingIndicator
    extends graphql.WatchQueryOptions<Subscription$TypingIndicator> {
  WatchOptions$Subscription$TypingIndicator({
    String? operationName,
    required Variables$Subscription$TypingIndicator variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$TypingIndicator? typedOptimisticResult,
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
          document: documentNodeSubscriptionTypingIndicator,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$TypingIndicator,
        );
}

class FetchMoreOptions$Subscription$TypingIndicator
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$TypingIndicator({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$TypingIndicator variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionTypingIndicator,
        );
}

extension ClientExtension$Subscription$TypingIndicator
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$TypingIndicator>>
      subscribe$TypingIndicator(Options$Subscription$TypingIndicator options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$TypingIndicator>
      watchSubscription$TypingIndicator(
              WatchOptions$Subscription$TypingIndicator options) =>
          this.watchQuery(options);
}

class Subscription$TypingIndicator$typingIndicator {
  Subscription$TypingIndicator$typingIndicator({
    required this.chatId,
    required this.isTyping,
    required this.userId,
    required this.username,
  });

  factory Subscription$TypingIndicator$typingIndicator.fromJson(
      Map<String, dynamic> json) {
    final l$chatId = json['chatId'];
    final l$isTyping = json['isTyping'];
    final l$userId = json['userId'];
    final l$username = json['username'];
    return Subscription$TypingIndicator$typingIndicator(
      chatId: (l$chatId as String),
      isTyping: (l$isTyping as bool),
      userId: (l$userId as String),
      username: (l$username as String),
    );
  }

  final String chatId;

  final bool isTyping;

  final String userId;

  final String username;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$chatId = chatId;
    _resultData['chatId'] = l$chatId;
    final l$isTyping = isTyping;
    _resultData['isTyping'] = l$isTyping;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$username = username;
    _resultData['username'] = l$username;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$chatId = chatId;
    final l$isTyping = isTyping;
    final l$userId = userId;
    final l$username = username;
    return Object.hashAll([
      l$chatId,
      l$isTyping,
      l$userId,
      l$username,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$TypingIndicator$typingIndicator ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$chatId = chatId;
    final lOther$chatId = other.chatId;
    if (l$chatId != lOther$chatId) {
      return false;
    }
    final l$isTyping = isTyping;
    final lOther$isTyping = other.isTyping;
    if (l$isTyping != lOther$isTyping) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$TypingIndicator$typingIndicator
    on Subscription$TypingIndicator$typingIndicator {
  CopyWith$Subscription$TypingIndicator$typingIndicator<
          Subscription$TypingIndicator$typingIndicator>
      get copyWith => CopyWith$Subscription$TypingIndicator$typingIndicator(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$TypingIndicator$typingIndicator<TRes> {
  factory CopyWith$Subscription$TypingIndicator$typingIndicator(
    Subscription$TypingIndicator$typingIndicator instance,
    TRes Function(Subscription$TypingIndicator$typingIndicator) then,
  ) = _CopyWithImpl$Subscription$TypingIndicator$typingIndicator;

  factory CopyWith$Subscription$TypingIndicator$typingIndicator.stub(TRes res) =
      _CopyWithStubImpl$Subscription$TypingIndicator$typingIndicator;

  TRes call({
    String? chatId,
    bool? isTyping,
    String? userId,
    String? username,
  });
}

class _CopyWithImpl$Subscription$TypingIndicator$typingIndicator<TRes>
    implements CopyWith$Subscription$TypingIndicator$typingIndicator<TRes> {
  _CopyWithImpl$Subscription$TypingIndicator$typingIndicator(
    this._instance,
    this._then,
  );

  final Subscription$TypingIndicator$typingIndicator _instance;

  final TRes Function(Subscription$TypingIndicator$typingIndicator) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? chatId = _undefined,
    Object? isTyping = _undefined,
    Object? userId = _undefined,
    Object? username = _undefined,
  }) =>
      _then(Subscription$TypingIndicator$typingIndicator(
        chatId: chatId == _undefined || chatId == null
            ? _instance.chatId
            : (chatId as String),
        isTyping: isTyping == _undefined || isTyping == null
            ? _instance.isTyping
            : (isTyping as bool),
        userId: userId == _undefined || userId == null
            ? _instance.userId
            : (userId as String),
        username: username == _undefined || username == null
            ? _instance.username
            : (username as String),
      ));
}

class _CopyWithStubImpl$Subscription$TypingIndicator$typingIndicator<TRes>
    implements CopyWith$Subscription$TypingIndicator$typingIndicator<TRes> {
  _CopyWithStubImpl$Subscription$TypingIndicator$typingIndicator(this._res);

  TRes _res;

  call({
    String? chatId,
    bool? isTyping,
    String? userId,
    String? username,
  }) =>
      _res;
}
