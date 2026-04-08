# Простое Flutter-приложение с MVVM

Минимальный шаблон приложения с тремя экранами:
- onboarding
- paywall
- home

После «покупки» подписки состояние сохраняется локально через `SharedPreferences`, поэтому при следующем запуске приложение сразу открывает главный экран.

## Что реализовано

1. **Onboarding** — 2 простых экрана с текстом и геометрической иллюстрацией.
2. **Paywall** — стиль конструктивизма: крупная типографика, контрастные блоки, красный/чёрный/бежевый цвета.
3. **Home** — простой контент-экран со списком.
4. **Сохранение подписки** — после симуляции покупки сохраняется флаг в локальном хранилище.
5. **Минимальный код** — только необходимые слои и файлы.

## Структура проекта

```text
lib/
  app.dart
  main.dart
  core/
    storage/
      subscription_storage.dart
  data/
    repositories/
      subscription_repository_impl.dart
  domain/
    models/
      subscription_plan.dart
    repositories/
      subscription_repository.dart
  presentation/
    screens/
      home_screen.dart
      onboarding_screen.dart
      paywall_screen.dart
      splash_screen.dart
    viewmodels/
      app_start_view_model.dart
      home_view_model.dart
      onboarding_view_model.dart
      paywall_view_model.dart
    widgets/
      constructivist_illustration.dart
      subscription_option_card.dart
```

## Как здесь реализован MVVM

В проекте использован лёгкий вариант **MVVM**, где:

### Model
`domain` и часть `data`:
- `subscription_plan.dart` — модель тарифа
- `subscription_repository.dart` — контракт доступа к данным
- `subscription_repository_impl.dart` — реализация репозитория
- `subscription_storage.dart` — локальное сохранение состояния подписки

### ViewModel
`presentation/viewmodels`:
- `AppStartViewModel` — решает, какой экран открыть при запуске
- `OnboardingViewModel` — хранит текущую страницу onboarding
- `PaywallViewModel` — хранит выбранный тариф и обрабатывает покупку
- `HomeViewModel` — отдаёт список данных для главного экрана

Для ViewModel используется `Cubit`, потому что это простой и удобный способ управлять состоянием без лишнего шаблонного кода.

### View
`presentation/screens` и `presentation/widgets`:
- экраны ничего не сохраняют напрямую
- UI реагирует на состояние ViewModel
- переиспользуемые элементы вынесены в отдельные файлы

## Логика запуска

1. `main.dart` создаёт `SubscriptionStorage` и `SubscriptionRepositoryImpl`.
2. `AppStartViewModel` читает флаг подписки из `SharedPreferences`.
3. Если подписка есть — открывается `HomeScreen`.
4. Если подписки нет — открывается `OnboardingScreen`.
5. После нажатия кнопки покупки на `PaywallScreen` вызывается симуляция покупки и сохраняется `true` в локальное хранилище.

## Почему такая структура удобна

- легко заменить локальное хранилище на API или реальную оплату
- UI не зависит от способа хранения данных
- каждая зона ответственности лежит в своём слое
- проект легко расширять новыми фичами

## Запуск

```bash
flutter pub get
flutter run
```

## Зависимости

Используются только минимально необходимые пакеты:
- `flutter_bloc`
- `shared_preferences`

## Что можно добавить дальше

- реальный billing
- `go_router` для декларативной навигации
- unit/widget tests
- отдельную тему и дизайн-систему
