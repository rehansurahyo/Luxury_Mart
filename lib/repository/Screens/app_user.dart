class AppUser {
  final String uid;
  final String phone;
  final String name;
  final String? email;

  AppUser({
    required this.uid,
    required this.phone,
    required this.name,
    this.email,
  });

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'phone': phone,
    'name': name,
    'email': email,
    'updatedAt': DateTime.now().toIso8601String(),
  };

  factory AppUser.fromMap(Map<String, dynamic> m) => AppUser(
    uid: m['uid'],
    phone: m['phone'],
    name: m['name'] ?? '',
    email: m['email'],
  );
}
