import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/views/widgets/surah_grid_card.dart';
import '../controllers/surah_list_controller.dart';
import 'surah_detail_view.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SurahListController());

    return Scaffold(
      appBar: AppBar(title: const Text('Al-Quran',style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Failed to load surahs. Check your connection.'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: controller.loadSurahs,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.surahs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final surah = controller.surahs[index];
            return SurahGridCard(
              surah: surah,
              onTap: () => Get.to(() => SurahDetailView(
                    surahNumber: surah.number,
                    title: surah.englishName,
                  )),
            );
          },
        );
      }),
    );
  }
}