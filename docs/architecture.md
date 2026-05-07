# Architecture

## EN

This repository focuses on the image-building layer in Yandex Cloud.

Flow:

1. `Packer` creates a temporary VM in `Yandex Compute Cloud` from a public Ubuntu image family.
2. Provisioner scripts apply a reusable OS baseline.
3. `Packer` creates a custom image from the boot disk and stores it in the target folder.
4. Infrastructure tooling such as `Terraform` can create VMs from the resulting image family.
5. First-boot initialization should happen through `cloud-init`.
6. Role-specific configuration should be applied later by `Ansible` or another configuration management tool.
7. Application delivery should happen in a separate deployment step.

## RU

Этот репозиторий сфокусирован на слое сборки образа внутри Yandex Cloud.

Поток работы:

1. `Packer` создает временную VM в `Yandex Compute Cloud` из публичного Ubuntu image family.
2. Provisioning-скрипты накатывают переиспользуемый OS baseline.
3. `Packer` создает custom image из boot disk и сохраняет его в целевую папку.
4. Инфраструктурные инструменты, например `Terraform`, могут создавать VM из полученного image family.
5. Инициализация при первом старте должна выполняться через `cloud-init`.
6. Конфигурация роли машины должна применяться позже через `Ansible` или другой tool конфигурационного управления.
7. Доставка приложения должна происходить отдельным шагом деплоя.
