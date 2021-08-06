import 'package:cmzoofv2/ui/pages/animal/components/show_type_botton.dart';
import 'package:flutter/material.dart';

class TypeCategories extends StatefulWidget {
  const TypeCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<TypeCategories> createState() => _TypeCategoriesState();
}

class _TypeCategoriesState extends State<TypeCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShowTypeBotton(),
    );
  }
}
