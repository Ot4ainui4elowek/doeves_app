import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:reactive_variables/reactive_variables.dart';

class PasswordTextEditingController extends AppTextEditingController {
  PasswordTextEditingController({super.text, bool isTextHidden = true})
      : isTextHidden = isTextHidden.rv;

  final Rv<bool> isTextHidden;

  void showPassword() => isTextHidden(false);
  void hidePassword() => isTextHidden(true);
}
