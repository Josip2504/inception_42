nginx working

mariadb working and running

	maria db error:
		➜  42inception git:(main) ✗ docker exec -it mariadb mysql -u root -p"$(cat secrets/db_root_password.txt)" -e "SHOW DATABASES;"
			ERROR 1130 (HY000): Host '74e25e700ec6' is not allowed to connect to this MariaDB server
	still error 1130 even when allowed no password