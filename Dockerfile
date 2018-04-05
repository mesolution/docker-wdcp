FROM centos:6.9

COPY ./start.sh /start.sh

RUN yum install -y wget \
    && wget http://dl.wdlinux.cn/lanmp_laster.tar.gz \
    && tar zxvf lanmp_laster.tar.gz \
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
