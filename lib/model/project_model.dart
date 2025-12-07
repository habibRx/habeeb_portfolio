class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? projectUrl;
  final String? githubUrl;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.projectUrl,
    this.githubUrl,
  });
}

// Sample projects data
final List<Project> projects = [
  Project(
    id: '1',
    title: 'E-Commerce App',
    description: 'A full-featured e-commerce application with cart, payment integration, and user authentication built with Flutter and Firebase.',
    imageUrl: 'assets/images/ecommerce_app.jpg',
    technologies: ['Flutter', 'Dart', 'Firebase', 'Stripe'],
    projectUrl: 'https://example.com',
    githubUrl: 'https://github.com/yourusername/ecommerce-app',
  ),
  Project(
    id: '2',
    title: 'Weather App',
    description: 'Beautiful weather application with real-time data, location services, and animated weather conditions.',
    imageUrl: 'assets/images/weather_app.jpg',
    technologies: ['Flutter', 'Dart', 'REST API', 'Geolocation'],
    githubUrl: 'https://github.com/yourusername/weather-app',
  ),
  Project(
    id: '3',
    title: 'Task Manager',
    description: 'Productivity app with task management, reminders, and collaborative features for teams.',
    imageUrl: 'assets/images/task_manager.jpg',
    technologies: ['Flutter', 'Dart', 'SQLite', 'Provider'],
    projectUrl: 'https://example.com/task-manager',
  ),
  Project(
    id: '4',
    title: 'Fitness Tracker',
    description: 'Health and fitness application with workout plans, progress tracking, and social features.',
    imageUrl: 'assets/images/fitness_tracker.jpg',
    technologies: ['Flutter', 'Dart', 'Firebase', 'Charts'],
    githubUrl: 'https://github.com/yourusername/fitness-tracker',
  ),
];