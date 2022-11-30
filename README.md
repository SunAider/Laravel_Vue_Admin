# Name

 Middle Server

# Required
- PHP >= 7.3.0
- node.js
- docker
- docker-compose
- composer

# See
- [Laravel](https://laravel.com/)
- [Vue.js](https://jp.vuejs.org/index.html)
- [MDB v4](https://mdbootstrap.com/)


# Setup
```bash
composer global require friendsofphp/php-cs-fixer
export PATH="/usr/local/bin/composer/vendor/bin"
```

```bash
composer install
```

```bash
npm i
```

```bash
cp .env.example .env
```

```bash
php artisan key:generate
```

```bash
make set-up
```

```bash
make set-up-app
```

# Usage

## run application
```bash
make npm-run-watch
```

access to [localhost:8180](localhost:8180)

ブラウザで描画
```

## stop application
```bash
make down
```
