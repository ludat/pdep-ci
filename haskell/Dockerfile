FROM haskell:9.10.3

ADD https://raw.githubusercontent.com/uqbar-project/pdepreludat/refs/heads/master/stack.yaml.lock \
    https://raw.githubusercontent.com/uqbar-project/pdepreludat/refs/heads/master/package.yaml \
    https://raw.githubusercontent.com/uqbar-project/pdepreludat/refs/heads/master/stack.yaml \
    .

RUN stack build --only-dependencies
