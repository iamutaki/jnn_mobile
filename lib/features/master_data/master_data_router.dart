import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import '../master_data/presentation/pages/master_data_desa_page.dart';
import '../master_data/presentation/pages/master_data_kecamatan_page.dart';
import '../master_data/presentation/pages/master_data_personel_page.dart';
import 'presentation/pages/master_data_voucher_page.dart';
import '../master_data/presentation/pages/master_data_reseller_page.dart';
import '../master_data/presentation/pages/master_data_page.dart';

class MasterDataRouter {
  MasterDataRouter._();

  static const masterData = RouteDefiner(
    path: '/master-data',
    name: 'MasterDataRouter.masterData',
  );

  static const kecamatan = RouteDefiner(
    path: 'kecamatan',
    name: 'MasterDataRouter.kecamatan',
  );

  static const desa = RouteDefiner(path: 'desa', name: 'MasterDataRouter.desa');

  static const voucher = RouteDefiner(
    path: 'voucher',
    name: 'MasterDataRouter.voucher',
  );

  static const personel = RouteDefiner(
    path: 'personel',
    name: 'MasterDataRouter.personel',
  );

  static const reseller = RouteDefiner(
    path: 'reseller',
    name: 'MasterDataRouter.reseller',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: masterData.path,
      name: masterData.name,
      builder: (context, state) => const MasterDataPage(),
      routes: [
        GoRoute(
          path: kecamatan.path,
          name: kecamatan.name,
          builder: (context, state) => const MasterDataKecamatanPage(),
        ),
        GoRoute(
          path: desa.path,
          name: desa.name,
          builder: (context, state) => const MasterDataDesaPage(),
        ),
        GoRoute(
          path: voucher.path,
          name: voucher.name,
          builder: (context, state) => const MasterDataVoucherPage(),
        ),
        GoRoute(
          path: personel.path,
          name: personel.name,
          builder: (context, state) => const MasterDataPersonelPage(),
        ),
        GoRoute(
          path: reseller.path,
          name: reseller.name,
          builder: (context, state) => const MasterDataResellerPage(),
        ),
      ],
    ),
  ];
}
