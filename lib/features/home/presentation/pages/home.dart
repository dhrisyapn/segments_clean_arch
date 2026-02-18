import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segments_clean_arch/features/home/presentation/provider/segment_provider.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(segmentsProvider.notifier).fetchSegments();
    });
  }

  @override
  Widget build(BuildContext context) {
    final segmentData = ref.watch(segmentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Segments')),
      body: segmentData.isLoading
          ? const Center(child: CircularProgressIndicator())
          : segmentData.error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(segmentData.error!)],
              ),
            )
          : ListView.builder(
              itemCount: segmentData.segments.length,
              itemBuilder: (context, index) {
                final segment = segmentData.segments[index];
                if (segment.subSegments != null &&
                    segment.subSegments!.isNotEmpty) {
                  return ExpansionTile(
                    title: Text(segment.name ?? ''),
                    subtitle: Text(segment.description ?? ''),
                    children: segment.subSegments!.map((subSegment) {
                      return ListTile(
                        title: Text(subSegment.name ?? ''),
                        subtitle: Text(subSegment.description ?? ''),
                      );
                    }).toList(),
                  );
                }
                return ListTile(
                  title: Text(segment.name ?? ''),
                  subtitle: Text(segment.description ?? ''),
                );
              },
            ),
    );
  }
}
