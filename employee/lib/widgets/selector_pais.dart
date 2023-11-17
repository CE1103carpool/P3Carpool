import 'package:flutter/material.dart';

class selectorPais extends StatefulWidget {
  const selectorPais({super.key});

  @override
  State<selectorPais> createState() => _selectorPaisState();
}

class _selectorPaisState extends State<selectorPais> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
            padding: EdgeInsets.only(left: 20), child: AutoField()),
      ),
    );
  }
}

class AutoField extends StatelessWidget {
  const AutoField({super.key});

  static const List<String> _kOptions = <String>[
    'empresa',
    'atenas',
    'aranjuez',
    'amon',
    'brasilia',
    'cartago',
    'dino',
    'eraldo',
    'fosa',
    'florida',
    'ferdin',
    'guanajuato',
    'guadalajara',
    'garibaldi',
    'handalucía',
    'iridio',
    'irazu',
    'juntas',
    'kilomb',
    'llanoGrande',
    'limon',
    'murcia',
    'nandayure',
    'queretaro',
    'rosario',
    'sacramento',
    'tenorio',
    'texas',
    'uvita',
  ];
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}
