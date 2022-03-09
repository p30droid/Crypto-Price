import 'package:flutter/material.dart';

late String selectedCurrency;

const textFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  prefixText: '💰 ',
  hintText: '1.0',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
        style: BorderStyle.solid),
    borderRadius:
    BorderRadius.all(Radius.circular(10.0)),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
        style: BorderStyle.solid),
    borderRadius:
    BorderRadius.all(Radius.circular(10.0)),
  ),
);

var boxContainerDecoration = BoxDecoration(
    border: Border.all(width: 1.5, color: Colors.grey),
    borderRadius: BorderRadius.circular(10.0));

var buttonStyleFrom = ElevatedButton.styleFrom(
  minimumSize: const Size(95.0, 60.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),),);