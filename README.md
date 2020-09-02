## Sample Laravel Application For Creating Docker Image with Pack Command
### Quick Start
Setup All Dependencies

bash
```bash
$ cp .env.example .env
$ composer install
$ php artisan key:generate
$ php artisan serve 

(For using webpack)
$ npm run dev
$ npm install
```

Check if laravel is working, see localhost:8000

### Build Image
Since the application required php and nodejs, the packs should be included php and nodejs source

```bash
$ pack build <image-name>:<tag> --buildpack heroku/php --buildpack heroku/nodejs --builder heroku/buildpacks:18
```

### Run Imgae

#### Prerequite
Please Speciy ENV_SECRETS For Running Container.
`ENV_SECRET` Like This
```ENV_SECRETS
DB_CONNECTION=mysql DB_HOST=127.0.0.1
```

#### Run as Web
```bash
$ docker run -d -p 80:8080 -e ENV_SECRETS='<DB_CONNECTION>' --name laravel-w-pack <image-name>:<tag>
```

You can access localhost

### For Customisation
#### Custome Run Time Server
create `nginx_app.conf` then include in Procfile with -C command, then add custom php config by editing `.user.ini`.

#### Custom ENV_SECRETS Formats
If you use other than example format, please change web.sh