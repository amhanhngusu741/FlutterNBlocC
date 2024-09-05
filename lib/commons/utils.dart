import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  static Future<void> deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static parseDateFromString(String date, forrmat) {
    DateTime parseDate =
        new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = forrmat;
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static parseStringToDate(DateTime date, forrmat) {
    String parseDate = forrmat.format(date);
    return parseDate;
  }

  static addCommaToNumber(num number,
      {String unit = '', String position = 't'}) {
    var formatter = NumberFormat("#,##0.00", "en_US");
    var output;
    if (position == "l")
      output = unit + formatter.format(number);
    else
      output = formatter.format(number) + unit;
    return output;
  }

  static removeTimeInDateTime(DateTime date, String separator, String format) {
    String newTime = '';
    if (format == 'dd/mm/yyyy') {
      newTime = "${date.day}$separator${date.month}$separator${date.year}";
    } else if (format == 'mm/dd/yyyy') {
      newTime = "${date.month}$separator${date.day}$separator${date.year}";
    }
    return newTime;
  }
}
