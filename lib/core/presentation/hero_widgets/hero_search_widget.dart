import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, this.onTap, this.focusNode, this.hintText});
  final void Function()? onTap;
  final FocusNode? focusNode;
  final String? hintText;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  InputDecoration get _searchInputDecoration => InputDecoration(
        hintText: widget.hintText ?? 'Searching notes and tasks...',
        hintStyle: AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      );
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      decoration: _searchInputDecoration,
      focusNode: widget.focusNode,
      autocorrect: true,
      onTap: widget.onTap,
    );
  }
}
