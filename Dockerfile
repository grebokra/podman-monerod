FROM debian:latest

RUN useradd -m monerod -s /bin/bash \
    && mkdir -p /home/monerod/.bitmonero \
    && chown -R monerod:monerod /home/monerod/.bitmonero

RUN apt update -y && apt install bzip2 wget tar -y

RUN wget https://downloads.getmonero.org/cli/monero-linux-x64-v0.17.3.0.tar.bz2

RUN tar xvf monero-linux-x64-v0.17.3.0.tar.bz2 && mv -v monero-x86_64-linux-gnu-v0.17.3.0/monerod /usr/local/bin/

USER monerod

WORKDIR /home/monerod

EXPOSE 18080
EXPOSE 18089

ENTRYPOINT ["/usr/local/bin/monerod"]

CMD ["--non-interactive", "--start-mining", "xxx", "--mining-threads=56"]
