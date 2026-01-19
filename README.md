# Barbar Saloon App 💈

A Flutter-based mobile application for connecting barbers and salon professionals with customers. Browse and book services from freelance barbers in your area.

## Project Status

🚀 **Initial Commit - Phase 1 Complete (Days 1-2)**

This is the first phase of development covering the core UI foundation and user authentication flows. The second phase will include backend integration, booking system, and payment processing.

---

## ✨ Features (Phase 1 - Completed)

### User Interface
- ✅ **Splash Screen** - App launch animation and branding
- ✅ **Onboarding Screen** - Multi-page introduction carousel with smooth page indicators
- ✅ **Sign Up Screen** - Complete registration form with validation
- ✅ **Verification Screen** - OTP/Email verification flow
- ✅ **Home Screen** - Main app dashboard (foundation)

### UI Components & Widgets
- ✅ **Custom App Bar** - Branded navigation header
- ✅ **Custom Button** - Reusable primary action button
- ✅ **Labeled Text Field** - Input field with label (supports email validation)
- ✅ **Labeled Phone Field** - Phone number input with country code picker
- ✅ **Labeled Dropdown** - Dropdown selection widget (Gender selection)
- ✅ **Social Login Buttons** - Google, Facebook, X (Twitter), Instagram integration UI
- ✅ **Custom Divider with Text** - Styled divider for form sections
- ✅ **Onboarding Page** - Individual carousel page component
- ✅ **Responsive Widget** - Base responsive layout support

### Design System
- ✅ **Custom Color Scheme** - Purple (#6F45F0) and light lavender (#F2F1FF) theme
- ✅ **NunitoSans Font** - Custom typography throughout the app
- ✅ **Responsive Design** - Supports multiple screen sizes

---

## 📦 Tech Stack

- **Framework**: Flutter 3.9.0+
- **Language**: Dart
- **UI Libraries**:
  - `auto_size_text`: Responsive text scaling
  - `smooth_page_indicator`: Page carousel indicator
  - `country_code_picker`: Phone number country selection
  - `font_awesome_flutter`: Icon library
- **Development**: Flutter Lints

---

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── screens/
│   ├── splash_screen.dart            # Launch screen
│   ├── onboarding_screen.dart        # Intro carousel
│   ├── signup_screen.dart            # Registration form
│   ├── verification_screen.dart      # OTP verification
│   └── home_screen.dart              # Main dashboard
├── widgets/
│   ├── app_bar.dart                  # Custom app bar
│   ├── custom_button.dart            # Primary button
│   ├── labeled_text_field.dart       # Text input widget
│   ├── labeled_phone_field.dart      # Phone input widget
│   ├── labeled_dropdown.dart         # Dropdown selector
│   ├── custom_divider_with_text.dart # Styled divider
│   ├── onboarding_page.dart          # Carousel page
│   ├── social_buttons.dart           # Social login buttons
│   └── responsive_widget.dart        # Responsive base
└── launcher/
    └── splash_launcher.dart          # Splash launch logic

assets/
├── images/                           # App images and illustrations
└── fonts/                            # Custom fonts (NunitoSans)
```

---

## 🎯 Planned Features (Phase 2 - Coming Soon)

- 🔄 Backend API Integration
- 📅 Booking & Appointment System
- 💳 Payment Gateway Integration
- ⭐ Rating & Review System
- 👤 User Profile Management
- 📍 Location-based Barber Search
- 🔔 Push Notifications
- 💬 In-app Chat/Messaging

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.9.0 or higher
- Dart SDK
- Android SDK (for Android development)
- Xcode (for iOS development)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd barbar_saloon_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

---

## 🎨 Theme & Branding

### Color Palette
- **Primary Purple**: `#6F45F0`
- **Light Lavender**: `#F2F1FF`
- **Gray Text**: `#767676`

### Typography
- **Font Family**: NunitoSans (Variable font with multiple weights)
- **Font Support**: Regular, Italic styles

---

## 📝 Notes

- Custom phone field includes country code picker integration
- Onboarding carousel supports skip functionality
- All form fields include basic validation
- Social login UI is implemented (backend integration pending)

---

## 🔐 Security Notes

- Password fields are masked
- Form validation is in place
- Backend authentication coming in Phase 2

---

## 📄 License

This project is private and not licensed for public distribution.

---

## 👨‍💻 Development

This is a collaborative project. Phase 1 covers the foundational UI work. Remaining features will be implemented in Phase 2.

**Current Phase**: UI Foundation & Navigation ✅  
**Next Phase**: Backend Integration & Core Features

---

## 📞 Support

For issues or questions, please create an issue in the repository.

---

**Last Updated**: January 19, 2026  
**Version**: 1.0.0
