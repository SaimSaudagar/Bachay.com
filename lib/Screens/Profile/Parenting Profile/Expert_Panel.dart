import 'package:flutter/material.dart';
import '../../../Utils/app_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExpertPanelScreen(),
    );
  }
}

class ExpertPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expert Panel',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getBigFontSize(context)),
            ),
            Text(
              'Specialist Doctors',
              style: TextStyle(color: Colors.grey, fontSize: getFontSize(context)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PanelSection(
              context: context,
              title: 'Nutritionist Panel',
              experts: [
                Expert(
                  name: 'Dr. Sameer Khan',
                  specialty: 'Child Specialist, MBA, P.scY',
                  experience: '08 Years of Experience',
                  imagePath: 'assets/doctor_image.png',
                ),
                Expert(
                  name: 'Dr. Musa Karam',
                  specialty: 'MBBS, DNB, DCH',
                  experience: '11 Years of Experience',
                  imagePath: 'assets/doctor_image2.png',
                ),
                Expert(
                  name: 'Dr. Yasir Walled',
                  specialty: 'MBBS, MD',
                  experience: '18 Years of Experience',
                  imagePath: 'assets/doctor_image3.png',
                ),
              ],
              iconPath: 'assets/images/Expert Panel.png',
            ),
            SizedBox(height: getSpacing(context) * 5),
            PanelSection(
              context: context,
              title: 'Gynaecologist Panel',
              experts: [
                Expert(
                  name: 'Dr. Sameer Khan',
                  specialty: 'Child Specialist, MBA, P.scY',
                  experience: '08 Years of Experience',
                  imagePath: 'assets/doctor_image.png',
                ),
                Expert(
                  name: 'Dr. Yasir Walled',
                  specialty: 'MBBS, MD',
                  experience: '18 Years of Experience',
                  imagePath: 'assets/doctor_image3.png',
                ),
              ],
              iconPath: 'assets/images/Expert Panel.png',
            ),
          ],
        ),
      ),
    );
  }
}

class PanelSection extends StatelessWidget {
  final BuildContext context;
  final String title;
  final List<Expert> experts;
  final String iconPath;

  PanelSection({required this.context, required this.title, required this.experts, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(getPadding(context)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              Image.asset(iconPath, height: 24.0, width: 24.0),
              SizedBox(width: getPadding(context)),
              Text(title, style: TextStyle(fontSize: getBigFontSize(context), color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(height: getSpacing(context)),
        ...experts.map((expert) => ExpertTile(expert: expert, context: context)).toList(),
      ],
    );
  }
}

class ExpertTile extends StatelessWidget {
  final Expert expert;
  final BuildContext context;

  ExpertTile({required this.expert, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getSpacing(context)),
      padding: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(expert.imagePath),
          ),
          SizedBox(width: getPadding(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expert.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: getBigFontSize(context))),
                Text(expert.specialty, style: TextStyle(fontSize: getFontSize(context))),
                Text(expert.experience, style: TextStyle(fontSize: getFontSize(context), color: Colors.pink)),
              ],
            ),
          ),
          SizedBox(width: getPadding(context)),
          ElevatedButton(
            onPressed: () {},
            child: Text('Visit Profile'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Expert {
  final String name;
  final String specialty;
  final String experience;
  final String imagePath;

  Expert({required this.name, required this.specialty, required this.experience, required this.imagePath});
}
