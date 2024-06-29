import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../Utils/app_constants.dart';

class ChildDetails {
  final String name;
  final String dateOfBirth;
  final String gender;
  final String weight;
  final String height;
  final String imagePath;

  ChildDetails({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.weight,
    required this.height,
    required this.imagePath,
  });
}

class ChildrenDetailsScreen extends StatefulWidget {
  const ChildrenDetailsScreen({Key? key}) : super(key: key);

  @override
  _ChildrenDetailsScreenState createState() => _ChildrenDetailsScreenState();
}

class _ChildrenDetailsScreenState extends State<ChildrenDetailsScreen> {
  List<ChildDetails> children = [];

  void _addChild(ChildDetails child) {
    setState(() {
      children.add(child);
    });
  }

  void _editChild(int index, ChildDetails child) {
    setState(() {
      children[index] = child;
    });
  }

  void _deleteChild(int index) {
    setState(() {
      children.removeAt(index);
    });
  }

  void _showChildDetails(BuildContext context, ChildDetails child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: getPadding(context),
          right: getPadding(context),
          top: getPadding(context),
          bottom: MediaQuery.of(context).viewInsets.bottom + getPadding(context),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Child Detail',
                  style: interBold.copyWith(
                    fontSize: getBigFontSize(context),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: getSpacing(context) * 2),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: FileImage(File(child.imagePath)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.black),
                      onPressed: () {
                        // Edit image functionality
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            Center(
              child: Text(
                child.name,
                style: interBold.copyWith(fontSize: getFontSize(context) * 1.5),
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.grey),
                    onPressed: () {
                      // Edit child details
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                        ),
                        builder: (context) => AddChildBottomSheet(
                          onAddChild: (editedChild) => _editChild(children.indexOf(child), editedChild),
                          initialChild: child,
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteChild(children.indexOf(child));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            _buildDetailRow(context, 'Date of Birth:', child.dateOfBirth),
            _buildDetailRow(context, 'Gender:', child.gender),
            _buildDetailRow(context, 'Weight (KG):', child.weight),
            _buildDetailRow(context, 'Height (CM):', child.height),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSpacing(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: interRegular.copyWith(fontSize: getFontSize(context)),
          ),
          Text(
            value,
            style: interBold.copyWith(fontSize: getFontSize(context)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Children Details',
        subtitle: 'Add Child or edit existing profiles.',
      ),
      body: Padding(
        padding: EdgeInsets.all(getPadding(context)),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                  ),
                  builder: (context) => AddChildBottomSheet(
                    onAddChild: _addChild,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48.0), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, color: Colors.white),
                  SizedBox(width: getSpacing(context)),
                  Text(
                    'Add Child',
                    style: interBold.copyWith(
                      color: Colors.white,
                      fontSize: getFontSize(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getSpacing(context) * 2),
            Expanded(
              child: ListView.builder(
                itemCount: children.length,
                itemBuilder: (context, index) {
                  return _buildChildItem(context, children[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChildItem(BuildContext context, ChildDetails child, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(File(child.imagePath)),
          radius: 30,
        ),
        title: GestureDetector(
          onTap: () => _showChildDetails(context, child),
          child: Row(
            children: [
              Text(
                child.name,
                style: interBold.copyWith(fontSize: getFontSize(context) * 1.2),
              ),
              const Icon(Icons.expand_more),
            ],
          ),
        ),
        subtitle: Text(
          child.dateOfBirth,
          style: interRegular.copyWith(color: Colors.grey, fontSize: getFontSize(context) * 0.9),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.grey),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                  ),
                  builder: (context) => AddChildBottomSheet(
                    onAddChild: (editedChild) => _editChild(index, editedChild),
                    initialChild: child,
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _deleteChild(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget customAppBar(BuildContext context,
      {required String title, required String subtitle}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: interBold.copyWith(
              color: Colors.black,
              fontSize: getBigFontSize(context),
            ),
          ),
          Text(
            subtitle,
            style: interRegular.copyWith(
              color: Colors.grey,
              fontSize: getFontSize(context),
            ),
          ),
        ],
      ),
    );
  }
}

class AddChildBottomSheet extends StatefulWidget {
  final void Function(ChildDetails) onAddChild;
  final ChildDetails? initialChild;

  const AddChildBottomSheet({Key? key, required this.onAddChild, this.initialChild}) : super(key: key);

  @override
  _AddChildBottomSheetState createState() => _AddChildBottomSheetState();
}

class _AddChildBottomSheetState extends State<AddChildBottomSheet> {
  bool isBoySelected = true;
  bool isLbSelected = true;
  bool isInSelected = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  void initState() {
    super.initState();
    if (widget.initialChild != null) {
      nameController.text = widget.initialChild!.name;
      dateController.text = widget.initialChild!.dateOfBirth;
      weightController.text = widget.initialChild!.weight;
      heightController.text = widget.initialChild!.height;
      isBoySelected = widget.initialChild!.gender == 'Male (Boy)';
      _image = XFile(widget.initialChild!.imagePath);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text = DateFormat('dd-MMM-yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getPadding(context),
        right: getPadding(context),
        top: getPadding(context),
        bottom: MediaQuery.of(context).viewInsets.bottom + getPadding(context),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Another Child',
                style: interBold.copyWith(
                  fontSize: getBigFontSize(context),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          SizedBox(height: getSpacing(context) * 2),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: _image == null
                      ? const AssetImage('assets/images/child.png')
                      : FileImage(File(_image!.path)) as ImageProvider,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.black),
                    onPressed: () {
                      _showPickerDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getSpacing(context) * 2),
          _buildTextField(context, 'Child\'s Name', 'Enter Child Name', nameController),
          SizedBox(height: getSpacing(context) * 2),
          _buildDateField(context, 'Date of Birth', 'Enter Child\'s Date of Birth', dateController),
          SizedBox(height: getSpacing(context) * 2),
          _buildWeightHeightField(context, 'Weight', 'Enter Child\'s Weight', _buildWeightSuffix(context)),
          SizedBox(height: getSpacing(context) * 2),
          _buildWeightHeightField(context, 'Height', 'Enter Child\'s Height', _buildHeightSuffix(context)),
          SizedBox(height: getSpacing(context) * 2),
          _buildGenderSelection(context),
          SizedBox(height: getSpacing(context) * 4),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: interBold.copyWith(
                      color: Colors.black,
                      fontSize: getFontSize(context),
                    ),
                  ),
                ),
              ),
              SizedBox(width: getPadding(context)),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final newChild = ChildDetails(
                      name: nameController.text,
                      dateOfBirth: dateController.text,
                      gender: isBoySelected ? 'Male (Boy)' : 'Female (Girl)',
                      weight: weightController.text,
                      height: heightController.text,
                      imagePath: _image?.path ?? '',
                    );
                    widget.onAddChild(newChild);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColorPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: interBold.copyWith(
                      color: Colors.white,
                      fontSize: getFontSize(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint, TextEditingController controller, [IconData? icon]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: getSpacing(context)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
            prefixIcon: icon != null ? Icon(icon) : null,
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: getSpacing(context)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () => _selectDate(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeightHeightField(BuildContext context, String label, String hint, Widget suffix) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: interRegular.copyWith(fontSize: getFontSize(context)),
        ),
        SizedBox(height: getSpacing(context)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: label == 'Weight' ? weightController : heightController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: getPadding(context)),
                  ),
                ),
              ),
              suffix,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWeightSuffix(BuildContext context) {
    return Row(
      children: [
        _buildUnitButton(context, 'LB', isSelected: isLbSelected),
        _buildUnitButton(context, 'KG', isSelected: !isLbSelected),
      ],
    );
  }

  Widget _buildHeightSuffix(BuildContext context) {
    return Row(
      children: [
        _buildUnitButton(context, 'IN', isSelected: isInSelected),
        _buildUnitButton(context, 'CM', isSelected: !isInSelected),
      ],
    );
  }

  Widget _buildUnitButton(BuildContext context, String label, {required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: Colors.grey),
        color: isSelected ? Colors.black : Colors.transparent,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        onPressed: () {
          setState(() {
            if (label == 'LB' || label == 'KG') {
              isLbSelected = (label == 'LB');
            } else {
              isInSelected = (label == 'IN');
            }
          });
        },
        child: Text(
          label,
          style: interRegular.copyWith(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildGenderChip(context, 'Boys', 'assets/images/boy-icon.png', isBoySelected),
        SizedBox(width: getSpacing(context) * 2),
        _buildGenderChip(context, 'Girls', 'assets/images/girl-icon.png', !isBoySelected),
      ],
    );
  }

  Widget _buildGenderChip(BuildContext context, String label, String assetPath, bool isSelected) {
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetPath, height: 24, width: 24),
          SizedBox(width: getSpacing(context)),
          Text(
            "It's a $label",
            style: interRegular.copyWith(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: getFontSize(context),
            ),
          ),
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          isBoySelected = label == 'Boys';
        });
      },
      selectedColor: buttonColorPurple,
      backgroundColor: Colors.grey.shade300,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
    );
  }
}
