FROM debian:stable-slim

# Installing  prerequisites to run the application 
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash fortune-mod fortunes cowsay netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*


ENV PATH="$PATH:/usr/games"

 
COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh

EXPOSE 4499
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD nc -z localhost 4499 || exit 1

CMD ["/usr/local/bin/wisecow.sh"]







