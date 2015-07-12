## Keppler google analytics dashboard 

Engine integrado con google analytics que proporiciona un dashboard agradable, presentando algunas metricas sobre las visitas.

## Requerimientos

* Ruby >= 2.x.x
* Rails >= 4.x.x

## Instalación

Añadir la siguiente linea a su Gemfile

```ruby
gem 'keppler_ga_dashboard', git: 'https://github.com/inyxtech/keppler_ga_dashboard.git'
gem 'google-api-client'
```

Ubicarse en la ruta del proyecto desde la terminal y ejecutar

```ruby
Bundle install
```

```ruby
rake inyx_blog_rails:install:migrations
rake acts_as_taggable_on_engine:install:migrations
rake db:migrate
```

añadir la siguiente linea a su manifesto stylesheets `application.scss`

```ruby
@import 'dashboard'
```

añadir la siguiente ruta a su archivo routes.rb

```ruby
mount KepplerGaDashboard::Engine, :at => '', as: 'dashboard'
```

## Configuración

El engine necesita que el usuario cree una api para google analitycs desde google, esto lo puedes conseguir desde (https://console.developers.google.com), debes crear un cliente y selecionar la opción **cuenta de servicio**, debes generar una calve p12 y guardar el archivo que genera en el siguiente directorio `config/gaAuth`

Luego de haber realizado esto debe agregar los datos de configuración en `secrets.yml` bajo la siguiente configuracion:

```yml
ga_auth:
  :service_account_email_address: "dirección de correo electronico generada por la api"
  :file_key_name: "nombre del archio p12 generado por la api"
```

## Vista

Para copiar las vistas en `app/views/keppller_ga_dashboard` y asi personalizarlas para adaptarlas a sus necesidades, debe ejecutar

```ruby
rake dashboard:copy_views
```