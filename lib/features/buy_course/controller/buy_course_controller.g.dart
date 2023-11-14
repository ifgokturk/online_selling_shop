// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_course_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$buyCourseControllerHash() =>
    r'e66a88b8c65f01ce25684163b91260809204425f';

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

typedef BuyCourseControllerRef = AutoDisposeFutureProviderRef<String?>;

/// See also [buyCourseController].
@ProviderFor(buyCourseController)
const buyCourseControllerProvider = BuyCourseControllerFamily();

/// See also [buyCourseController].
class BuyCourseControllerFamily extends Family<AsyncValue<String?>> {
  /// See also [buyCourseController].
  const BuyCourseControllerFamily();

  /// See also [buyCourseController].
  BuyCourseControllerProvider call({
    required int index,
  }) {
    return BuyCourseControllerProvider(
      index: index,
    );
  }

  @override
  BuyCourseControllerProvider getProviderOverride(
    covariant BuyCourseControllerProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'buyCourseControllerProvider';
}

/// See also [buyCourseController].
class BuyCourseControllerProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [buyCourseController].
  BuyCourseControllerProvider({
    required this.index,
  }) : super.internal(
          (ref) => buyCourseController(
            ref,
            index: index,
          ),
          from: buyCourseControllerProvider,
          name: r'buyCourseControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$buyCourseControllerHash,
          dependencies: BuyCourseControllerFamily._dependencies,
          allTransitiveDependencies:
              BuyCourseControllerFamily._allTransitiveDependencies,
        );

  final int index;

  @override
  bool operator ==(Object other) {
    return other is BuyCourseControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
