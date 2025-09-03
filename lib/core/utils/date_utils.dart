class AppDateUtils {
  static Map<String, String> getDateRange() {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    String formatDate(DateTime date) {
      return "${date.year.toString().padLeft(4, '0')}-"
          "${date.month.toString().padLeft(2, '0')}-"
          "${date.day.toString().padLeft(2, '0')}";
    }

    return {
      'from': formatDate(yesterday),
      'to': formatDate(now),
    };
  }

  static String formatToDate(DateTime publishedAt) {
    return "${publishedAt.year.toString().padLeft(4, '0')}-"
        "${publishedAt.month.toString().padLeft(2, '0')}-"
        "${publishedAt.day.toString().padLeft(2, '0')}";
  }
}
