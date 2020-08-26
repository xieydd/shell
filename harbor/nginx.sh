yum -y install nginx
systemctl start nginx
systemctl enable nginx
cat > /etc/nginx/conf.d/harbor.conf <<-EOF
upstream harbor {
    ip_hash;
    server 10.10.10.98:80;
    server 10.10.10.99:80;
}
server {
   listen       80;
   # 提供访问的域名或者IP
   server_name  harbor.unisound.test;
   return      308 https://$host$request_uri;
}
server {
    listen  443 ssl;
    server_name harbor.unisound.test;
     
    # SSL 证书
    ssl_certificate /opt/nfs/harbor_key/harbor.unisound.test.crt;
    # SSL 私钥
    ssl_certificate_key /opt/nfs/harbor_key/harbor.unisound.test.key;
    client_max_body_size 0;
    chunked_transfer_encoding on;
 
    location / {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto https;
        proxy_redirect off;
        proxy_ssl_verify off;
        proxy_ssl_session_reuse on;
        proxy_pass http://harbor;
        proxy_http_version 1.1;
}
    location /v2/ {
        proxy_pass http://harbor/v2/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_ssl_verify off;
        proxy_ssl_session_reuse on;
        proxy_buffering off;
        proxy_request_buffering off;
    }
}
EOF

# nginx -t # make sure nginx config is right
# nginx -s reload # start nginx
