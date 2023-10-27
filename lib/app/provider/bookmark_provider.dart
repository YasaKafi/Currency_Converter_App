import 'package:currency_converter/app/model/currency.dart';
import 'package:flutter/material.dart';

import '../model/bookmart.dart';

class BookMarkProvider extends ChangeNotifier{
  Bookmark bookmark = Bookmark(data: []);

  add({required Currency allCurrency})
  {
    bookmark.data.add(allCurrency);
    notifyListeners();
  }

  remove({required Currency allCurrency})
  {
    bookmark.data.remove(allCurrency);
    notifyListeners();
  }
}