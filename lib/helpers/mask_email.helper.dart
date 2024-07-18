String maskEmail(String email, bool mask) {
  if (!mask) return email;
  final parts = email.split('@');
  if (parts.length != 2) return email;
  final local = parts[0];
  if (local.length <= 3) return email;
  return '${local.substring(0, 3)}****@${parts[1]}';
}
