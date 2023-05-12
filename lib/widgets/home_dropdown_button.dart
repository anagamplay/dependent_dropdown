import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class HomeDropdownButton extends StatelessWidget {
  String text;
  List<DropdownMenuItem>? items;
  var value;
  ValueChanged? onChanged;

  HomeDropdownButton(this.text, {this.items, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(0,3,10,3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Text(text),
              items: items,
              value: value,
              onChanged: onChanged,
            ),
          ),
        );
      },
    );
  }
}
