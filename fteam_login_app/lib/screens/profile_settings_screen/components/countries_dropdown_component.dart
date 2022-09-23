import 'package:flutter/material.dart';
import 'package:monorepo_design_system/monorepo_design_system.dart';

import '../../../core/models/country_model.dart';

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
            style: AppFontTheme.appTextLabel,
          ),
        ),
        DropdownButtonFormField(
          isExpanded: true,
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          menuMaxHeight: 300,
          hint: Text(
            'Selecte the country',
            style: AppFontTheme.appTextHint,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 24,
            color: AppColors.colorsIconGrey, // TODO: COLOR
          ),
          onChanged: (countrySelected) => {},
          items: countriesList.map((country) {
            return DropdownMenuItem(
              value: country,
              child: Text(
                '${country.flag} ${country.name}',
                style: AppFontTheme.appTextHint,
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on_outlined,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
            contentPadding: const EdgeInsets.only(
              right: 0,
              top: 13,
              left: 12,
              bottom: 13,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Theme.of(context).errorColor,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                color: Theme.of(context).errorColor,
                width: 1.5,
              ),
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
