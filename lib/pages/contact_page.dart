import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/animated_section.dart';

class ContactPage extends StatefulWidget {
  final bool isMobile;

  const ContactPage({super.key, required this.isMobile});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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

  bool _isLoading = false;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: message.contains('success') ? Colors.green : Colors.red,
      ),
    );
  }


  final String? _userId = "oQcXijKEszsjzPTaG";
  final String? _serviceId = "service_yd4psdx";
  final String? _templateId = "template_1llj3gf";

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        print('xxxxxxx');
        final response = await http.post(
          Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'service_id': _serviceId,
            'template_id': _templateId,
            'user_id': _userId,
            'template_params': {
              'name': _nameController.text,
              'email': _emailController.text,
              'message': _messageController.text,
              'to_email': 'habibkhantz24@gmail.com',
            }
          }),
        );

        print("ddddddd ${response.body}");
        if (response.statusCode == 200) {
          _showSnackBar('Message sent successfully!');
          _clearForm();
        } else {
          _showSnackBar('Failed to send message. Please try again.');
        }
      } catch (e) {
        print('Error: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }


  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      delay: 400,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let\'s work together!',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'I\'m always interested in new opportunities and collaborations.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                _ContactInfo(
                  icon: Icons.email,
                  text: 'habibkhantz24@gmail.com',
                  onTap: () => _launchEmail('habibkhantz24@gmail.com'),
                ),
                _ContactInfo(
                  icon: Icons.phone,
                  text: '+91 9096492106',
                  onTap: () => _launchPhoneCall('+919096492106'),
                ),
                _ContactInfo(
                  icon: Icons.location_on,
                  text: 'Maharashtra, INDIA',
                  onTap: () => _launchMaps(),
                ),

                if (widget.isMobile == true)
                 SingleChildScrollView(
                   child:  _buildMobileContactForm(),
                 ),

                if (widget.isMobile == true)
                  const SizedBox(width: 60),

                // if (widget.isMobile) _buildContactForm(),

              ],
            ),
          ),
          if (!widget.isMobile) const SizedBox(width: 60),
          if (!widget.isMobile) _buildContactForm(),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Your Name',
                labelStyle: const TextStyle(color: Colors.white70),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
                errorStyle: TextStyle(color: Colors.orange.shade300),
              ),
              validator: (value) => _validateRequired(value, 'name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: const TextStyle(color: Colors.white70),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
                errorStyle: TextStyle(color: Colors.orange.shade300),
              ),
              validator: _validateEmail,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Message',
                labelStyle: const TextStyle(color: Colors.white70),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
                errorStyle: TextStyle(color: Colors.orange.shade300),
              ),
              validator: (value) => _validateRequired(value, 'message'),
            ),
            const SizedBox(height: 20),
                      ElevatedButton(
            onPressed: _isLoading ? null : _sendEmail,
            child: _isLoading
                ? CircularProgressIndicator()
                : Text('Send Message'),
          ),
            // ElevatedButton(
            //   onPressed: _sendEmail,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            //   child: const Text(
            //     'Send Message',
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileContactForm() {
    return  Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Your Name',
                labelStyle: const TextStyle(color: Colors.white70),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
                errorStyle: TextStyle(color: Colors.orange.shade300),
              ),
              validator: (value) => _validateRequired(value, 'name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Your Email',
                labelStyle: const TextStyle(color: Colors.white70),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
                errorStyle: TextStyle(color: Colors.orange.shade300),
              ),
              validator: _validateEmail,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Message',
                labelStyle: const TextStyle(color: Colors.white70),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),
                ),
                errorStyle: TextStyle(color: Colors.orange.shade300),
              ),
              validator: (value) => _validateRequired(value, 'message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _sendEmail,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Send Message'),
            ),
            // ElevatedButton(
            //   onPressed: _sendEmail,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            //   child: const Text(
            //     'Send Message',
            //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            //   ),
            // ),
          ],
        ),

    );
  }

  Future<void> _launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      _showSnackBar('Could not launch email client');
    }
  }

  Future<void> _launchPhoneCall(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      _showSnackBar('Could not launch phone app');
    }
  }

  Future<void> _launchMaps() async {
    final uri = Uri.parse('https://maps.google.com/?q=Maharashtra');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      _showSnackBar('Could not launch maps');
    }
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _ContactInfo({
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white70,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class ContactForm extends StatefulWidget {
//   const ContactForm({super.key});
//
//   @override
//   _ContactFormState createState() => _ContactFormState();
// }
//
// class _ContactFormState extends State<ContactForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();
//
//   bool _isLoading = false;
//
//   final String _serviceId = 'service_xxxxx';
//   final String _templateId = 'template_xxxxx';
//   final String _userId = 'user_xxxxx_xxxxx'; // Your public key
//
//   Future<void> _sendEmail() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//
//       try {
//         final response = await http.post(
//           Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
//           headers: {
//             'Content-Type': 'application/json',
//           },
//           body: json.encode({
//             'service_id': _serviceId,
//             'template_id': _templateId,
//             'user_id': _userId,
//             'template_params': {
//               'from_name': _nameController.text,
//               'from_email': _emailController.text,
//               'message': _messageController.text,
//               'to_email': 'your-email@gmail.com', // Your receiving email
//             }
//           }),
//         );
//
//         if (response.statusCode == 200) {
//           _showSnackBar('Message sent successfully!');
//           _clearForm();
//         } else {
//           _showSnackBar('Failed to send message. Please try again.');
//         }
//       } catch (e) {
//         _showSnackBar('Error: $e');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
//
//   void _clearForm() {
//     _nameController.clear();
//     _emailController.clear();
//     _messageController.clear();
//   }
//
//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: message.contains('success') ? Colors.green : Colors.red,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: _nameController,
//             decoration: InputDecoration(labelText: 'Name'),
//             validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
//           ),
//           SizedBox(height: 16),
//           TextFormField(
//             controller: _emailController,
//             decoration: InputDecoration(labelText: 'Email'),
//             validator: (value) => value!.isEmpty || !value.contains('@')
//                 ? 'Please enter a valid email'
//                 : null,
//           ),
//           SizedBox(height: 16),
//           TextFormField(
//             controller: _messageController,
//             decoration: InputDecoration(labelText: 'Message'),
//             maxLines: 5,
//             validator: (value) => value!.isEmpty ? 'Please enter your message' : null,
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _isLoading ? null : _sendEmail,
//             child: _isLoading
//                 ? CircularProgressIndicator()
//                 : Text('Send Message'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
