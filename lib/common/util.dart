import 'dart:ui';

List<Color> appointmentColor = [
  const Color(0xFF0F8644),
  const Color(0xFF8B1FA9),
  const Color(0xFFD20100),
  const Color(0xFFFC571D),
  const Color(0xFF36B37B),
  const Color(0xFF01A1EF),
  const Color(0xFF3D4FB5),
  const Color(0xFFE47C73),
  const Color(0xFF636363),
  const Color(0xFF0A8043)];

// 값이 빈 경우를 확인
String? checkIsEmptry(value) {
  if (value!.isEmpty) {
    return 'it is Empty!';
  }
  return null;
}