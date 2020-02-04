FROM rust:1
RUN echo "@@@@@@@@@@" && env
ENV XDG_CONFIG_HOME /github/workspace
ENV WRANGLER_HOME /github/workspace
ENV NODE_HOME $WRANGLER_HOME/nvm/versions/node/v$NODE_VERSION
ENV NODE_PATH $NODE_HOME/lib/node_modules

COPY entrypoint.sh /entrypoint.sh
COPY install.sh /install.sh
RUN chmod +x /install.sh /entrypoint.sh
RUN /install.sh
RUN cargo install --version $WRANGLER_VERSION wrangler
ENTRYPOINT ["/entrypoint.sh"]
