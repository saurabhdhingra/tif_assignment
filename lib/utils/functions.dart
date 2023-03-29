import 'package:intl/intl.dart';

String homeEventDate(DateTime date) {
  return DateFormat('E, MMMd • h:mm a').format(date);
}

String searchEventDate(DateTime date) {
  return DateFormat('d').format(date) +
      ordinal(date) +
      DateFormat('  MMM - E - h:mm a').format(date).toUpperCase();
}

String titleDetailsDate(DateTime date) {
  return DateFormat('d MMM, y').format(date);
}

String subtitleDetailsDate(DateTime date) {
  return DateFormat('EEEE, h:mm a').format(date);
}

List st = [1, 21, 31];
List nd = [2, 22];
List rd = [3, 23];

String ordinal(DateTime selectedDate) {
  if (st.contains(selectedDate.day)) {
    return 'ST';
  } else if (nd.contains(selectedDate.day)) {
    return 'ND';
  } else if (rd.contains(selectedDate.day)) {
    return 'RD';
  } else {
    return 'TH';
  }
}
