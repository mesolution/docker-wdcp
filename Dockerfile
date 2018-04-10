FROM centos:7

RUN yum install -y wget \
    && wget http://down.wdlinux.cn/in/install_v3.sh \
    && sh install_v3.sh
    && wget http://dl.wdlinux.cn/files/lanmp_v3.2.tar.gz \
    && tar zxvf lanmp_v3.2.tar.gz \
    && sh lanmp.sh cus \
    && sh lib/phps.sh \
    && sh lib/phps.sh 5.6.30 \
    && sh lib/phps.sh 7.0.18 \
    && sh lib/phps.sh 7.1.4 \
    && sh lib/phps_zend.sh \
    && sh lib/phps_redis.sh \
    && sh lib/phps_memcache.sh \
    && sh lib/memcached.sh


EXPOSE 21 80 443 3306 8080 20000-20500

CMD ["/start.sh"]
