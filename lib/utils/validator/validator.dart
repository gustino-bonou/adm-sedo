
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class TValidator {
  TValidator._();

  static String? validateEmail(String? value) {
    if(value == null || value.isEmpty){
      return 'Ce champ ne peut pas être vide';
    }

    if(!GetUtils.isEmail(value)){
      return 'Adress email invalide';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis.';
    } else if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères.';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Le mot de passe doit contenir au moins une lettre majuscule.';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Le mot de passe doit contenir au moins une lettre minuscule.';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Le mot de passe doit contenir au moins un chiffre.';
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Le mot de passe doit contenir au moins un caractère spécial.';
    }
    return null;
  }

  static bool isValidPassword(String? value) {
    bool isValid = true;
    if (value == null || value.isEmpty) {
      isValid = false;
    } else if (value.length < 8) {
      isValid = false;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      isValid = false;
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      isValid = false;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      isValid = false;
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      isValid = false;
    }
    return isValid;
  }

  static String notValidPasswordMessage(value) {
    if (value == null || value.isEmpty) {
      return  "Le mot de passe est obligatoire";
    } else if (value.length < 8) {
      return "Le mot de passe doit contenir 8 caractères au moins";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return  "Le mot de passe doit contenir unelettre majuscule au moins";
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return  "Le mot de passe doit contenir une lettre minuscule";
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return  "Le mot de passe doit contenir un un chiffre au moins";
    } else if (!value.contains(RegExp(r'[!@#=/$%^&*(),.?":{}|<>*]'))) {
      return "Le mot de passe doit contenir un caractère spécial au moins";
    } else {
      return '';
    }
  }

  static bool isValidEmail(String? value) {
    return GetUtils.isEmail(value ?? "");
  }

  static bool isValidString(String? value, {int min = 3, int max = 200}) {
    if(value != null && GetUtils.isLengthBetween(value, min, max)) {
      return true;
    }
    return false;
  }



  static String? validatePhone(String? value) {

    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    }

    final phoneRegExp = RegExp(r'^\d{8}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Numero invalid, Ex: 60409020';
    }

    return null;
  }

  static bool isValidPhone(String? value, String code) {
    bool isValid = true;
    switch(code) {
      case '+229':
        if(!validPhone(value, 8) && !validPhone(value, 10)){
          isValid = false;
        }
        break;
    }
    return isValid;
  }

  static bool validPhone(value, length) {
    return GetUtils.isNumericOnly(value) && GetUtils.isLengthEqualTo(value, length);
  }

  static String? validateName(String formFieldName, String? value,) {
    if (value == null || value.isEmpty) {
      return 'Le $formFieldName est requis';
    }
    if (!GetUtils.isLengthBetween(value, 3, 30)) {
      return '3 à 30 caratères pour le $formFieldName';
    }
    return null;
  }

  static String? validateTextArea(String formFieldName, String? value,) {
    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vides';
    }
    return null;
  }

  String? validateIsBeforeDate(DateTime? date) {
    if (date == null) {
      return 'Veuillez choisir une date';
    }
    if (date.isAfter(DateTime.now())) {
      return 'La date ne doit pas dépasser la date du jour';
    }
    return null;
  }

  static String? validateNullableString(String? value) {
    return null;
  }



  static String? validateNumeric(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    }
    final number = double.tryParse(value);
    if (number == null) {
      return 'Veuillez entrer un nombre valide';
    } else {
      if(number <= 0){
        return 'Veuillez entrer un nombre supérieur à 0';
      }
    }
    return null;
  }

  static String? validateNullableNumeric(String? value) {
    if (value != null && value.isNotEmpty) {
      final number = double.tryParse(value);
      if (number == null) {
        return 'Veuillez entrer un nombre valide';
      }
    }
    return null;
  }

  static String? validateNullableInteger(String? value) {
    if (value != null && value.isNotEmpty) {
      final number = int.tryParse(value);
      if (number == null) {
        return 'Veuillez entrer un nombre valide';
      }
    }
    return null;
  }

  static String? validerLapereaux(String? value) {
    if (value == null || value.isEmpty ) {
      return 'Ce champ ne peut pas être vide';
    }
    int? number = int.tryParse(value);
    if (number == null || number <= 0) {
      return 'Nombre invalide';
    }
    return null;
  }

  static String? validateAge( String? value,) {
    if (value == null || value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    }
    if (!GetUtils.isNumericOnly(value)) {
      return 'Entrer une année valide';
    }
    return null;
  }

  static String? validateDropItem( String? item,) {
    if (item == null) {
      return "Required field";
    } else if (item == "Brazil"){
      return "Invalid item";
    }
    else {
      return null;
    }
  }

  static String? validateDropItemList( List<String>? list) {
    if (list != null && list.isEmpty) {
      return "Choisir au moins un élément";
    }
    else {
      return null;
    }
  }


}