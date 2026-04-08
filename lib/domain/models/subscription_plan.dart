enum SubscriptionPlan {
  monthly(
    title: 'Месяц',
    price: '299 ₽',
    description: 'Гибкий формат без долгих обязательств',
  ),
  yearly(
    title: 'Год',
    price: '1 990 ₽',
    description: 'Экономия 44% и полный доступ на 12 месяцев',
  );

  const SubscriptionPlan({
    required this.title,
    required this.price,
    required this.description,
  });

  final String title;
  final String price;
  final String description;
}
