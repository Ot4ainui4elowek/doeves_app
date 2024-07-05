import 'dart:math';

import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';

class CreateTextContentImpl implements CreateContentEntity {
  CreateTextContentImpl({String? text}) {
    id = Random().nextInt(1000);
    controller = AppTextEditingController(text: text);
  }
  @override
  late final int id;
  late final AppTextEditingController controller;
}
