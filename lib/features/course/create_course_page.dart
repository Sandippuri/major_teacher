import 'package:flutter/material.dart';

class CreateCoursePage extends StatefulWidget {
  const CreateCoursePage({super.key});
  @override
  CreateCoursePageState createState() => CreateCoursePageState();
}

class CreateCoursePageState extends State<CreateCoursePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String? _category;
  String? _color;
  String? _size;
  String? _quantity;

  final List<String> _categories = ['Shirts', 'Pants', 'Shoes'];
  final List<String> _colors = ['Red', 'Blue', 'Green', 'Yellow'];
  final List<String> _sizes = ['Small', 'Medium', 'Large'];
  final List<String> _quantities = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            ' Course',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name of Course',
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _name = value!;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'College',
                  hintText: 'Select your college',
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _color,
                decoration: const InputDecoration(
                  labelText: 'Color',
                  hintText: 'Select a color',
                ),
                items: _colors.map((color) {
                  return DropdownMenuItem<String>(
                    value: color,
                    child: Text(color),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _color = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a color';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _size,
                decoration: InputDecoration(
                  labelText: 'Size',
                  hintText: 'Select a size',
                ),
                items: _sizes.map((size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _size = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a size';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                  value: _quantity,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    hintText: 'Select a quantity',
                  ),
                  items: _quantities.map((quantity) {
                    return DropdownMenuItem<String>(
                      value: quantity,
                      child: Text(quantity),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _quantity = value;
                    });

                    validator:
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a quantity';
                      }
                      return null;
                    };
                  }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Do something with the form data
                    print('Name: $_name');
                    print('Category: $_category');
                    print('Color: $_color');
                    print('Size: $_size');
                    print('Quantity: $_quantity');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
