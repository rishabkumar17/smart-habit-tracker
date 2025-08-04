import 'package:flutter/material.dart';

class AddEditHabitScreen extends StatefulWidget {
  const AddEditHabitScreen({super.key});

  @override
  State<AddEditHabitScreen> createState() => _AddEditHabitScreenState();
}

class _AddEditHabitScreenState extends State<AddEditHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String _selectedRecurrence = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Habit'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Habit Name',
                  border: OutlineInputBorder(),
                ),
                validator: (val) =>
                    val == null || val.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedRecurrence,
                decoration: const InputDecoration(
                  labelText: 'Recurrence',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'Daily', child: Text('Daily')),
                  DropdownMenuItem(value: 'Weekly', child: Text('Weekly')),
                  DropdownMenuItem(value: 'Custom', child: Text('Custom')),
                ],
                onChanged: (val) => setState(() => _selectedRecurrence = val!),
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // TODO: Save logic
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text('Save Habit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
