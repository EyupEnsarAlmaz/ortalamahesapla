import 'package:flutter/material.dart';
import 'package:ortalamahesapla/constants/Widgets/ders.dart';
import 'package:ortalamahesapla/constants/Widgets/ders_listesi.dart';
import 'package:ortalamahesapla/constants/Widgets/harf_dropdown.dart';
import 'package:ortalamahesapla/constants/Widgets/ortalama_goster.dart';
import 'package:ortalamahesapla/constants/app_constants.dart';
import 'package:ortalamahesapla/helper/data_helper.dart';
// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formkey = GlobalKey<FormState>();
  double secilendeger = 4;
  double secilenkredidegeri = 1;
  String girilendersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(Sabitler.baslik, style: Sabitler.baslikstyle),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                    dersSayisi: Datahelper.tumEklenenDersler.length,
                    ortalama: Datahelper.ortalamahesapla(),
                  )),
            ],
          ),
          Expanded(
            child: Derslistesi(
              onDismiss: (index) {
                Datahelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _buildText(),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: HarfDropdown(onselected: (harf) {
                      secilendeger = harf;
                    })),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: HarfGoster(onselectedkredi: (sayi) {
                    secilenkredidegeri = sayi;
                  }),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.add),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  _buildText() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilendersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adını Giriniz';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'Ders Adını Giriniz',
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadiuss),
        filled: true,
        fillColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilendersAdi,
          harfDegeri: secilendeger,
          kredidegeri: secilenkredidegeri);
      Datahelper.dersekle(eklenecekDers);
      setState(() {});
    }
  }
}
