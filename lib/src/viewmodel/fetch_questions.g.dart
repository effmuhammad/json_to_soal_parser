// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_questions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchZipHash() => r'c4736b22a1c9c1109aeb14087cf64f93652bd553';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchZip].
@ProviderFor(fetchZip)
const fetchZipProvider = FetchZipFamily();

/// See also [fetchZip].
class FetchZipFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [fetchZip].
  const FetchZipFamily();

  /// See also [fetchZip].
  FetchZipProvider call(
    String url,
  ) {
    return FetchZipProvider(
      url,
    );
  }

  @override
  FetchZipProvider getProviderOverride(
    covariant FetchZipProvider provider,
  ) {
    return call(
      provider.url,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchZipProvider';
}

/// See also [fetchZip].
class FetchZipProvider extends AutoDisposeFutureProvider<Uint8List> {
  /// See also [fetchZip].
  FetchZipProvider(
    String url,
  ) : this._internal(
          (ref) => fetchZip(
            ref as FetchZipRef,
            url,
          ),
          from: fetchZipProvider,
          name: r'fetchZipProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchZipHash,
          dependencies: FetchZipFamily._dependencies,
          allTransitiveDependencies: FetchZipFamily._allTransitiveDependencies,
          url: url,
        );

  FetchZipProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Override overrideWith(
    FutureOr<Uint8List> Function(FetchZipRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchZipProvider._internal(
        (ref) => create(ref as FetchZipRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List> createElement() {
    return _FetchZipProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchZipProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchZipRef on AutoDisposeFutureProviderRef<Uint8List> {
  /// The parameter `url` of this provider.
  String get url;
}

class _FetchZipProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List> with FetchZipRef {
  _FetchZipProviderElement(super.provider);

  @override
  String get url => (origin as FetchZipProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
