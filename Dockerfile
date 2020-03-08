FROM haskell:8.6.5

RUN mkdir /tmp/build && \
    cd /tmp/build && \
    curl -L "https://github.com/idris-lang/Idris-dev/archive/v1.3.2.tar.gz" > idris.tar.gz && \
    echo "48429b8ed80980f9a4d38c29e51fcbb51ea511640806cd3cb7752bfdbb4644d2 " idris.tar.gz | sha256sum -c && \
    mkdir src && \
    tar -xf idris.tar.gz --strip-components=1 -C src && \
    cd src && \
    cabal update && \
    cabal install . && \
    cabal copy --destdir=/tmp/build/bin/ && \
    rm /root/.cabal -rf && \
    cp -a /tmp/build/bin/root/.cabal /root/ && \
    rm /tmp/build -rf
