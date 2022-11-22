FROM debian

WORKDIR /

RUN sed -i "s/deb.debian.org/mirrors.163.com/g" /etc/apt/sources.list
RUN sed -i "s/security.debian.org/mirrors.163.com/g" /etc/apt/sources.list
RUN apt update -y && apt install -y g++ gcc git curl wget nasm yasm libgtk-3-dev clang libxcb-randr0-dev libxdo-dev libxfixes-dev libxcb-shape0-dev libxcb-xfixes0-dev libasound2-dev libpulse-dev cmake unzip zip sudo libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

RUN git clone https://github.com/microsoft/vcpkg && cd vcpkg && git checkout 134505003bb46e20fbace51ccfb69243fbbc5f82
RUN /vcpkg/bootstrap-vcpkg.sh -disableMetrics
RUN /vcpkg/vcpkg --disable-metrics install libvpx libyuv opus

RUN groupadd -r user && useradd -r -g user user --home /home/user && mkdir -p /home/user && chown user /home/user && echo "user  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/user
WORKDIR /home/user
RUN wget https://raw.githubusercontent.com/c-smile/sciter-sdk/master/bin.lnx/x64/libsciter-gtk.so
USER user
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
RUN chmod +x rustup.sh
RUN ./rustup.sh -y

RUN echo '[source.crates-io]' > ~/.cargo/config \
 && echo 'registry = "https://github.com/rust-lang/crates.io-index"'  >> ~/.cargo/config \
 && echo '# 替换成你偏好的镜像源'  >> ~/.cargo/config \
 && echo "replace-with = 'sjtu'"  >> ~/.cargo/config \
 && echo '# 上海交通大学'   >> ~/.cargo/config \
 && echo '[source.sjtu]'   >> ~/.cargo/config \
 && echo 'registry = "https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index"'  >> ~/.cargo/config \
 && echo '' >> ~/.cargo/config

USER root

ENV HOME=/home/user
COPY ./entrypoint /
ENTRYPOINT ["/entrypoint"]