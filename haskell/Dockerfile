FROM haskell:9.14.1

ENV STACK_ROOT=/stack

RUN mkdir -p /stack /work /home/runner && \
    chown 1001:1001 /stack /work /home/runner

ENV HOME=/home/runner

USER 1001

WORKDIR /work

# ADD --chown=1001:1001 \
#     https://raw.githubusercontent.com/uqbar-project/pdepreludat/refs/heads/master/stack.yaml.lock \
#     https://raw.githubusercontent.com/uqbar-project/pdepreludat/refs/heads/master/package.yaml \
#     https://raw.githubusercontent.com/uqbar-project/pdepreludat/refs/heads/master/stack.yaml \
#     ./

ADD --chown=1001:1001 \
    https://raw.githubusercontent.com/pdep-lunes-tarde/2026-funcional-tp-ci-test/refs/heads/master/stack.yaml.lock \
    https://raw.githubusercontent.com/pdep-lunes-tarde/2026-funcional-tp-ci-test/refs/heads/master/package.yaml \
    https://raw.githubusercontent.com/pdep-lunes-tarde/2026-funcional-tp-ci-test/refs/heads/master/stack.yaml \
    ./

RUN stack build --test --only-dependencies --no-install-ghc
