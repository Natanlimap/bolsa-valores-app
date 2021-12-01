import 'package:finance_app/custom_text_formfield.dart';
import 'package:finance_app/enterprise.dart';
import 'package:finance_app/enterprise_exchage_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String chave = "b447fa12";
String requestUrl =
    "https://api.hgbrasil.com/finance/stock_price?key=$chave&symbol=";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Enterprise> enterpriseList = [];
  TextEditingController newEnterpriseCodeController = TextEditingController();
  Future<void> addEnterpriseInlist() async {
    print(enterpriseList);

    String code = newEnterpriseCodeController.text.toUpperCase();
    var map = await getEnterpriseInfoInMap(code);
    Enterprise newEnterprise = convertJsonToEnterpris(map['results'][code]);
    enterpriseList.add(newEnterprise);
  }

  bool hasEnterpriseInlist() {
    return enterpriseList.indexWhere((Enterprise element) =>
            element.code == newEnterpriseCodeController.text.toUpperCase()) !=
        -1;
  }

  Future<Map> getEnterpriseInfoInMap(code) async {
    Uri url = Uri.parse("$requestUrl$code");
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  Enterprise convertJsonToEnterpris(enterpriseJson) {
    return Enterprise(
        code: enterpriseJson['symbol'],
        shortName: enterpriseJson['name'],
        fullName: enterpriseJson['company_name'],
        price: enterpriseJson['price'],
        dayVariation: enterpriseJson['change_percent']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF2E3240),
        onPressed: () async {
          if (!hasEnterpriseInlist()) {
            await addEnterpriseInlist();
          }
          setState(() {
            enterpriseList = enterpriseList;
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color(0XFF2E3240),
        title: Text("Ações"),
      ),
      backgroundColor: Color(0xFF0F121E),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                CustomTextFormField(
                  controller: newEnterpriseCodeController,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: enterpriseList.length,
                    itemBuilder: (context, index) {
                      return EnterpriseExchangeCard(
                        colorIndex: index % enterpriseList.length,
                        enterprise: enterpriseList[index],
                      );
                    })
              ],
            ),
          )),
    );
  }
}
