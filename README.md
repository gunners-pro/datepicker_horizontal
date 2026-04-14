# DatePicker Horizontal

A customizable horizontal date picker widget for Flutter with support for localization and flexible styling.

---

## ✨ Features

- Horizontal scrollable date picker
- Date selection with callback
- Customizable colors and styles
- Localization support using `intl`

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  datepicker_horizontal: ^0.1.1
```

---

## 🚀 Usage

```dart
DatePickerHorizontal(
  initialDate: DateTime.now(),
  daysCount: 10,
  locale: 'pt_BR',
  selectedColor: Colors.blue,
  textColor: Colors.black,
  onDateSelected: (date) {
    print(date);
  },
)
```

---

## 🎨 Customization

You can customize:

- selectedColor
- textColor
- selectedWeekDayTextColor
- selectedDayTextColor
- itemWidth
- itemHeight

---

## 📄 License
MIT License