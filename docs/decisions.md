# Decisions

## Why Ubuntu 22.04 / Почему Ubuntu 22.04

EN: It is common, stable, and widely understood vers.

RU: Это распространенная, стабильная и хорошо узнаваемая версия.

## Why Yandex Cloud / Почему Yandex Cloud

EN: The project is adapted to a real process where images are built through a temporary VM and then published as reusable custom images.

RU: Проект адаптирован под реальный процесс, где образ собирается через временную VM, а затем публикуется как переиспользуемый custom image.

## Why keep the image minimal / Почему образ минимальный

EN: This image should provide a secure and repeatable, not replace role configuration or deployment.

RU: Этот образ должен быть безопасным и воспроизводимым, а не заменять собой конфигурацию роли или деплой.

## Why `ufw` and `journald` / Почему `ufw` и `journald`

EN: They are standard Ubuntu-native choices that are easy to explain and audit in a portfolio project.

RU: Это стандартные Ubuntu-native компоненты, которые легко объяснить и аудировать в портфельном проекте.

## Why no platform-specific agents by default / Почему по умолчанию нет платформенных агентов

EN: The repository aims to present a portable, low-noise. Additional agents should be added only when they are required by the target environment and justified in version control.

RU: Репозиторий задуман как переносимый и не перегруженный. Дополнительные агенты стоит добавлять только тогда, когда они действительно нужны целевому окружению и это явно зафиксировано в version control.
