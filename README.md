# TravelTech

## Структура проекта

### Высокоуровневая структура системы (C4 Model)
* [C4 Container Diagram — API Gateway & Client Traffic](./docs/architecture/c4-model/c4-container-api-gateway/c4-container-api-gateway.md)
* [C4 Component Diagram — Event-Driven Architecture](./docs/architecture/c4-model/c4-component-event-driven/c4-component-event-driven.md)
* [C4 Component Data Access Matrix (CRUD)](./docs/architecture/c4-model/c4-component-data-access-matrix/c4-component-data-access-matrix.md)

### Архитектура базы данных
* [DDL Скрипт создания таблиц БД](./docs/architecture/database/schema.sql)
* [Интерактивная схема связей (ERD)](./docs/architecture/database/erd/erd.md)
* [Контракт валидации визовых данных (JSON)](./docs/architecture/database/json-schemas/visa_info.json)
* [Контракт лимитов багажа по умолчанию (JSON)](./docs/architecture/database/json-schemas/baggage_default.json)
* [Контракт скоринга альтернативных рейсов (JSON)](./docs/architecture/database/json-schemas/alternative_details.json)

### Системные процессы (Графические схемы UML 2.0 Sequence)
* [Процесс 01: Поиск и групповое бронирование](./docs/architecture/sequences/01_group_booking/01_group_booking.md)
* [Процесс 02: Планирование маршрута и оффлайн-синхронизация](./docs/architecture/sequences/02_offline_sync/02_offline_sync.md)
* [Процесс 03: Асинхронный мониторинг статусов рейсов](./docs/architecture/sequences/03_flight_monitoring/03_flight_monitoring.md)
* [Процесс 04: Валидация конфликтов и персональный скоринг альтернатив](./docs/architecture/sequences/04_recommendation_engine/04_recommendation_engine.md)
* [Процесс 05: Уведомления и автоматическое изменение маршрута группы](./docs/architecture/sequences/05_itinerary_re_routing/05_itinerary_re_routing.md)
* [Процесс 06: Удаление данных по комплаенсу и сбор фидбека](./docs/architecture/sequences/06_compliance_feedback/06_compliance_feedback.md)

### Спецификации API и интеграции
* [Контракт спецификации OpenAPI 3.0.3](./docs/architecture/api/openapi.yaml)
