FROM inspursoft/baseimage-mips:1.0

MAINTAINER fanzhihai@inspur.com

ENV PATH /opt/j2sdk-image/bin/:${PATH}

RUN yum install -y wget tar gzip \
    && cd / && mkdir install_tmp && cd install_tmp \
    && wget http://ftp.loongnix.org/toolchain/java/openjdk8/loongson_openjdk8.1.2-jdk8u202b08-linux-loongson3a.tar.gz \
    && tar -xzvf loongson_openjdk8.1.2-jdk8u202b08-linux-loongson3a.tar.gz -C /opt \
    && yum remove -y wget tar gzip \
    && rm -rf /install_tmp \
    #  locales
    && rm -rf /usr/{{lib,share}/locale,{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive} \
    #  docs and man pages
    && rm -rf /usr/share/{man,doc,info,gnome/help} \
    #  cracklib
    && rm -rf /usr/share/cracklib \
    #  i18n
    && rm -rf /usr/share/i18n \
    #  sln
    && rm -rf /sbin/sln

CMD ["java", "-version"]
