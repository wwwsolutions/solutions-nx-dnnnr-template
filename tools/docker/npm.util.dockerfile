FROM node:14-alpine

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

ENTRYPOINT [ "npm" ]


# COPY commands.sh /scripts/commands.sh
# RUN ["chmod", "+x", "/scripts/commands.sh"]
# ENTRYPOINT ["/scripts/commands.sh"]