import 'package:flutter/material.dart';
import '../../../../widgets/vet_booking_card.dart';

class AllVetsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> vets;

  AllVetsScreen({required this.vets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách bác sĩ thú y"),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Xử lý khi nhấn vào thông báo
            },
          ),
        ],
      ),
      body: vets.isEmpty
          ? Center(child: Text("Không có bác sĩ thú y nào."))
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm bác sĩ thú y...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Danh sách bác sĩ thú y',
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: vets.map((vet) {
                  return VetBookingCard(
                    name: vet['name'] ?? "Không có tên",
                    specialty: vet['specialization'] ?? "Không xác định",
                    rating: vet['rating'] ?? 0.0,
                    image: vet['avatar'] ?? "https://via.placeholder.com/150",
                    petType: (vet['specialization']?.contains('chó') ?? false)
                        ? 'Chó'
                        : 'Mèo',
                    isAvailable: vet['isAvailable'] ?? true,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
