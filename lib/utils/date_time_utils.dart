class DateTimeUtils {
  static String extractHour(String dateTimeStr) {
    int hour = int.parse(dateTimeStr.split('T')[1].split(':')[0]); // 24시간 형식의 시간을 추출
    String period = hour >= 12 ? "오후" : "오전"; // 시간에 따라 AM 또는 PM 결정
    int hour12 = hour % 12; // 12시간 형식으로 변환
    if (hour12 == 0) hour12 = 12; // 0시는 12시로 표시
    return '$period $hour12시'; // 12시간 형식으로 반환
  }
}
