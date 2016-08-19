#simple_tier
Первый демо проект, отображающий пример работы terraform с Selectel VPC

##Структура проекта:

В данном проекте используется разбиение файлов описаия по т.н. ролям (назначениям), по одноименным файлам, практически все логические операции были параметризованы, за исключением специальных параметров.

* [variables.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/variables.tf) - список всех переменных проекта окружения
* [privider.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/provider.tf) - описание провайдеров, используемых в окружении. Для Openstack заведомо был создано явное описание, а не использование ENV переменных, чтобы иметь строго-описанные данные окружения.
* [app.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/app.tf) - описание группы инстансов, аналогичны - [db.tf]((https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/db.tf)), [web.tf](https://github.com/express42/terraform_examples/blob/master/selectel/simple_tier/web.tf)