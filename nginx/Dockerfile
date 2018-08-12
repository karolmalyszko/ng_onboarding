FROM nginx:1.10-alpine

COPY rails_hello_world.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
