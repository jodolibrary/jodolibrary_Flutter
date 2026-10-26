enum UserRole { admin, student }

enum AccountType { firstTime, returning }

enum AppScreen {
  welcome,
  mobile,
  otp,
  ownerSetup,
  studentSetup,
  adminDashboard,
  studentDashboard,
  studentHome,
  partnerHome,
}

enum StudentTab { home, explore, bookings, profile }

enum PartnerTab { overview, seats, members, profile }

class CalendarDayInfo {
  final int day;
  final String status; // 'present', 'absent', 'half-day', 'holiday', 'upcoming'
  final String? inTime;
  final String? outTime;
  final String? hours;
  final String? note;

  const CalendarDayInfo({
    required this.day,
    required this.status,
    this.inTime,
    this.outTime,
    this.hours,
    this.note,
  });
}

class StudyHoursInfo {
  final String day;
  final String fullDay;
  final double hours;
  final String focus;
  final bool isToday;

  const StudyHoursInfo({
    required this.day,
    required this.fullDay,
    required this.hours,
    required this.focus,
    this.isToday = false,
  });
}

class MemberInfo {
  final String name;
  final String seat;
  final String status; // 'Present', 'Renewal Due', 'Absent'
  final String plan;
  final String phone;

  const MemberInfo({
    required this.name,
    required this.seat,
    required this.status,
    required this.plan,
    required this.phone,
  });
}

class SeatInfo {
  final int number;
  final String student;
  final String plan;
  final String status;
  final String time;
  final String validTill;

  const SeatInfo({
    required this.number,
    required this.student,
    required this.plan,
    required this.status,
    required this.time,
    required this.validTill,
  });
}

class ActivityItem {
  final String icon; // 'check', 'wallet', 'users', 'clock'
  final String title;
  final String detail;
  final bool isHighlight;

  const ActivityItem({
    required this.icon,
    required this.title,
    required this.detail,
    this.isHighlight = false,
  });
}
