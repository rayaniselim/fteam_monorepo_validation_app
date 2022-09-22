import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'country_list_component.dart';

class CountriesDropdownComponent extends StatelessWidget {
  const CountriesDropdownComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      dropdownColor: AppColors.colorsBackgroundWhite,
      borderRadius: BorderRadius.circular(10),
      menuMaxHeight: 300,
      hint: const Text('Selecte the country'),
      icon: const Icon(
        // Icons.edit_location_outlined,
        Icons.keyboard_arrow_down_outlined,
        size: 30,
        color: AppColors.colorsIconGrey,
      ),
      onChanged: (countrySelected) => {},
      items: countriesList.map((country) {
        return DropdownMenuItem(
          value: country,
          child: Text(
            '   ${country.flag}     ${country.name}',
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.colorsHintText,
            ),
          ),
        );
      }).toList(),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: AppColors.colorsError,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: AppColors.colorsError, width: 1.5),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}
