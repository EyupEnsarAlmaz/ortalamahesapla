import 'package:flutter/material.dart';
import 'package:ortalamahesapla/constants/app_constants.dart';
import 'package:ortalamahesapla/helper/data_helper.dart';

class Derslistesi extends StatelessWidget {
  final Function onDismiss;
  const Derslistesi({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Datahelper.tumEklenenDersler.length > 0
        ? ListView.builder(
            itemCount: Datahelper.tumEklenenDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        Datahelper.tumEklenenDersler[index].ad.toString(),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (Datahelper.tumEklenenDersler[index].harfDegeri *
                                  Datahelper
                                      .tumEklenenDersler[index].kredidegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "${Datahelper.tumEklenenDersler[index].kredidegeri} Kredi, Not Değeri ${Datahelper.tumEklenenDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Lütfen Ders Ekleyiniz",
              style: Sabitler.baslikstyle,
            )),
          );
  }
}
