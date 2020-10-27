FROM nginx:alpine

EXPOSE 1080 1443
#VOLUME /etc/letsencrypt
#VOLUME /etc/nginx

RUN apk add --update --no-cache certbot certbot-nginx

ADD generate_config.sh /
ADD templates/simplelogin.conf /etc/nginx/conf.d/simplelogin.conf
RUN chown nginx:nginx /etc/nginx/conf.d/simplelogin.conf && chmod a+x /generate_config.sh
USER nginx
CMD /generate_config.sh && nginx -g "daemon off;"
