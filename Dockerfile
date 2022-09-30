FROM peaceiris/hugo:v0.101.0-full
WORKDIR /app
COPY ./package.json .
RUN npm install -D
COPY . .
CMD ["server", "-D", "--bind", "0.0.0.0", "-p", "1313"]