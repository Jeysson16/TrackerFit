import 'package:flutter/material.dart';

class WorkoutCompleteScreen extends StatelessWidget {
  const WorkoutCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Workout Complete', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeatmapPlaceholder(),
              const SizedBox(height: 32),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRecordCard('Volume Record', '3786 lb', 'Front Squat', Icons.emoji_events),
                    const SizedBox(width: 12),
                    _buildRecordCard('Reps Record', '4 reps', 'Front Squat', Icons.stars),
                    const SizedBox(width: 12),
                    _buildRecordCard('1-RM Record', '225 lb', 'Bench Press', Icons.military_tech),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text('Workout Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Update Workout Plan', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Save these changes as the new default for this workout'),
                trailing: Switch(value: false, onChanged: (v) {}),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Done', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeatmapPlaceholder() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Simulated bodies
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.accessibility, size: 200, color: Colors.grey.shade400),
                  const Text('Front', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.accessibility_new, size: 200, color: Colors.grey.shade400),
                   const Text('Back', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                 ],
              )
            ],
          ),
          // Fake heatmap blobs (In a real app, use SVG maps with selected colors)
          Positioned(
             left: 90, top: 100,
             child: Container(width: 40, height: 40, decoration: BoxDecoration(color: Colors.blue.shade500.withOpacity(0.7), shape: BoxShape.circle)),
          ),
          Positioned(
             left: 110, top: 120,
             child: Container(width: 30, height: 50, decoration: BoxDecoration(color: Colors.blue.shade500.withOpacity(0.7), shape: BoxShape.circle)),
          ),
          Positioned(
             right: 90, top: 150,
             child: Container(width: 50, height: 60, decoration: BoxDecoration(color: Colors.blue.shade500.withOpacity(0.7), shape: BoxShape.circle)),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordCard(String title, String value, String exercise, IconData icon) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
           BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: Colors.black, size: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const Text('New!', style: TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              )
            ],
          ),
          const Spacer(),
          Text(exercise, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(title, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
        ],
      ),
    );
  }
}
