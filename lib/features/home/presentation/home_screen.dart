import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/router/app_router.dart';
import '../domain/entities/exhibit_entity.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(ServiceLocator.getAllFloors)..loadFloors(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('KHÁM PHÁ'),
        leading: IconButton(
          icon: const Icon(Icons.qr_code_scanner_rounded),
          onPressed: () => Navigator.pushNamed(context, AppRouter.pinEntry),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map_rounded),
            onPressed: () => Navigator.pushNamed(context, AppRouter.map),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.primary));
          } else if (state is HomeLoaded) {
            final floors = state.floors;
            return DefaultTabController(
              length: floors.length,
              child: Column(
                children: [
                  Container(
                    color: AppColors.primary,
                    child: TabBar(
                      indicatorColor: AppColors.gold,
                      indicatorWeight: 3,
                      labelColor: AppColors.gold,
                      unselectedLabelColor: Colors.white60,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      tabs: floors.map((f) => Tab(text: f.name)).toList(),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: floors.map((floor) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: floor.exhibits.length,
                          itemBuilder: (context, index) {
                            return _ExhibitCard(exhibit: floor.exhibits[index]);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is HomeError) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: Colors.red)));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ExhibitCard extends StatelessWidget {
  final ExhibitEntity exhibit;

  const _ExhibitCard({required this.exhibit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, AppRouter.detail, arguments: exhibit),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: AppColors.divider,
                    child: const Center(
                      child: Icon(Icons.image_outlined,
                          color: Colors.black26, size: 32),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        exhibit.pinCode,
                        style: const TextStyle(
                          color: AppColors.textLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exhibit.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.headphones_rounded,
                            size: 14, color: AppColors.gold),
                        const SizedBox(width: 4),
                        Text(
                          'Audio guide',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
