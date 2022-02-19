import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransaction;
 Chart({ Key? key, required this.recentTransaction }) : super(key: key);

  List<Map<String,Object>>get groupedTransactions{
    return List.generate(7, (index) {
      return {'day': 'T','value': 9.99};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
        ],
      ),
    );
  }
}