import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginSection extends StatelessWidget {
  final String dividerText;
  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;
  final VoidCallback? onX;
  final VoidCallback? onInstagram;

  const SocialLoginSection({
    super.key,
    this.dividerText = "Or Sign Up with",
    this.onGoogle,
    this.onFacebook,
    this.onX,
    this.onInstagram,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(icon: FontAwesomeIcons.google, onPressed: onGoogle),

        const SizedBox(width: 15),

        _buildSocialButton(
          icon: FontAwesomeIcons.facebook,
          onPressed: onFacebook,
        ),

        const SizedBox(width: 15),

        _buildSocialButton(icon: FontAwesomeIcons.xTwitter, onPressed: onX),

        const SizedBox(width: 15),

        _buildSocialButton(
          icon: FontAwesomeIcons.instagram,
          onPressed: onInstagram,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.socialBorderColor.withValues(alpha: 0.3),
          ),
        ),
        child: Center(
          child: FaIcon(icon, size: 22, color: AppColors.socialIconColor),
        ),
      ),
    );
  }
}
