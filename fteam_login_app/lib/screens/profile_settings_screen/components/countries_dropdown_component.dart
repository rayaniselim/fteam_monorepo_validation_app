import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';
import 'country_list_component.dart';

class CountriesDropdownComponent extends StatelessWidget {
  const CountriesDropdownComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
          child: Text(
            'Country',
            style: AppFontSize.appFontSizeTextLabel.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        DropdownButtonFormField(
          isExpanded: true,
          dropdownColor: AppColors.colorsBackgroundWhite,
          borderRadius: BorderRadius.circular(10),
          menuMaxHeight: 300,
          hint: Text(
            'Selecte the country',
            style: AppFontSize.appFontSizeTextHint.copyWith(
              color: AppColors.colorsHintText,
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 24,
            color: AppColors.colorsIconGrey,
          ),
          onChanged: (countrySelected) => {},
          items: countriesList.map((country) {
            return DropdownMenuItem(
              value: country,
              child: Text(
                '${country.flag} ${country.name}',
                style: AppFontSize.appFontSizeTextHint.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.colorsHintText,
                ),
              ),
            );
          }).toList(),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.location_on_outlined,
              color: AppColors.primaryColor,
              size: 24,
            ),
            contentPadding: EdgeInsets.only(
              right: 0,
              top: 13,
              left: 12,
              bottom: 13,
            ),
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
        ),
      ],
    );
  }
}
