import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pos/configs/constants.dart';
import 'package:pos/controllers/responsive.dart';
import 'package:pos/models/business_detail_model.dart';
import 'package:pos/models/profit_lost_model.dart';
import 'package:pos/providers/business_details_provider.dart';
import 'package:pos/providers/profit_lost_provider.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    BusinessDetail _businessData =
        Provider.of<BusinessDetailsProvider>(context).businessDetails;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(MdiIcons.store),
              label: Text(
                  "${_businessData.name}, ${_businessData.locations[0].city}"),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(MdiIcons.calendarEdit),
              label: const Text("Hari ini"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: const FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    ProfitLost profitLost =
        Provider.of<ProfitLostProvider>(context).profitLost;
    
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      children: [
        // PENJUALAN CARD
        InfoCard(
          title: 'Penjualan',
          icon: Icons.sell,
          color: primaryColor,
          count: '353',
          amount: profitLost.totalSell,
          progress: 74,
        ),

        // PEMBELIAN CARD
        InfoCard(
          title: 'Pembelian',
          icon: Icons.grading,
          color: const Color(0xFFFFA113),
          count: '353',
          amount: profitLost.totalPurchase,
          progress: 74,
        ),

        // PENJUALAN CARD
        InfoCard(
          title: 'Faktur Jatuh Tempo',
          icon: Icons.note,
          color: const Color(0xFFA4CDFF),
          count: '353',
          amount: profitLost.totalSell,
          progress: 74,
        ),

        // PENJUALAN CARD
        InfoCard(
          title: 'Biaya',
          icon: Icons.hardware,
          color: const Color(0xFF707EE5),
          count: '353',
          amount: profitLost.totalExpense.toString(),
          progress: 74,
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String count;
  final String amount;
  final int progress;

  const InfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.count,
    required this.amount,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final formatRp = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
    double amount1 = double.parse(amount);
    int amount2 = amount1.toInt();

    String amounts = formatRp.format(amount2);

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.6),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Icon(icon, color: color),
              ),
              const Icon(Icons.more_vert, color: Colors.white54),
            ],
          ),
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          ProgressLine(
            percentage: progress,
            color: color,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$count data',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Text(
                  '$amounts,-',
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                ),
              ),
            ],
          ),

        ],
      ),

    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
