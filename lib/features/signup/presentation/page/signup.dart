import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segments_clean_arch/features/home/presentation/provider/segment_provider.dart';

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});

  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Dummy data for segments and subsegments
  final List<Map<String, dynamic>> _segments = [
    {
      'id': '1',
      'name': 'Segment 1',
      'subSegments': [
        {'id': '1-1', 'name': 'SubSegment 1.1'},
        {'id': '1-2', 'name': 'SubSegment 1.2'},
      ],
    },
    {'id': '2', 'name': 'Segment 2 (No Subsegments)', 'subSegments': []},
    {
      'id': '3',
      'name': 'Segment 3',
      'subSegments': [
        {'id': '3-1', 'name': 'SubSegment 3.1'},
      ],
    },
  ];

  Map<String, dynamic>? _selectedSegment;
  Map<String, dynamic>? _selectedSubSegment;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(segmentsProvider.notifier).fetchSegments();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> subSegments = _selectedSegment?['subSegments'] ?? [];
    final segmentData = ref.watch(segmentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Map<String, dynamic>>(
              decoration: const InputDecoration(
                labelText: 'Select Segment',
                border: OutlineInputBorder(),
              ),
              value: _selectedSegment,
              items: _segments.map((segment) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: segment,
                  child: Text(segment['name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSegment = value;
                  _selectedSubSegment =
                      null; // Reset subsegment on segment change
                });
              },
            ),
            if (subSegments.isNotEmpty) ...[
              const SizedBox(height: 16),
              DropdownButtonFormField<Map<String, dynamic>>(
                decoration: const InputDecoration(
                  labelText: 'Select Sub Segment',
                  border: OutlineInputBorder(),
                ),
                value: _selectedSubSegment,
                items: subSegments.map((subSegment) {
                  return DropdownMenuItem<Map<String, dynamic>>(
                    value: subSegment,
                    child: Text(subSegment['name']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSubSegment = value;
                  });
                },
              ),
            ],
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Implement sign up logic here
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
