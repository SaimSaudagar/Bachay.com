import 'package:flutter/material.dart';
import '../../../../../Utils/app_constants.dart';

// Reusable FAQ Widget with internal list handling
class FAQWidget extends StatefulWidget {
  @override
  _FAQWidgetState createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {
  // Internally handled FAQ data list
  final List<FAQItem> _faqData = [
    FAQItem(
      question: 'What are the diseases that vaccines prevent?',
      answer: 'Vaccines prevent diseases such as measles, mumps, polio, and influenza.',
    ),
    FAQItem(
      question: 'How are vaccines given?',
      answer: 'Vaccines are typically given by injection, but some can be given orally or nasally.',
    ),
    FAQItem(
      question: 'Which vaccination schedule should I refer for my baby?',
      answer: 'Consult your pediatrician or health organization for the recommended vaccination schedule.',
    ),
    FAQItem(
      question: 'What are vaccines and why are vaccinations important?',
      answer: 'Vaccines help protect you from infectious diseases and prevent the spread of diseases in the community.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: _faqData.map<Widget>((FAQItem item) {
        return Card(
          margin: EdgeInsets.symmetric(
            vertical: getSpacing(context),
            horizontal: getPadding(context),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ExpansionTile(
            key: PageStorageKey<FAQItem>(item),
            title: Text(
              item.question,
              style: outfitBold.copyWith(
                fontSize: getFontSize(context) * 1.1,
              ),
            ),
            trailing: Icon(
              item.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: getFontSize(context) * 1.5,
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(getPadding(context)),
                child: Text(
                  item.answer,
                  style: outfitRegular.copyWith(
                    fontSize: getFontSize(context),
                  ),
                ),
              ),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                item.isExpanded = expanded;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}

// FAQ Item Model
class FAQItem {
  FAQItem({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  String question;
  String answer;
  bool isExpanded;
}
