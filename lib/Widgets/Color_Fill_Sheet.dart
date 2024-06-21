import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../API/Bloc/Colors/Colors_Bloc.dart';
import '../API/Bloc/Colors/Colors_Event.dart';
import '../API/Bloc/Colors/Colors_State.dart';
import '../API/Repository/Colors_Repo.dart';
import '../Utils/app_constants.dart';
class ColorFilterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorBloc(colorsRepository: ColorsRepository())..add(LoadColors()),
      child: ColorFilterSheetContent(),
    );
  }
}

class ColorFilterSheetContent extends StatefulWidget {
  @override
  _ColorFilterSheetContentState createState() => _ColorFilterSheetContentState();
}

class _ColorFilterSheetContentState extends State<ColorFilterSheetContent> {
  final Set<Color> selectedColors = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getPadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Colors', style: TextStyle(fontSize: getBigFontSize(context))),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SizedBox(height: getSpacing(context)),
          Expanded(
            child: BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                if (state is ColorLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ColorLoaded) {
                  return buildColorGrid(state.colors);
                } else if (state is ColorError) {
                  return Center(child: Text('Failed to load colors'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColorGrid(List<Color> colors) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: getSpacing(context),
        mainAxisSpacing: getSpacing(context),
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        final isSelected = selectedColors.contains(color);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedColors.remove(color);
              } else {
                selectedColors.add(color);
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: isSelected ? Colors.black : Colors.transparent,
                width: 2,
              ),
            ),
            child: isSelected
                ? const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
