# Golden Image Packer for Yandex Cloud

## EN

Sample `Packer` project for building a reusable Ubuntu 22.04 golden image for `Yandex Compute Cloud`.

The image is intentionally limited to standart conf:

- system updates;
- base utilities;
- `cloud-init`;
- SSH baseline hardening;
- baseline host firewall;
- `journald` baseline logging;
- cleanup and image finalization steps.

## RU

Пример проекта на `Packer` для сборки переиспользуемого golden image на базе Ubuntu 22.04 для `Yandex Compute Cloud`.

Образ специально ограничен стандартной настройкой:

- системные обновления;
- базовые утилиты;
- `cloud-init`;
- базовый SSH hardening;
- базовый host firewall;
- базовая настройка логирования через `journald`;
- очистка системы перед финализацией образа.

## Project Layout / Структура проекта

```text
.
├── README.md
├── docs/
│   ├── architecture.md
│   ├── decisions.md
│   └── image-contents.md
└── packer/
    ├── example.auto.pkrvars.hcl
    ├── ubuntu.pkr.hcl
    ├── variables.pkr.hcl
    ├── versions.pkr.hcl
    └── scripts/
        ├── 01-system-update.sh
        ├── 02-base-packages.sh
        ├── 03-cloud-init.sh
        ├── 04-ssh-hardening.sh
        ├── 05-firewall.sh
        ├── 06-journald.sh
        ├── 07-cleanup.sh
        └── 08-smoke-test.sh
```

## What Is Included / Что входит в образ

- Ubuntu 22.04 base from Yandex Cloud public image family
- security and package updates during build
- common CLI utilities
- `cloud-init`
- SSH hardening baseline
- `ufw` baseline firewall
- `journald` retention and storage tuning
- cleanup before image finalization

- Базовая Ubuntu 22.04 из публичного image family Yandex Cloud
- обновления пакетов и security updates во время сборки
- базовые CLI-утилиты
- `cloud-init`
- базовый SSH hardening
- базовый firewall через `ufw`
- настройки хранения и ограничения логов `journald`
- очистка системы перед финализацией образа

## Requirements / Требования

- `packer >= 1.11.0`
- access to `Yandex Cloud`
- folder, subnet, and availability zone prepared for image builds
- token or IAM token with enough permissions to create compute resources

- `packer >= 1.11.0`
- доступ к `Yandex Cloud`
- подготовленные `folder`, `subnet` и `availability zone` для сборки образа
- токен или IAM token с правами на создание compute-ресурсов

## Quick Start / Быстрый старт

1. Copy and adjust variables:
1. Скопируйте шаблон переменных и отредактируйте его:

```bash
cp packer/example.auto.pkrvars.hcl packer/local.auto.pkrvars.hcl
```

2. Fill these values in `packer/local.auto.pkrvars.hcl`:
2. Заполните в `packer/local.auto.pkrvars.hcl` следующие значения:

- `token`
- `folder_id`
- `subnet_id`
- `zone`
- optional image naming fields
- при необходимости поля для именования образа

3. Format the configuration:
3. Отформатируйте конфигурацию:

```bash
packer fmt -recursive packer
```

4. Initialize plugins:
4. Инициализируйте плагины:

```bash
packer init packer
```

5. Validate the template:
5. Проверьте шаблон:

```bash
packer validate -var-file=packer/local.auto.pkrvars.hcl packer
```

6. Build the image:
6. Запустите сборку образа:

```bash
packer build -var-file=packer/local.auto.pkrvars.hcl packer
```

## Result / Результат

`Packer` creates a temporary VM in `Yandex Compute Cloud`, provisions it, shuts it down, and produces a reusable custom image in your target folder.

`Packer` создает временную VM в `Yandex Compute Cloud`, применяет provisioning-скрипты, выключает ее и публикует переиспользуемый custom image в указанной папке.
