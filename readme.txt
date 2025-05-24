
# Inception

**Debian-Based Dockerized Web Infrastructure**

## Final Implementation Overview

A fully operational  **LEMP stack**  (Linux-Nginx-MariaDB-PHP) virtualized with Docker, featuring TLS-secured WordPress deployment. Built on  **Debian**  (penultimate stable) with auto-recovery, volumes, and isolated networking. 

----------

## Completed Features

### Core Services

-   **NGINX Container**
    
    -   Sole entrypoint via  **TLSv1.3**  (port 443).
        
    -   Reverse proxies PHP requests to WordPress.
        
    -   Self-signed certificates (auto-generated in setup).
        
-   **WordPress Container**
    
    -   PHP-FPM 8.2 + WordPress CLI.
        
    -   Connects to MariaDB over private network.
        
-   **MariaDB Container**
    
    -   Dedicated SQL database with:
        
        -   Secure credentials (via Docker secrets).
            
        -   Two users:  `root`  + custom admin (e.g.,  `wp_admin`).
            

### Infrastructure

-   **Volumes**  (`/home/user/data`):
    
    -   `wordpress_data`: Website files.
        
    -   `mariadb_data`: Database persistence.
        
-   **Network**:  `inception_network`  (user-defined bridge).
    
-   **Auto-restart**: All containers restart on failure.
    

----------

##  How I Built It

### 1.  **Dockerfiles**  (Debian-based)

-   **Optimized layers**: Minimal packages, cleaned apt caches.
    
-   **Security**:
    
    -   No hardcoded passwords (used  `.env`  + secrets).
        
    -   Non-root users for services (e.g.,  `www-data`  for PHP).
        

### 2.  **docker-compose.yml**

-   Defined services, volumes, networks.
    
-   Environment variables (e.g.,  `MYSQL_DATABASE=wordpress`).
    

### 3.  **Automation**

-   **Makefile**  handles:
    
```bash
make build   # Build images
make up      # Start containers
make down    # Stop everything
make clean   # Remove volumes/networks
```
----------

##  Usage (Tested & Working)

1.  **Clone & Configure**:
```bash
git clone [repo] && cd inception
. keys
```
    
2.  **Run**:
```bash    
make build && make up
```
    
4.  **Access**:
    
    -   WordPress:  `https://jsamardz.42.fr`

----------

## Technical Highlights

-   **Debian-specific**:
    
    -   Used  `apt-get`  (not Alpine’s  `apk`).
        
    -   Configured  `php-fpm`  pools for performance.
        
-   **TLS**: Self-signed certs via OpenSSL in NGINX setup.
    
-   **Debugging**: Logs mapped to  `./logs/`  (nginx/php/mysql).
