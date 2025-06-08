import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart'; // For additional animations

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anil Bhattarai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black87,
          displayColor: Colors.black87,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white70,
          displayColor: Colors.white70,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anil Bhattarai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black87,
          displayColor: Colors.black87,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white70,
          displayColor: Colors.white70,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Anil Bhattarai'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.brightness_7 : Icons.brightness_4),
              onPressed: _toggleTheme,
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ResponsiveLayout(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  const [
                        // About Me Section
                        AboutSection(),
                        SizedBox(height: 32),
                        // Projects Section
                        ProjectsSection(),
                        SizedBox(height: 32),
                        // Skills Section
                        SkillsSection(),
                        SizedBox(height: 32),
                        // Education Section
                        EducationSection(),
                        SizedBox(height: 32),
                        // Work Experience Section
                        WorkExperienceSection(),
                        SizedBox(height: 32),
                        // Training & Development Section
                        TrainingSection(),
                        SizedBox(height: 32),
                        // Certifications Section
                        CertificationsSection(),
                        SizedBox(height: 32),
                        // Interests Section
                        InterestsSection(),
                        SizedBox(height: 32),
                        // Contact Section
                        ContactSection(),
                        SizedBox(height: 32),
                        // Footer
                        _Footer(),
                      ]
                      .map(
                        (widget) =>
                            widget.animate().fadeIn(duration: 600.ms).slideX(),
                      )
                      .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget child;

  const ResponsiveLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: child,
            ),
          );
        }
        return child;
      },
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'About Me',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 16),
        _Avatar(),
        SizedBox(height: 18),
        _TitleText(),
        SizedBox(height: 8),
        _LocationText(),
        SizedBox(height: 16),
        _DescriptionText(),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _AboutSectionAvatarState.zoomNotifier.value = true,
      onExit: (_) => _AboutSectionAvatarState.zoomNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _AboutSectionAvatarState.zoomNotifier,
        builder: (context, zoomed, child) {
          return AnimatedScale(
            scale: zoomed ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/FinalImage.jpg'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Aspiring Flutter Developer | MERN Stack Enthusiast | Content Creator',
          textStyle: TextStyle(fontSize: isWide ? 24 : 18),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: 1,
    );
  }
}

class _LocationText extends StatelessWidget {
  const _LocationText();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return Text(
      'Rupandehi, Lumbini, Nepal',
      style: TextStyle(fontSize: isWide ? 16 : 14),
      textAlign: isWide ? TextAlign.left : TextAlign.center,
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText();

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    return SelectableText(
      'Experienced Flutter developer passionate about crafting visually appealing, high-performance mobile apps with clean UI, responsive layouts, and robust state management. '
      'Proficient in the MERN stack (MongoDB, Express.js, React, Node.js), I build scalable, secure, and maintainable web applications. '
      'My expertise extends to integrating REST APIs, Firebase, and cloud services, ensuring seamless user experiences and real-time functionality. '
      'I thrive on solving complex problems, optimizing performance, and delivering reliable, user-centric solutions across the full stack. '
      'Driven by curiosity and a commitment to continuous learning, I stay updated with the latest technologies to deliver innovative and impactful digital products.',
      style: TextStyle(fontSize: isWide ? 16 : 14, height: 1.5),
      textAlign: TextAlign.justify,
      showCursor: false,
      cursorWidth: 0,
      cursorColor: Colors.transparent,
    );
  }
}

class _AboutSectionAvatarState {
  static final ValueNotifier<bool> zoomNotifier = ValueNotifier<bool>(false);
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Skills',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 16),
        _SkillsWrap(),
      ],
    );
  }
}

class _SkillsWrap extends StatelessWidget {
  const _SkillsWrap();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...[
              'Flutter',
              'Dart',
              'Firebase',
              'REST API',
              'Git',
              'Provider',
              'Riverpod',
              'MERN Stack',
              'JavaScript',
              'TypeScript',
              'Python',
              'Redux',
              'TailwindCSS',
              'Django',
              'AWS',
              'Docker',
              'UI/UX Design',
              'Figma',
              'Adobe Creative Suite',
              'Networking',
              'Cybersecurity',
            ]
            .map(
              (skill) => Chip(
                label: Text(skill),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            )
            .toList(),
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          const [
            Text(
              'Projects',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 16),
            ProjectCard(
              title: 'ECS Hub – Social Media Platform',
              description:
                  'Built a scalable MERN stack social media platform with user authentication, real-time chat, notifications, and profile management.',
              technologies: [
                'MERN Stack',
                'MongoDB',
                'Express.js',
                'React',
                'Node.js',
              ],
            ),
            SizedBox(height: 16),
            ProjectCard(
              title: 'Automatic Water Level Monitor & Bluetooth RC Car',
              description:
                  'Created an Arduino UNO-based smart water level monitor and a Bluetooth-controlled RC car using ESP32 for obstacle avoidance.',
              technologies: ['Arduino', 'ESP32', 'IoT'],
            ),
            SizedBox(height: 16),
            ProjectCard(
              title: 'PLaZa – Online Food Delivery System',
              description:
                  'Developed a complete food ordering system to manage item categories, shopping carts customer data, and orders.',
              technologies: ['Flutter', 'Firebase', 'REST API'],
            ),
          ].map((widget) => widget.animate().fadeIn()).toList(),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  technologies.map((tech) => Chip(label: Text(tech))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.work, size: 28),
            SizedBox(width: 8),
            Text(
              'Work Experience',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: 16),
        ExperienceCard(
          title: 'Chip-Level Hardware & Networking Specialist',
          company: 'Siddhababa Computer, Rupandehi',
          duration: 'Jul 2019 – Dec 2021',
          points: [
            'Conducted chip-level diagnostics and repair for various computing devices.',
            'Installed and maintained networking infrastructure for small offices and clients.',
          ],
        ),
        SizedBox(height: 16),
        ExperienceCard(
          title: 'Graphics Designer & Hardware Technician',
          company: 'Himalayan Computer Institute, Galyang, Syangja',
          duration: 'Jul 2018 – Jul 2019',
          points: [
            'Designed marketing and educational graphics (brochures, banners, etc.)',
            'Handled PC/laptop troubleshooting and hardware and software servicing.',
          ],
        ),
      ],
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final String duration;
  final List<String> points;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.duration,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(company),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(duration),
              ],
            ),
            const SizedBox(height: 8),
            ...points.map(
              (point) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(child: Text(point)),
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

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.school, size: 28),
            SizedBox(width: 8),
            Text(
              'Education',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: 16),
        EducationCard(
          degree: 'Bachelor of Engineering in Computer Engineering',
          institution: 'Lumbini Engineering College, Bhalwari, Rupandehi',
          duration: 'Expected OCT 2025',
        ),
        SizedBox(height: 16),
        EducationCard(
          degree: '+2 in Science',
          institution: 'Kalika Higher Secondary School, Butwal',
          duration: 'Graduated June 2019',
        ),
      ],
    );
  }
}

class EducationCard extends StatelessWidget {
  final String degree;
  final String institution;
  final String duration;

  const EducationCard({
    super.key,
    required this.degree,
    required this.institution,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              degree,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Text(institution),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(duration),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TrainingSection extends StatelessWidget {
  const TrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.workspace_premium, size: 28),
            SizedBox(width: 8),
            Text(
              'Training & Development',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: 16),
        BulletPoint(
          text: 'Security Systems and Artificial Intelligence – Lec Expo, 2024',
        ),
        BulletPoint(text: 'Robotics and IoT – Dursikshya, Jan 2024'),
        BulletPoint(text: 'Front-End Development with React – September 2023'),
        BulletPoint(text: 'Cybersecurity Bootcamp (7 Days) – June 2022'),
        BulletPoint(text: 'Hardware & Networking Troubleshooting – 2020'),
        BulletPoint(
          text: 'Poster and Brochure Design – Himalayan Computer (2019)',
        ),
        BulletPoint(text: 'Leadership & Communication Skills'),
      ],
    );
  }
}

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.verified, size: 28),
            SizedBox(width: 8),
            Text(
              'Licenses & Certifications',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: 16),
        BulletPoint(
          text:
              'ICIP (Introduction to Critical Infrastructure Protection) – OPSWAT Academy, Jan 2025',
        ),
        BulletPoint(text: 'Door Security System with AI – Lec Expo 2024'),
        BulletPoint(text: 'Robotics & IoT (40 hrs) – Dursikshya, Jan 2024'),
        BulletPoint(text: 'Front-End Development with React – Sept 2023'),
        BulletPoint(text: 'Cybersecurity Bootcamp (7days) – June 2022'),
        BulletPoint(text: '3D Printer Project Exhibition – Lec Expo 2020'),
      ],
    );
  }
}

class InterestsSection extends StatelessWidget {
  const InterestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Row(
          children: [
            Icon(Icons.interests, size: 28),
            SizedBox(width: 8),
            Text(
              'Interests',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: 16),
        _InterestsWrap(),
      ],
    );
  }
}

class _InterestsWrap extends StatelessWidget {
  const _InterestsWrap();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        ...[
              'Curious & Trend-Focused',
              'Online Games',
              'Riding Bikes',
              'Exploring New Tech',
            ]
            .map(
              (interest) => Chip(
                label: Text(interest),
                avatar: Icon(Icons.favorite, size: 18),
              ),
            )
            .toList(),
      ],
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Contact',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(height: 16),
        ContactInfoRow(
          icon: Icons.email,
          text: 'Bhattaraiani2015@gmail.com',
          url: 'mailto:Bhattaraiani2015@gmail.com',
        ),
        SizedBox(height: 8),
        ContactInfoRow(
          icon: Icons.phone,
          text: 'WhatsApp',
          url: 'https://wa.me/9779867294376',
        ),
        SizedBox(height: 16),
        Text('Connect with me:', style: TextStyle(fontSize: 18)),
        SizedBox(height: 18),
        _SocialRow(),
        SizedBox(height: 18),
        ContactForm(),
      ],
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String url;

  const ContactInfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Row(
        children: [Icon(icon, size: 20), const SizedBox(width: 8), Text(text)],
      ),
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialButton(
          icon: Icons.facebook,
          onPressed: () => _launchUrl('https://www.facebook.com/CREALIFY'),
        ),
        SocialButton(
          icon: Icons.code,
          onPressed: () => _launchUrl('https://github.com/Crealify'),
        ),
        SocialButton(
          icon: Icons.linked_camera,
          onPressed: () => _launchUrl('https://www.tiktok.com/@crealify_yt'),
        ),
        SocialButton(
          icon: Icons.camera_alt,
          onPressed:
              () => _launchUrl('https://www.instagram.com/crealify_official'),
        ),
        SocialButton(
          icon: Icons.play_circle_fill,
          onPressed: () => _launchUrl('https://www.youtube.com/@CREALIFY'),
        ),
        SocialButton(
          icon: Icons.work,
          onPressed:
              () => _launchUrl(
                'https://www.linkedin.com/in/anil-Bhattarai-735129307',
              ),
        ),
      ],
    );
  }
}

// Helper function to launch URLs
Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final message = _messageController.text.trim();

      final subject = Uri.encodeComponent('Portfolio Contact from $name');
      final body = Uri.encodeComponent(
        'Name: $name\nEmail: $email\n\n$message',
      );
      final mailtoUrl =
          'mailto:Bhattaraiani2015@gmail.com?subject=$subject&body=$body';

      final uri = Uri.parse(mailtoUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message sent successfully!')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open email client.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Send me a message', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 16),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'Enter your name' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'Enter your email' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            maxLines: 4,
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Enter your message'
                        : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _sendEmail,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Send Message'),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '© ${DateTime.now().year} Anil Bhattarai',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
