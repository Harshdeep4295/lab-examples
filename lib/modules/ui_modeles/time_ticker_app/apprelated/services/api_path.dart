class APIPath {
  static String jobPath(String uid, String jobId) => 'users/$uid/jobs/$jobId';
  static String jobs(String uid) => 'users/$uid/jobs';
  static String enteriesPath(String uid, String enteryId) =>
      'users/$uid/enteries/$enteryId';
  static String entries(String uid) => 'users/$uid/enteries';
}
