## Name
Dockerising A Rails Stack Project

## Description
This project aims to dockerize a Rails stack, including the Rails application, database, and Nginx server, to facilitate easy deployment and management.

## Visuals
![image](https://github.com/PrahasGR/dockerisation_of_rails/assets/71590687/8c60fa62-7ae8-4bb6-a4a0-49cdaada7096)
![image](https://github.com/PrahasGR/dockerisation_of_rails/assets/71590687/832205c0-8259-4ef1-aa18-ca8b56c8a24d)
![image](https://github.com/PrahasGR/dockerisation_of_rails/assets/71590687/9afc58c9-26cb-41e0-a301-c24178ea6597)


## Installation
To install and run the Dockerized Rails stack, follow these steps:

1. Clone the repository to your local machine.
```bash
git clone project_directory
```
2. Ensure that Docker and Docker Compose are installed on your system.
3. Navigate to the project directory.
```bash
cd project_directory
```
4. Run the `docker-compose up` command to build and start the containers.
```bash
docker-compose up --build
```
For using docker-compose to easily bring these containers up together with a single command:
```bash
docker-compose up --scale web=3 --build
```
on successful execution of this command, it will show:
```bash
[+] Building 0.0s (0/0)  docker:default
2024/03/16 20:32:47 http2: server: error reading preface from client //./pipe/docker_engine: file has already bee[+] Building 3.7s (19/19) FINISHED                                                                docker:default
 => [web internal] load build definition from Dockerfile                                                    0.0s
 => => transferring dockerfile: 654B                                                                        0.0s
 => [web internal] load metadata for docker.io/library/ruby:2.7                                             2.3s
 => [web auth] library/ruby:pull token for registry-1.docker.io                                             0.0s
 => [web internal] load .dockerignore                                                                       0.0s
 => => transferring context: 2B                                                                             0.0s
 => [web internal] load build context                                                                       0.3s
 => => transferring context: 156.72kB                                                                       0.3s
 => [web  1/13] FROM docker.io/library/ruby:2.7@sha256:2347de892e419c7160fc21dec721d5952736909f8c3fbb7f84c  0.0s 
 => CACHED [web  2/13] WORKDIR /app                                                                         0.0s
 => CACHED [web  3/13] COPY Gemfile Gemfile.lock ./                                                         0.0s
 => CACHED [web  4/13] RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -                          0.0s 
 => CACHED [web  5/13] RUN apt-get install -y nodejs                                                        0.0s 
 => CACHED [web  6/13] RUN npm install -g yarn                                                              0.0s 
 => CACHED [web  7/13] RUN apt-get update && apt-get install -y nodejs                                      0.0s 
 => CACHED [web  8/13] RUN gem install bundler -v 2.4                                                       0.0s 
 => CACHED [web  9/13] RUN gem install pkg-config                                                           0.0s 
 => CACHED [web 10/13] RUN bundle install                                                                   0.0s 
 => CACHED [web 11/13] COPY package.json yarn.lock ./                                                       0.0s 
 => CACHED [web 12/13] RUN yarn install --check-files                                                       0.0s 
 => [web 13/13] COPY . .                                                                                    0.6s 
 => [web] exporting to image                                                                                0.2s 
 => => exporting layers                                                                                     0.2s 
 => => writing image sha256:4b2e5f0886455eb67a2b4a9987b22d876ce9b44bc362ab3d061565d6b884563f                0.0s 
 => => naming to docker.io/library/iris-systems-recruitment-2024-web                                        0.0s 
[+] Running 5/5
 ✔ Container iris-systems-recruitment-2024-db-1     Creat...                                                0.0s 
 ✔ Container iris-systems-recruitment-2024-web-2    Recr...                                                 0.3s 
 ✔ Container iris-systems-recruitment-2024-web-1    Recr...                                                 0.4s 
 ✔ Container iris-systems-recruitment-2024-web-3    Recr...                                                 0.3s 
 ✔ Container iris-systems-recruitment-2024-nginx-1  Re...                                                   0.1s 
Attaching to db-1, nginx-1, web-1, web-2, web-3
db-1     | 2024-03-16 15:02:52+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
db-1     | 2024-03-16 15:02:52+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
db-1     | 2024-03-16 15:02:52+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
db-1     | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
web-1    | /usr/local/bin/ruby: warning: shebang line ending with \r may cause problems
web-3    | /usr/local/bin/ruby: warning: shebang line ending with \r may cause problems
db-1     | 2024-03-16T15:02:52.912961Z 0 [System] [MY-015015] [Server] MySQL Server - start.
db-1     | 2024-03-16T15:02:53.391046Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.3.0) starting as process 1
db-1     | 2024-03-16T15:02:53.415878Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
db-1     | 2024-03-16T15:02:53.676594Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
web-2    | /usr/local/bin/ruby: warning: shebang line ending with \r may cause problems
nginx-1  | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
nginx-1  | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
nginx-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
nginx-1  | 10-listen-on-ipv6-by-default.sh: info: IPv6 listen already enabled
nginx-1  | /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
nginx-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
nginx-1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
nginx-1  | /docker-entrypoint.sh: Configuration complete; ready for start up
db-1     | 2024-03-16T15:02:53.981103Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
db-1     | 2024-03-16T15:02:53.981156Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
db-1     | 2024-03-16T15:02:53.988962Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.     
db-1     | 2024-03-16T15:02:54.041743Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
db-1     | 2024-03-16T15:02:54.041803Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.3.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
web-1    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:66: warning: already initialized constant Net::ProtocRetryError
web-1    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:68: warning: previous definition of ProtocRetryError was here
web-1    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:206: warning: already initialized constant Net::BufferedIO::BUFSIZE
web-1    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:214: warning: previous definition of BUFSIZE was here
web-1    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:503: warning: already initialized constant Net::NetPrivate::Socket
web-1    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:541: warning: previous definition of Socket was here
web-3    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:66: warning: already initialized constant Net::ProtocRetryError
web-3    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:68: warning: previous definition of ProtocRetryError was here
web-3    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:206: warning: already initialized constant Net::BufferedIO::BUFSIZE
web-3    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:214: warning: previous definition of BUFSIZE was here
web-3    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:503: warning: already initialized constant Net::NetPrivate::Socket
web-3    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:541: warning: previous definition of Socket was here
web-1    | => Booting Puma
web-1    | => Rails 6.1.7.7 application starting in development
web-3    | => Booting Puma
web-1    | => Run `bin/rails server --help` for more startup options
web-3    | => Rails 6.1.7.7 application starting in development
web-3    | => Run `bin/rails server --help` for more startup options
web-2    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:66: warning: already initialized constant Net::ProtocRetryError
web-2    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:68: warning: previous definition of ProtocRetryError was here
web-2    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:206: warning: already initialized constant Net::BufferedIO::BUFSIZE
web-2    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:214: warning: previous definition of BUFSIZE was here
web-2    | /usr/local/lib/ruby/2.7.0/net/protocol.rb:503: warning: already initialized constant Net::NetPrivate::Socket
web-2    | /usr/local/bundle/gems/net-protocol-0.2.2/lib/net/protocol.rb:541: warning: previous definition of Socket was here
web-2    | => Booting Puma
web-2    | => Rails 6.1.7.7 application starting in development
web-2    | => Run `bin/rails server --help` for more startup options
web-3    | Puma starting in single mode...
web-3    | * Puma version: 5.6.8 (ruby 2.7.8-p225) ("Birdie's Version")
web-3    | *  Min threads: 5
web-3    | *  Max threads: 5
web-3    | *  Environment: development
web-3    | *          PID: 1
web-3    | * Listening on http://0.0.0.0:3000
web-3    | Use Ctrl-C to stop
web-1    | Puma starting in single mode...
web-1    | * Puma version: 5.6.8 (ruby 2.7.8-p225) ("Birdie's Version")
web-1    | *  Min threads: 5
web-1    | *  Max threads: 5
web-1    | *  Environment: development
web-1    | *          PID: 1
web-1    | * Listening on http://0.0.0.0:3000
web-1    | Use Ctrl-C to stop
web-2    | Puma starting in single mode...
web-2    | * Puma version: 5.6.8 (ruby 2.7.8-p225) ("Birdie's Version")
web-2    | *  Min threads: 5
web-2    | *  Max threads: 5
web-2    | *  Environment: development
web-2    | *          PID: 1
web-2    | * Listening on http://0.0.0.0:3000
web-2    | Use Ctrl-C to stop
````
## Usage
Once the containers are up and running, you can access the Rails application through Nginx at [http://localhost:8080](http://localhost:8080). The database port is internal to the Docker network and not exposed externally.

## Changes to original source code
This project was maily focused on dockerising a rails stack. The Changes done to the original code are:
-Updated the ruby version to 2.7 to support more dependencies
- Changed the source code in index.html.erb file 
```js
<% if task && task.upload.attached? %>
          <td><%= image_tag task.upload, style: 'width: 500px' %></td>
        <% else %>
          <td>No image available</td>
        <% end %>
```
-Changed the rails version to 6.0 to support the code
to prevent the rails code from crashing in case a file was not uploaded to a task
For help and support, please open an issue on the GitHub repository.

## Roadmap
-Dockerfile:
Ruby 2.7 is used as the base image for the container
The first few lines of the docker file are written so that all the necessary dependencies are 
installed into the Container for proper execution and operation of the code.
The copy command is written to copy all the files from the source directory to the directory in
the container
Port 3000 is exposed on the docker container to allow communication with services outside the container.
The next set of commented lines were an attempt to perform periodic backups from the application.


-dockercompose file:
The services define the different containers that make up the application:-
1.Web
It defines the configuration of the rails application.
It builds an image from the commands written in the dockerfile.
The web service depends on the db service to be started before it can start.

2.db
The latest image of mysql is used for this service.
volumes is used to persist MySQL data. It maps the /var/lib/mysql directory in the container 
to a volume named db_data.

3.nginx
The latest image of nginx is used for this service.
nginx service depends on the web service to be started before it can start.
port 8080 on the host is mapped to port 80 on the Nginx container.
Configuration files are mounted from the source to the nginx container

networks: Defines the custom network configuration for the services.
my_network: Specifies a custom bridge network named my_network for communication between containers.

volumes: Defines the volumes used by the services.
nginx_data: Specifies a volume named nginx_data to persist Nginx configuration files.
db_data: Specifies a volume named db_data to persist MySQL data.

-nginx configuration file:
The upstream is a block used to define a group of servers used to handle requests.
In this case, it specifies a single server named web running on port 3000.
binary_remote_addr: Represents the binary representation of the client's IP address.
zone=mylimit:10m: Creates a shared memory zone with a size of 10 MB.
rate=10r/s: Sets a rate limit of 10 requests per second for each unique IP address.
The server is programmed to listen to incoming server requests from port 80.
proxy_pass http://rails_server: Forwards incoming requests to the backend servers
defined in the rails_server upstream block.
proxy_set_header: Sets various HTTP headers to provide additional information to the backend servers.

backup_script:
attempt to take backup using shell commands.

gitlab-ci:
attempt to write a Gitlab CI pipeline that creates a docker image
## Authors and Acknowledgment
Prahas G R,

student,
NITK.

## Project Status
Development on this project is active. Contributions and feedback are encouraged.
