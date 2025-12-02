import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Last updated: December 2, 2024',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              'Introduction',
              'KeepReceipt ("we", "our", or "us") is committed to protecting your privacy. '
              'This Privacy Policy explains how we collect, use, and safeguard your information '
              'when you use our mobile application.',
            ),
            _buildSection(
              context,
              'Information We Collect',
              'KeepReceipt is an offline-first application. We collect and store the following '
              'information locally on your device:\n\n'
              '• Receipt images you capture\n'
              '• Receipt details you enter (store name, amount, date, category, notes)\n'
              '• App usage data for crash reporting (if enabled)',
            ),
            _buildSection(
              context,
              'How We Use Your Information',
              'Your information is used solely for:\n\n'
              '• Storing and organizing your receipts\n'
              '• Providing search and filtering functionality\n'
              '• Improving app stability through crash reports\n\n'
              'We do NOT:\n'
              '• Share your data with third parties\n'
              '• Sell your information\n'
              '• Use your data for advertising',
            ),
            _buildSection(
              context,
              'Data Storage',
              'All your receipt data is stored locally on your device using Hive database. '
              'Receipt images are saved in your device\'s application directory. '
              'Your data never leaves your device unless you explicitly enable cloud sync '
              '(future feature).',
            ),
            _buildSection(
              context,
              'Camera and Storage Permissions',
              'We request the following permissions:\n\n'
              '• Camera: To capture receipt photos\n'
              '• Storage: To save receipt images locally\n\n'
              'These permissions are used only for their stated purposes and can be '
              'revoked at any time in your device settings.',
            ),
            _buildSection(
              context,
              'Crash Reporting',
              'We use Firebase Crashlytics to collect anonymous crash reports and error logs. '
              'This helps us identify and fix bugs. No personally identifiable information '
              'is collected through crash reports.',
            ),
            _buildSection(
              context,
              'Data Security',
              'We implement appropriate security measures to protect your data:\n\n'
              '• Local storage encryption (optional)\n'
              '• Secure file handling\n'
              '• No data transmission to external servers',
            ),
            _buildSection(
              context,
              'Your Rights',
              'You have the right to:\n\n'
              '• Access your data (all stored locally)\n'
              '• Delete your data (uninstall the app)\n'
              '• Export your data (future feature)\n'
              '• Opt-out of crash reporting',
            ),
            _buildSection(
              context,
              'Children\'s Privacy',
              'Our app does not knowingly collect information from children under 13. '
              'If you believe we have collected information from a child, please contact us.',
            ),
            _buildSection(
              context,
              'Changes to This Policy',
              'We may update this Privacy Policy from time to time. We will notify you of '
              'any changes by posting the new Privacy Policy in the app.',
            ),
            _buildSection(
              context,
              'Contact Us',
              'If you have questions about this Privacy Policy, please contact us at:\n\n'
              'Email: privacy@keepreceipt.com\n'
              'Website: www.keepreceipt.com',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
