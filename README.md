# Konnect 🎓

A Flutter mobile app that connects students with Academic Advisors across universities. Browse advisors by university, search by name or institution, and view full advisor profiles with contact details.

---

## 📱 Screenshots

> _Add screenshots here once the app is running_

---

## ✨ Features

- 🏫 **High School Listing** — Browse all high school with advisor counts
- 🔍 **Smart Search** — Search advisors by name or university in real time
- 👤 **Advisor Profiles** — View full profiles with photo, email, phone, and bio
- 📞 **Contact Actions** — Quick Email and Call buttons on each profile
- ⚡ **Fast & Lightweight** — JSON-based local data, no backend required

---

## 🗂️ Project Structure

```
lib/
├── main.dart                      
├── models/
│   └── advisor.dart               
├── services/
│   └── data_service.dart          
├── providers/
│   └── advisor_provider.dart      
├── screens/
│   ├── home_screen.dart           
│   ├── advisors_screen.dart       
│   └── advisor_detail_screen.dart 
└── widgets/
    ├── university_card.dart        
    └── advisor_card.dart 

assets/
├── data/
│   └── advisors.json              
└── images/
    └── logo.png                   
```

---

## 🚀 Installation

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) `>=3.0.0`
- Android Studio
- Android Emulator (Google Pixel 8a)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/konnect.git
   cd konnect
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| [provider](https://pub.dev/packages/provider) | ^6.1.1 | State management |
| [cupertino_icons](https://pub.dev/packages/cupertino_icons) | ^1.0.6 | iOS-style icons |
| [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) | ^0.13.1 | App icon generation |

---

## 📋 Data Format

Advisors are stored in `assets/data/advisors.json`. To add or edit advisors, follow this structure:

```json
[
  {
    "name": "Dr. Jane Smith",
    "email": "j.smith@university.edu",
    "phone": "+1 234-567-8900",
    "university": "High School Name / University",
    "description": "Brief bio about the advisor.",
    "image": "https://link-to-photo.com/photo.jpg"
  }
]
```

---

## 🛠️ Built With

- [Flutter](https://flutter.dev/) — UI framework
- [Dart](https://dart.dev/) — Programming language
- [Provider](https://pub.dev/packages/provider) — State management

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
