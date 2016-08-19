#simple_tier
Первый демо проект, отображающий пример работы terraform с Selectel VPC

##Структура проекта:

В данном проекте используется разбиение файлов описаия по т.н. ролям (назначениям), по одноименным файлам.
Практически все логические операции были параметризованы, за исключением атрибутов со специальным назначением.

* [variables.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/variables.tf) - список всех переменных проекта/окружения
* [privider.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/provider.tf) - описание провайдеров, используемых в окружении. Для Openstack заведомо было создано явное описание переменных, вместо использования ENV переменных. Актуально при использовании нескольких VPC.
* [app.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/app.tf) - описание группы инстансов, аналогичные - [db.tf]((https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/db.tf)), [web.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/web.tf)