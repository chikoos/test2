FROM alpine AS base
# apk update and install nodejs
RUN apk update && apk add nodejs nodejs-npm

FROM base as cache
# set working directory
WORKDIR /app
# copy project file
COPY package*.json ./
# set npm proxy
RUN npm config set proxy "http://forwardproxy.extnp.national.com.au:3128/"
# install node packages
RUN npm set progress=false && \
    npm install && \
    npm cache clean --force

FROM base
# copy node_modules
COPY --from=cache /app/node_modules ./node_modules
# copy app sources
COPY . .
CMD npm run build
