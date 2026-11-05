# TravelTech

## Структура проекта

### Архитектура базы данных
* [DDL Скрипт создания таблиц БД](./docs/architecture/schema.sql)
* [Интерактивная схема связей (ERD)](./docs/architecture/erd.md)
* [Контракт валидации визовых данных (JSON)](./docs/architecture/visa_info.json)
* [Контракт лимитов багажа по умолчанию (JSON)](./docs/architecture/baggage_default.json)
* [Контракт скоринга альтернативных рейсов (JSON)](./docs/architecture/alternative_details.json)

### Системные процессы (Графические схемы UML 2.0 Sequence)
* [Процесс 01: Поиск и групповое бронирование](./docs/sequences/01_group_booking.md)
* [Процесс 02: Планирование маршрута и оффлайн-синхронизация](./docs/sequences/02_offline_sync.md)
* [Процесс 03: Асинхронный мониторинг статусов рейсов](./docs/sequences/03_flight_monitoring.md)
* [Процесс 04: Валидация конфликтов и персональный скоринг альтернатив](./docs/sequences/04_recommendation_engine.md)
* [Процесс 05: Уведомления и автоматическое изменение маршрута группы](./docs/sequences/05_itinerary_re_routing.md)
* [Процесс 06: Удаление данных по комплаенсу и сбор фидбека](./docs/sequences/06_compliance_feedback.md)

### Спецификации API и интеграции
* [Контракт спецификации OpenAPI 3.0.3](./docs/api/openapi.yaml)