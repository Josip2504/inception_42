nginx working

mariadb working

➜  inception_42 git:(main) ✗ docker exec nginx sh -c "if nc -zv mariadb 3306 &> /dev/null; then echo '✅ MariaDB reachable from NGINX'; curl -ks https://localhost >/dev/null && echo '✅ NGINX serving HTTPS'; else echo '❌ MariaDB unreachable'; fi"
✅ MariaDB reachable from NGINX
sh: 1: nc: not found
✅ NGINX serving HTTPS

both working together