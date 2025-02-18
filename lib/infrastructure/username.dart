import 'package:formz/formz.dart';

// Define input validation errors
enum UsenameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsenameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);

  //
  String? get errorMesague {
    if (isValid || isPure) return null;
    if (displayError == UsenameError.empty) return 'El campo es requerido';
    if (displayError == UsenameError.length) {
      return 'El campo debe tener al menos 6 caracteres';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UsenameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return UsenameError.empty;
    }
    if (value.length < 6) {
      return UsenameError.length;
    }
    return null;
  }
}
