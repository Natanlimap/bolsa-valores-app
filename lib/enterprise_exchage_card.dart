import 'package:finance_app/enterprise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EnterpriseExchangeCard extends StatelessWidget {
  final Enterprise enterprise;
  final int colorIndex;
  final Function deleteFunction;
  const EnterpriseExchangeCard(
      {required this.deleteFunction,
      required this.colorIndex,
      required this.enterprise,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.orangeAccent,
      Colors.pink,
      Colors.tealAccent
    ];
    return Card(
        margin: EdgeInsets.all(10),
        color: Color(0XFF2E3240),
        child: Slidable(
          startActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                deleteFunction();
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Excluir',
            ),
          ]),
          child: ListTile(
            isThreeLine: true,
            title: Text(
              enterprise.shortName,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  enterprise.fullName,
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  enterprise.dayVariation
                          .toStringAsFixed(2)
                          .replaceFirst('.', ',') +
                      "%",
                  style: TextStyle(
                      color: enterprise.dayVariation > 0
                          ? Colors.greenAccent
                          : Colors.redAccent),
                )
              ],
            ),
            leading: Container(
                width: 60,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors[colorIndex],
                ),
                child: Center(
                  child: Text(
                    enterprise.code,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )),
            trailing: Text(
              "RS" + enterprise.price.toStringAsFixed(2).replaceFirst('.', ','),
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ));
  }
}
