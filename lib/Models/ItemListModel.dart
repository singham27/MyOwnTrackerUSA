import 'package:flutter/material.dart';

class ItemListModel{
  String?name;
  int?quantity;
  int?rate;
  String?tax;
  String?description;
  String?id;
  String?createdTime;


  ItemListModel(
      {
        this.name,
         this.quantity,
        this.rate,
        this.tax,
        this.description,
        this.id,
        this.createdTime
      });

}