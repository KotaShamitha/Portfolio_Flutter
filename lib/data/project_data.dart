class Project {
  final String title;
  final String description;
  final List<String> techStack;
  final String? githubUrl;

  Project({
    required this.title,
    required this.description,
    required this.techStack,
    this.githubUrl,
  });
}

final List<Project> projectList = [
  Project(
    title: 'Talking Buddy',
    description: 'A real-time communication app with audio/video calling using Agora SDK and Stripe for payments.',
    techStack: ['Flutter', 'Agora', 'Stripe', 'Dart'],
    githubUrl: null, // Add link if public
  ),
  Project(
    title: 'KIDaccount Parent App',
    description: 'Flutter app for managing school dismissal with Firebase integration and environment configs.',
    techStack: ['Flutter', 'Firebase', 'Dart'],
  ),
  Project(
    title: 'Pinestem',
    description: 'Educational management platform for students, teachers, and admins with real-time updates.',
    techStack: ['Flutter', 'Firebase', 'Dart'],
  ),
  Project(
    title: 'Truth and Error',
    description: 'Query-based learning app with competitive challenges and category-based content.',
    techStack: ['Flutter', 'Dart'],
  ),
  Project(
    title: '7-Minute Workout',
    description: 'Timer-driven Kotlin app for guided fitness workouts with TTS and Room DB.',
    techStack: ['Kotlin', 'Room DB', 'TTS'],
  ),
  Project(
    title: 'Projemanag (Trello Clone)',
    description: 'Task manager app using Firebase and MVVM with support for board/card workflows.',
    techStack: ['Kotlin', 'Firebase', 'MVVM'],
  ),
];
