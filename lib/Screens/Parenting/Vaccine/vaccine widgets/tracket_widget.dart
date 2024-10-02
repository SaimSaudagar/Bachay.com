import 'package:flutter/material.dart';
import '../../../../Utils/app_constants.dart';

class VaccinationTrackerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getPadding(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius * 2.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius * 2.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(getPadding(context)),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black54],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vaccination Tracker',
                          style: outfitBold.copyWith(
                            color: Colors.white,
                            fontSize: getBigFontSize(context),
                          ),
                        ),
                        SizedBox(height: getSpacing(context)),
                        Text(
                          'Dorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc lptate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora.',
                          style: outfitRegular.copyWith(
                            color: Colors.white70,
                            fontSize: getFontSize(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(getPadding(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getSpacing(context) * 4),
                  _buildFeatureList(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFeatureItem(context, Icons.vaccines, 'Digitize your children vaccination records'),
        _buildFeatureItem(context, Icons.health_and_safety, 'Spot any possible gaps in their protection'),
        _buildFeatureItem(context, Icons.track_changes, 'Track their vaccination in real time'),
        _buildFeatureItem(context, Icons.school, 'Get educated on vaccination'),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: getSpacing(context) * 2),
      child: Row(
        children: [
          Icon(icon, size: getFontSize(context) * 1.2),
          SizedBox(width: getPadding(context) / 2),
          Expanded(
            child: Text(
              text,
              style: outfitRegular.copyWith(fontSize: getFontSize(context)),
            ),
          ),
        ],
      ),
    );
  }
}
