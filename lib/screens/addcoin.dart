import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFormPage extends StatefulWidget {
  const AddFormPage({Key? key}) : super(key: key);

  @override
  State<AddFormPage> createState() => _SubmitFormPageState();
}

class _SubmitFormPageState extends State<AddFormPage> {
  File? _image;
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitForm() {
    if (_image == null || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please add an image and description.')),
      );
      return;
    }

    // Здесь можно отправить данные на сервер или сохранить локально
    print("Sending form with description: ${_descriptionController.text}");
    print("Image path: ${_image!.path}");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Form sent successfully!')));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // 🔹 Background Image
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'lib/assets/first_page/noisy-gradients.png',
              ), // 👈 Your image path
              fit: BoxFit.cover,
            ),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Submit Form',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // 🖼 Фото блок (30% экрана)
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: screenHeight * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child:
                        _image == null
                            ? Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: Colors.grey,
                              ),
                            )
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.file(_image!, fit: BoxFit.cover),
                            ),
                  ),
                ),
                const SizedBox(height: 30),

                // 📝 Поле описания
                TextField(
                  controller: _descriptionController,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter part...',

                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  maxLines: 4,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter description...',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // 🚀 Кнопка отправки
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Send', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
