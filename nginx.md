## Nginx
### Install

#### Centos
>https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7

### Load balancing methods
 - round-robin
 - least-connected
 - ip-hash

#### Examples

1. Default LB

 ```
    http {
        upstream myapp1 {
            server srv1.example.com;
            server srv2.example.com;
            server srv3.example.com;
        }

        server {
            listen 80;

            location / {
                proxy_pass http://myapp1;
            }
        }
    }
 ```

- Support `HTTP, HTTPS, FastCGI, uwsgi, SCGI, memcached, and gRPC`

2. Least connection

```
    upstream myapp1 {
        least_conn;
        server srv1.example.com;
        server srv2.example.com;
        server srv3.example.com;
    }
```

3. Session persistence

```
    upstream myapp1 {
        ip_hash;
        server srv1.example.com;
        server srv2.example.com;
        server srv3.example.com;
    }
```

4. Weighted LB

```
upstream myapp1 {
        server srv1.example.com weight=3;
        server srv2.example.com;
        server srv3.example.com;
    }
```

##### More

- Health checks: ` max_fails`, `fail_timeout`
- http://nginx.org/en/docs/http/load_balancing.html