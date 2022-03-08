import 'package:flutter/material.dart';

import '../../helper/data_helper.dart';
import '../app_constants.dart';

class HarfDropdown extends StatefulWidget {
  final Function onselected;
  HarfDropdown({required this.onselected, Key? key}) : super(key: key);

  @override
  State<HarfDropdown> createState() => _HarfDropdownState();
}

class _HarfDropdownState extends State<HarfDropdown> {
  double secilendeger = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadiuss,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        value: secilendeger,
        onChanged: (deger) {
          setState(() {
            secilendeger = deger!;
            widget.onselected(secilendeger);
          });
        },
        underline: Container(),
        items: Datahelper.tumDerslerinHarfleri(),
      ),
    );
  }
}

class HarfGoster extends StatefulWidget {
  final Function onselectedkredi;
  HarfGoster({required this.onselectedkredi, Key? key}) : super(key: key);

  @override
  State<HarfGoster> createState() => _HarfGosterState();
}

class _HarfGosterState extends State<HarfGoster> {
  double secilenkredidegeri = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadiuss,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        value: secilenkredidegeri,
        onChanged: (deger) {
          setState(() {
            secilenkredidegeri = deger!;
            widget.onselectedkredi(secilenkredidegeri);
          });
        },
        underline: Container(),
        items: Datahelper.tumDerslerinkredileri(),
      ),
    );
  }
}
