## Docker System Version

Ruby version `2.3.3`

Rails version `5.0.2`

Puma version `3.8.2`

Nginx version `up-to-date`

## How to Setup

Setup specific environment config

`$ cp .env.example .env`

`$ vi .env`

Build images

`$ docker-compose build`

Make sure images are built

`$ docker images`

To run containers via docker-compose

`$ docker-compose up`

## How to Use

Send resize request and return resized image file (Resize propotionally)

`http://localhost:80/v1/images/{{image_id}}?height=100&width=100`

Or specific format for the image id

`http://localhost:80/v1/images/{{image_id}}?height=100&width=100&format=png`

Or with single param

`http://localhost:80/v1/images/{{image_id}}?width=100`
