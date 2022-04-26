import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final void Function(String?) onChanged;

  const CountryDropdown(
      {Key? key,
      required this.countries,
      required this.country,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          // The value of the currently selected [DropdownMenuItem].
          items: countries
              .map(
                (country) => DropdownMenuItem(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 12,
                        child: Image.asset(
                            "assets/images/${country.toLowerCase()}_flag.png"),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        country,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  value: country,
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
