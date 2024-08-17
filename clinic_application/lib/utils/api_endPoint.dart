// ignore: file_names
// ignore_for_file: library_private_types_in_public_api

class ApiEndPoints {
  static const String basePatientUrl = "http://clinics.runasp.net/api/Patient/";
  static const String baseDoctorUrl = "http://clinics.runasp.net/api/Doctor/";
  static const String baseAdminUrl = "http://clinics.runasp.net/api/Admin/";
  // ignore: duplicate_ignore
  // ignore: library_private_types_in_public_api
  static _PatientEndPoints patientEndPoints = _PatientEndPoints();
  static _DoctorEndPoints doctorEndPoints = _DoctorEndPoints();
  static _AdminEndPoints adminEndPoints = _AdminEndPoints();
}

class _PatientEndPoints {
  final String signUp = "Register";
  final String logIn = "LogIn";
  final String search = "Search";
  final String edit = "EditProfile";
  final String signupAsDoctor = "JoinAsADoctor";
}

class _DoctorEndPoints {
  final String edit = "EditProfile";
  final String viewAppointment = "ViewAppointments ";
  final String rate = "Rates";
  final String viewInvestigates = "ViewInvestigates";
  final String replyInvestigates = "ReplayInvestigates";
  final String addAppointments = "AddAppointments";
}

class _AdminEndPoints {
  final String login = "LogIn";
  final String addDoctor = "AddDoctor";
  final String deleteDoctor = "DeleteDoctor";
  final String viewRequest = "PendingRequests";
}
