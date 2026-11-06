# C4 Component Data Access Matrix (CRUD)

| Компонент / Сервис | Таблицы БД (PostgreSQL) | Тип операции | Обоснование бизнес-логики |
| :--- | :--- | :---: | :--- |
| **API Gateway** | `trips`, `trip_members` | **C** | Создание новой поездки и автоматическое связывание участников (`POST /api/v1/trips`) |
| **Booking Service** | `passport_data`, `itinerary_items` | **C, U** | Первичное добавление броней и паспортов; обновление статуса на `confirmed` при получении платежного вебхука |
| **Trip Service** | `itinerary_items`, `passport_data`, `trips` | **R, C, U** | Идемпотентная запись офлайн-изменений из кэша (`/sync`), чтение паспортов группы для экстренного перебронирования альтернатив |
| **RecEngine** | `itinerary_items`, `user_profiles`, `alternative_options` | **R, C** | Анализ конфликтов расписания, проверка ограничений по визам/багажу, сохранение просчитанных вариантов на замену |
| **Notification Service** | `notifications`, `user_profiles` | **C, U** | Сохранение лога отправленных уведомлений, агрегация входящих оценок и отзывов (`POST /api/v1/feedback`) в профиль |
| **Cron Worker** | `passport_data`, `trips` | **U, D** | Автоматическое удаление персональных данных (паспортов) спустя 24 часа после поездки, перевод статуса поездки в `completed` |

**Условные обозначения:**
* **C** (Create) — создание записей (INSERT).
* **R** (Read) — чтение данных (SELECT).
* **U** (Update) — обновление данных (UPDATE).
* **D** (Delete) — удаление данных (DELETE).
