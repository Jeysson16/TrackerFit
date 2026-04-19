import 'package:flutter/material.dart';

class WorkoutsStatsScreen extends StatelessWidget {
  const WorkoutsStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Workouts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTab('Sets', Icons.arrow_right_alt, true),
                const SizedBox(width: 16),
                _buildTab('Volume', Icons.shopping_bag, false),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Average Sets', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    RichText(text: const TextSpan(
                      children: [
                        TextSpan(text: '10', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                        TextSpan(text: ' sets', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ]
                    )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Sets', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    RichText(text: const TextSpan(
                      children: [
                        TextSpan(text: '71', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                        TextSpan(text: ' sets', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ]
                    )),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
                  child: const Icon(Icons.swap_vert, size: 20),
                )
              ],
            ),
            const SizedBox(height: 8),
            Text('Dec 20 - Dec 26, 2025', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            
            const SizedBox(height: 32),
            _buildBarChartPlaceholder(),
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeFilter('1W', true),
                _buildTimeFilter('1M', false),
                _buildTimeFilter('3M', false),
                _buildTimeFilter('6M', false),
                _buildTimeFilter('1Y', false),
                _buildTimeFilter('All', false),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: const [
                       Text('D', style: TextStyle(fontWeight: FontWeight.bold)),
                       Icon(Icons.arrow_drop_down),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.bar_chart, color: Colors.orange),
                  SizedBox(width: 8),
                  Text('Sets', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('Top 5 Exercises by Sets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Last 30 Days', style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, IconData icon, bool isActive) {
    return Row(
      children: [
        Icon(icon, color: isActive ? Colors.black : Colors.grey, size: 16),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: isActive ? Colors.black : Colors.grey)),
      ],
    );
  }

  Widget _buildTimeFilter(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _buildBarChartPlaceholder() {
    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBar(10, 'Sat', Colors.orange.shade300),
          _buildBar(8, 'Sun', Colors.orange.shade300),
          _buildBar(13, 'Mon', Colors.orange.shade300),
          _buildBar(10, 'Tue', Colors.orange.shade300),
          _buildBar(10, 'Wed', Colors.orange.shade300),
          _buildBar(7, 'Thu', Colors.orange.shade300),
          _buildBar(10, 'Fri', Colors.orange.shade300),
        ],
      ),
    );
  }

  Widget _buildBar(double value, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: value * 12, // Arbitrary scaling for UI mockup
          color: color,
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
      ],
    );
  }
}
