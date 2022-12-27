#!/bin/bash

cd app
phpunit /test-service/unit/phpunit/.

cd ..

phpstan analyse -l 9 phpstan/phpstan \
    browse-service-code1 \
    browse-service-code2 \
    viz-service-code1 \
    viz-service-code2
