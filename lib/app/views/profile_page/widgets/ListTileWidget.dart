import 'package:currency_converter/app/views/profile_page/widgets/menu.dart';
import 'package:currency_converter/helpers/color_resources.dart';
import 'package:currency_converter/helpers/dimensions.dart';
import 'package:flutter/material.dart';


class MyListViewWidget extends StatelessWidget {
  const MyListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        MyListTileWidget(
          title: 'Alamat Tersimpan',
          trailingIcon: Icons.arrow_forward_ios_rounded,
        ),
        MyListTileWidget(
          title: 'Pembayaran',
          trailingIcon: Icons.arrow_forward_ios_rounded,
        ),
        MyListTileWidget(
          title: 'Pusat Bantuan',
          trailingIcon: Icons.arrow_forward_ios_rounded,
        ),
        MyListTileWidget(
          title: 'Pengaturan',
          trailingIcon: Icons.arrow_forward_ios_rounded,
        ),
        Divider(
          height: Dimensions.marginSizeSmall,
          color: ColorResources.grey,
          thickness: 8,
        ),
        MyListTileWidget(
          title: 'Panduan Layanan',
          trailingIcon: Icons.arrow_forward_ios_rounded,
        ),
        MyListTileWidget(
          title: 'Kebijakan Privasi',
          trailingIcon: Icons.arrow_forward_ios_rounded,
        ),
        MyListTileWidget(
          title: 'Media Sosial',
          trailingIcon: Icons.arrow_forward_ios_rounded,
        ),
        Divider(
          height: Dimensions.marginSizeSmall,
          color: ColorResources.grey,
          thickness: 8,
        ),
      ],
    );
  }
}
