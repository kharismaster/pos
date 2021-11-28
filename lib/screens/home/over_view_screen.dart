import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos/configs/constants.dart';
import 'package:pos/controllers/responsive.dart';
import 'package:pos/models/cash_register_model.dart';
import 'package:pos/models/user_model.dart';
import 'package:pos/providers/cash_register_provider.dart';
import 'package:pos/providers/user_provider.dart';
import 'package:pos/screens/home/components/my_files.dart';
import 'package:pos/screens/home/components/recent_files.dart';
import 'package:pos/screens/home/components/storage_details.dart';
import 'package:provider/provider.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({Key? key}) : super(key: key);

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = Provider.of<UserProvider>(context).currentUser;
    List<CashRegister> cashRegister =
        Provider.of<CashRegisterProvider>(context).cashRegister;

    // Initial transaksi user
    final formatRp =
        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
    double initialAmount = cashRegister.isEmpty
        ? 0
        : double.parse(cashRegister[0].cashRegisterTransactions[0].amount);
    int totalTransaction = cashRegister.isEmpty
        ? 0
        : cashRegister[0].cashRegisterTransactions.length - 1 ;

    const double defaultPading = 16.0;

    final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

    return SafeArea(
      child: SingleChildScrollView(
        controller: _trackingScrollController,
        padding: const EdgeInsets.all(defaultPading),
        child: Column(
          children: [
            // Header(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '     Selamat datang ${currentUser.firstName}',
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).colorScheme.primary),
              ),
            ),

            const SizedBox(height: defaultPading),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      CashRegisterInfo(cashRegister: cashRegister, formatRp: formatRp, initialAmount: initialAmount, totalTransaction: totalTransaction),
                      const SizedBox(height: defaultPadding),
                      CashRegisterInfo(cashRegister: cashRegister, formatRp: formatRp, initialAmount: initialAmount, totalTransaction: totalTransaction),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: 
                      // StorageDetails(),
                      Column(
                        children: [
                          const SizedBox(height: defaultPadding),
                          CashRegisterInfo(cashRegister: cashRegister, formatRp: formatRp, initialAmount: initialAmount, totalTransaction: totalTransaction),
                          const SizedBox(height: defaultPadding),
                          CashRegisterInfo(cashRegister: cashRegister, formatRp: formatRp, initialAmount: initialAmount, totalTransaction: totalTransaction),
                          const SizedBox(height: defaultPadding),
                          CashRegisterInfo(cashRegister: cashRegister, formatRp: formatRp, initialAmount: initialAmount, totalTransaction: totalTransaction),
                        ],
                      ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CashRegisterInfo extends StatelessWidget {
  const CashRegisterInfo({
    Key? key,
    required this.cashRegister,
    required this.formatRp,
    required this.initialAmount,
    required this.totalTransaction,
  }) : super(key: key);

  final List<CashRegister> cashRegister;
  final NumberFormat formatRp;
  final double initialAmount;
  final int totalTransaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: cashRegister.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                const Text('Cash Register'),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Status:'),
                    Text(cashRegister[0].status,
                        style: TextStyle(
                            color: Colors.green[400],
                            fontSize: 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tanggal Buka:'),
                    Text(cashRegister[0]
                        .createdAt
                        .toString()
                        .substring(0, 16)),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Jumlah Transaksi:'),
                    Text(totalTransaction.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Saldo Pembukaan:'),
                    Text(formatRp.format(initialAmount)),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Penjualan:'),
                    Text('Rp15.000.000'),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Tempo:'),
                    Text('(-) Rp3.500.000'),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total Saldo:'),
                    Text('Rp11.500.000'),
                  ],
                ),
                
              ],
            ),
    );
  }
}
