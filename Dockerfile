FROM node:11.1.0-alpine
ARG node_env=production

RUN echo "unsafe-perm = true" >> ~/.npmrc
RUN npm install strapi@alpha -g
RUN npm install pm2 -g

COPY . /usr/src/api/

ENV NODE_ENV=$node_env
RUN chmod +x /usr/src/api/strapi.sh \
    && /usr/src/api/strapi.sh

WORKDIR /usr/src/api/strapi

CMD ["npm", "start"]

EXPOSE 1337
