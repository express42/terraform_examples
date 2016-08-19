#Структура репозитория
[Selectel](https://github.com/express42/terraform_examples/tree/master/selectel) - примеры окружений/проектов в облаке Selectel

* [simple_tier](https://github.com/express42/terraform_examples/tree/master/selectel/simple_tier) - базовый пример, небольшо проекта, состояющего из app/db/web серверов, связанных в одну приватную сеть

#Известные проблемы
[Пересоздание инстансов при изменении count переменной](https://github.com/hashicorp/terraform/issues/3449) - обратить внимание на [коммент](https://github.com/hashicorp/terraform/issues/3449#issuecomment-218955964). Ожидаемый результат - горизонтальное масштабирование


#Направления для исследования
* Поддержка нескольких keypair
* Создание своего образа, возможность разворачиваться из него. Текущая реализация подключает блочный девайс boot типа, на который ставится ОС. Это долго.
* Provisioning в terraform
* Поддержка управления инфраструктуры через libvirt
* Интеграция с vault provider [TBA](https://github.com/hashicorp/terraform/issues/2221)
* Работа с floating IP для случаев с включенным DHCP в private lan. Посмотреть на возможность получения параметров (IP) целевых истансов и последующие их использование при создании floting IP
* Внедрение output vars для более информативного вывода


#Особенности реализации в Selectel
* Для всех проектов, [external-gateway](https://github.com/express42/terraform_examples/blob/master/simple_tier/networking.tf#L21) имеет один и тот же ID.

* Дополнительно создаем [keypair](https://github.com/express42/terraform_examples/blob/master/simple_tier/security.tf), поскольку управление пользователями в панеле управления его не использует