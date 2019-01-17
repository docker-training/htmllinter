FROM centos:7

ADD check_links.sh /check_links.sh
RUN chmod +x /check_links.sh
CMD bash /check_links.sh
