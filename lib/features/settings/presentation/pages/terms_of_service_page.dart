import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms of Service',
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
              'Acceptance of Terms',
              'By downloading, installing, or using KeepReceipt ("the App"), you agree to be '
              'bound by these Terms of Service. If you do not agree to these terms, please '
              'do not use the App.',
            ),
            _buildSection(
              context,
              'Description of Service',
              'KeepReceipt is a mobile application that allows users to:\n\n'
              '• Capture and store receipt images\n'
              '• Organize receipts by category and date\n'
              '• Search and filter receipts\n'
              '• Manage personal expense records\n\n'
              'The App operates primarily offline and stores data locally on your device.',
            ),
            _buildSection(
              context,
              'User Responsibilities',
              'You agree to:\n\n'
              '• Use the App only for lawful purposes\n'
              '• Not attempt to reverse engineer or modify the App\n'
              '• Not use the App to store illegal or inappropriate content\n'
              '• Maintain the security of your device\n'
              '• Back up your data regularly',
            ),
            _buildSection(
              context,
              'Data Ownership',
              'You retain all rights to the data you create and store in the App, including:\n\n'
              '• Receipt images\n'
              '• Receipt information\n'
              '• Notes and categories\n\n'
              'We do not claim ownership of your data.',
            ),
            _buildSection(
              context,
              'Disclaimer of Warranties',
              'THE APP IS PROVIDED "AS IS" WITHOUT WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED. '
              'We do not warrant that:\n\n'
              '• The App will be error-free or uninterrupted\n'
              '• Defects will be corrected\n'
              '• The App is free of viruses or harmful components\n'
              '• Your data will not be lost or corrupted',
            ),
            _buildSection(
              context,
              'Limitation of Liability',
              'TO THE MAXIMUM EXTENT PERMITTED BY LAW, WE SHALL NOT BE LIABLE FOR:\n\n'
              '• Loss of data or receipts\n'
              '• Indirect, incidental, or consequential damages\n'
              '• Loss of profits or business opportunities\n'
              '• Damages resulting from unauthorized access to your device\n\n'
              'You are responsible for backing up your data.',
            ),
            _buildSection(
              context,
              'Intellectual Property',
              'The App, including its design, code, and content, is protected by copyright '
              'and other intellectual property laws. You may not:\n\n'
              '• Copy or modify the App\n'
              '• Create derivative works\n'
              '• Reverse engineer the App\n'
              '• Remove copyright notices',
            ),
            _buildSection(
              context,
              'Updates and Modifications',
              'We reserve the right to:\n\n'
              '• Modify or discontinue the App at any time\n'
              '• Update these Terms of Service\n'
              '• Add or remove features\n\n'
              'Continued use of the App after changes constitutes acceptance of new terms.',
            ),
            _buildSection(
              context,
              'Termination',
              'You may stop using the App at any time by uninstalling it. We reserve the '
              'right to terminate or restrict your access to the App for violation of these terms.',
            ),
            _buildSection(
              context,
              'Privacy',
              'Your use of the App is also governed by our Privacy Policy. Please review '
              'our Privacy Policy to understand how we collect and use information.',
            ),
            _buildSection(
              context,
              'Third-Party Services',
              'The App may use third-party services including:\n\n'
              '• Firebase Crashlytics (crash reporting)\n'
              '• Firebase Analytics (usage analytics)\n\n'
              'These services have their own terms and privacy policies.',
            ),
            _buildSection(
              context,
              'Governing Law',
              'These Terms shall be governed by and construed in accordance with the laws '
              'of your jurisdiction, without regard to conflict of law provisions.',
            ),
            _buildSection(
              context,
              'Severability',
              'If any provision of these Terms is found to be unenforceable, the remaining '
              'provisions will continue in full force and effect.',
            ),
            _buildSection(
              context,
              'Contact Information',
              'For questions about these Terms of Service, please contact us at:\n\n'
              'Email: support@keepreceipt.com\n'
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
