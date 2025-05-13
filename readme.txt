
---to generate keys---
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./srcs/requirements/nginx/tools/nginx.key \
  -out ./srcs/requirements/nginx/tools/nginx.crt \
  -subj "/CN=jsamardz.42.fr"



---to delete keys---
sudo rm srcs/requirements/nginx/tools/nginx.crt srcs/requirements/nginx/tools/nginx.key 
