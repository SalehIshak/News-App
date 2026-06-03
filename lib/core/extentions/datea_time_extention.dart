extension DateTimeFormatter on DateTime {
  ///// FORMATE DATE TIME
  String formateDateTime() {
    final defrance = DateTime.now().difference(this);

    if (defrance.inMinutes < 60) return "${defrance.inMinutes} m Ago";
    if (defrance.inHours < 24) return "${defrance.inHours} h ago";
    if (defrance.inDays >= 31) return "${defrance.inDays / 31} mo ago";
    if (defrance.inDays >= 365) return "${defrance.inDays / 365} y ago";
    return "${defrance.inDays} d ago";
  }
}
