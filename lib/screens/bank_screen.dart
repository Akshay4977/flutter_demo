import 'package:flutter/material.dart';

class Bank {
  final String name;
  final String maskedAccount;
  final String logoAsset;

  Bank({
    required this.name,
    required this.maskedAccount,
    required this.logoAsset,
  });
}

class BankSelectorScreen extends StatefulWidget {
  @override
  _BankSelectorScreenState createState() => _BankSelectorScreenState();
}

class _BankSelectorScreenState extends State<BankSelectorScreen> {
  final List<Bank> banks = [
    Bank(
        name: 'Axis Bank',
        maskedAccount: '12XXXXXXXXXXXX3456',
        logoAsset: 'assets/logo.png'),
    Bank(
        name: 'HDFC Bank',
        maskedAccount: '45XXXXXXXXXXXX7890',
        logoAsset: 'assets/logo.png'),
    Bank(
        name: 'ICICI Bank',
        maskedAccount: '98XXXXXXXXXXXX1234',
        logoAsset: 'assets/logo.png'),
  ];

  late Bank selectedBank;

  @override
  void initState() {
    super.initState();
    selectedBank = banks[0]; // Default selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payout Bank Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payout Bank Account', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _showBankSelectionSheet(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset(selectedBank.logoAsset, width: 40, height: 40),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(selectedBank.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(selectedBank.maskedAccount),
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBankSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView.builder(
          itemCount: banks.length,
          itemBuilder: (_, index) {
            final bank = banks[index];
            return ListTile(
              leading: Image.asset(bank.logoAsset, width: 40, height: 40),
              title: Text(bank.name),
              subtitle: Text(bank.maskedAccount),
              onTap: () {
                setState(() {
                  selectedBank = bank;
                });
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }
}
