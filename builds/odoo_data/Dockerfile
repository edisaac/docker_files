# Based on the same as other containers to reuse downloaded layers
FROM alpine:3.4
MAINTAINER edisaac S.A. <edisaac.mejia@gmail.com>

# Volumes used by Odoo; permissions are set when executing `launch`
VOLUME ["/var/lib/odoo"]
  
# This container will be stopped, since we only need it to hold volume data
CMD ["/usr/bin/true"]
