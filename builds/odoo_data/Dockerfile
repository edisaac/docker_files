# Based on the same as other containers to reuse downloaded layers
FROM alpine:3.4
MAINTAINER edisaac S.A. <edisaac.mejia@gmail.com>

ENV ODOO_DATA /mnt/data
VOLUME [${ODOO_DATA}]
 
# This container will be stopped, since we only need it to hold volume data
CMD ["/bin/true"]
