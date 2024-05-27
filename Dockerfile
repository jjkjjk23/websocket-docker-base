FROM archlinux
WORKDIR /app
RUN pacman -Syu --noconfirm cmake
RUN pacman -Syu --noconfirm gcc
RUN pacman -Syu --noconfirm boost
RUN pacman -Syu --noconfirm	postgresql-libs
RUN pacman -Syu --noconfirm openssl
RUN pacman -Syu --noconfirm websocketpp
RUN pacman -Syu --noconfirm libcurl-gnutls
RUN pacman -Syu --noconfirm ninja
RUN pacman -Syu --noconfirm pkgconf
RUN pacman -Syu --noconfirm mold
