import 'package:aura/screens/maps_screen.dart';
import 'package:aura/screens/movies_screen.dart';
import 'package:aura/screens/other_screen.dart';
import 'package:aura/screens/products_screen.dart';
import 'package:aura/screens/recipes_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.auto_awesome),
              ),
              title: const Text(
                'Welcome to Aura',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              floating: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Featured Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Discover Something New',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter a URL',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              child: const Text(
                                'Analyze',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Section Title
                    Text(
                      'Quick Actions',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),

                    // Quick Action Cards
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.2,
                      children: [
                        _buildQuickActionCard(
                          context,
                          Icons.map_outlined,
                          'Maps',
                          Colors.green,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MapsScreen()),
                            );
                          },
                        ),
                        _buildQuickActionCard(
                          context,
                          Icons.restaurant_menu,
                          'Recipes',
                          Colors.orange,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RecipesScreen()),
                            );
                          },
                        ),
                        _buildQuickActionCard(
                          context,
                          Icons.shopping_bag_outlined,
                          'Products',
                          Colors.blue,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductsScreen()),
                            );
                          },
                        ),
                        _buildQuickActionCard(
                          context,
                          Icons.movie_outlined,
                          'Movies',
                          Colors.red,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MoviesScreen()),
                            );
                          },
                        ),
                        _buildQuickActionCard(
                          context,
                          Icons.more_horiz,
                          'Other',
                          Colors.grey,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OtherScreen()),
                            );
                          },
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

  Widget _buildQuickActionCard(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
