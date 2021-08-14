import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? ElevatedButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(
                  Icons.delete,
                  // color: Theme.of(context).errorColor,
                ),
                label: const Text(
                  "Delete",
                  // style: TextStyle(
                  // backgroundColor:
                  //     Theme.of(context).errorColor),
                ),
                // style: ElevatedButton.styleFrom(
                // textStyle:
                // TextStyle(backgroundColor: Colors.white)),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
