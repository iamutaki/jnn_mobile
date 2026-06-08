import 'package:go_router/go_router.dart';

import '../../core/router/route_definer.dart';
import '../master_data/presentation/pages/master_data_desa_page.dart';
import '../master_data/presentation/pages/master_data_kecamatan_page.dart';
import '../master_data/presentation/pages/master_data_personel_page.dart';
import '../master_data/presentation/pages/master_data_produk_page.dart';
import '../master_data/presentation/pages/master_data_reseller_page.dart';
import '../master_data/presentation/pages/master_data_page.dart';

class MasterDataRouter {
  MasterDataRouter._();

  static const masterData = RouteDefiner(
    path: '/master-data',
    name: 'MasterDataRouter.masterData',
  );

  static const kecamatan = RouteDefiner(
    path: '/master-data/kecamatan',
    name: 'MasterDataRouter.kecamatan',
  );

  static const desa = RouteDefiner(
    path: '/master-data/desa',
    name: 'MasterDataRouter.desa',
  );

  static const produk = RouteDefiner(
    path: '/master-data/produk',
    name: 'MasterDataRouter.produk',
  );

  static const personel = RouteDefiner(
    path: '/master-data/personel',
    name: 'MasterDataRouter.personel',
  );

  static const reseller = RouteDefiner(
    path: '/master-data/reseller',
    name: 'MasterDataRouter.reseller',
  );

  static final List<GoRoute> routes = [
    GoRoute(
      path: masterData.path,
      name: masterData.name,
      builder: (context, state) => const MasterDataPage(),
      routes: [
        GoRoute(
          path: 'kecamatan',
          name: kecamatan.name,
          builder: (context, state) => const MasterDataKecamatanPage(),
        ),
        GoRoute(
          path: 'desa',
          name: desa.name,
          builder: (context, state) => const MasterDataDesaPage(),
        ),
        GoRoute(
          path: 'produk',
          name: produk.name,
          builder: (context, state) => const MasterDataProdukPage(),
        ),
        GoRoute(
          path: 'personel',
          name: personel.name,
          builder: (context, state) => const MasterDataPersonelPage(),
        ),
        GoRoute(
          path: 'reseller',
          name: reseller.name,
          builder: (context, state) => const MasterDataResellerPage(),
        ),
      ],
    ),
  ];
}
