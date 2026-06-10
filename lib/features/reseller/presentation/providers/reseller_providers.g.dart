// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reseller_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResellerListNotifier)
final resellerListProvider = ResellerListNotifierProvider._();

final class ResellerListNotifierProvider
    extends $AsyncNotifierProvider<ResellerListNotifier, List<ResellerDto>> {
  ResellerListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resellerListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resellerListNotifierHash();

  @$internal
  @override
  ResellerListNotifier create() => ResellerListNotifier();
}

String _$resellerListNotifierHash() =>
    r'9eb48f829ee259e8afa3c63902914c8abac910f8';

abstract class _$ResellerListNotifier
    extends $AsyncNotifier<List<ResellerDto>> {
  FutureOr<List<ResellerDto>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ResellerDto>>, List<ResellerDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ResellerDto>>, List<ResellerDto>>,
              AsyncValue<List<ResellerDto>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
