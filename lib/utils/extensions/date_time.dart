import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// 日本の曜日
  static const List<String> japaneseWeekdays = ['月', '火', '水', '木', '金', '土', '日'];

  /// 「2022-01-01 (月)」のような文字列に変換する
  String toYYYYMMDD({
    String delimiter = '-',
    bool withJapaneseWeekDay = true,
  }) =>
      withJapaneseWeekDay
          ? DateFormat('yyyy${delimiter}MM${delimiter}dd ($japaneseWeekDay)').format(this)
          : DateFormat('yyyy${delimiter}MM${delimiter}dd').format(this);

  /// 「2022年01月01日 (月)」のような文字列に変換する
  String toJaYYYYMMDD({bool withJapaneseWeekDay = true}) => withJapaneseWeekDay
      ? DateFormat('yyyy年MM月dd日 ($japaneseWeekDay)').format(this)
      : DateFormat('yyyy年MM月dd日').format(this);

  /// 「2022-01-01 (月) 00:00」のような文字列に変換する
  String toYYYYMMDDHHMM({
    String delimiter = '-',
    bool withJapaneseWeekDay = true,
  }) =>
      withJapaneseWeekDay
          ? DateFormat(
              'yyyy${delimiter}MM${delimiter}dd ($japaneseWeekDay) HH:mm',
            ).format(this)
          : DateFormat('yyyy${delimiter}MM${delimiter}dd HH:mm').format(this);

  /// 「2022年01月01日 (月) 00:00」のような文字列に変換する
  String toJaYYYYMMDDHHMM({bool withJapaneseWeekDay = true}) => withJapaneseWeekDay
      ? DateFormat('yyyy年MM月dd日 ($japaneseWeekDay) HH:mm').format(this)
      : DateFormat('yyyy年MM月dd日 HH:mm').format(this);

  /// 入力日の日本の曜日を返す
  String get japaneseWeekDay => japaneseWeekdays[_weekDayInt(this) - 1];

  /// 入力日の曜日を整数型で返す
  int _weekDayInt(DateTime dateTime) => dateTime.weekday;
}

/// yyyy-MM-dd (曜) の形式の文字列を返す
String toIsoStringDateWithWeekDay(DateTime? dateTime, [String placeHolder = '']) {
  if (dateTime == null) {
    return placeHolder;
  }
  return '${DateFormat('yyyy-MM-dd').format(dateTime)} '
      '(${dateTime.japaneseWeekDay})';
}

/// 24 時間制の時刻だけを返す
String to24HourNotationString(DateTime? dateTime) {
  return dateTime == null ? '' : DateFormat.Hm().format(dateTime);
}

/// 2 つの DateTime が同じ日かどうか判定する
bool sameDay(DateTime a, DateTime b) => a.difference(b).inDays == 0 && a.day == b.day;
