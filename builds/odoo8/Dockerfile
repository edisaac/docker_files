FROM ubuntu:xenial
MAINTAINER edisaac S.A. <edisaac.mejia@gmail.com>

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends \
		python-docutils 	python-gdata 		python-mako 		python-dateutil 	\
		python-feedparser 	python-lxml 		python-tz 			python-vatnumber 	\
		python-webdav 		python-xlwt 		python-werkzeug 	python-yaml 		\
		python-zsi 			python-unittest2	python-mock 		python-libxslt1 	\
		python-ldap 		python-reportlab	python-pybabel 		python-pychart 		\
		python-simplejson 	python-psycopg2		python-vobject 		python-openid 		\
		python-setuptools 	postgresql-client	unixodbc 			unixodbc-dev 		\
		python-pyodbc 		python-psutil 		nginx 				python-gevent 		\
		language-pack-es 	tesseract-ocr 		tesseract-ocr-eng	python-m2crypto 	\
		libxml2-dev 		libxmlsec1-dev 		build-essential 	libssl-dev 		\
		libffi-dev			python-dev 			python-pip 			python-openpyxl 	

RUN set -x; \
	apt-get install -y --no-install-recommends \
		git 			curl			gdebi			 

RUN set -x; \
	pip install --upgrade pip \
        && pip install \
		suds 		xmlsec 			cryptography 		boxsdk		

RUN set -x; \
	pip install \
		jinja2 		CubicReport 		decorator 		requests 	\
		pyPdf 		openerp-client-lib 	openerp-client-etl 	gunicorn 	\
		passlib 	psycogreen 		pytesseract 		pycrypto 	\
		qrcode		image			pyinotify
RUN set -x; \
        curl -o wkhtmltox.deb -SL http://download.gna.org/wkhtmltopdf/0.12/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb \
        && echo '7dd0e9be7e4fa2a58aa7066460927cdb8ba07492 wkhtmltox.deb' | sha1sum -c - 
RUN set -x; \        
        sudo dpkg -i wkhtmltox.deb \
		&& apt-get -y install -f --no-install-recommends \
        && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false npm \
        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb 

RUN set -x; \
        cp /usr/local/bin/wkhtmltopdf /usr/bin \
        && cp /usr/local/bin/wkhtmltoimage /usr/bin


ENV ODOO_PATH /etc/odoo
ENV ODOO_DATA /var/lib/odoo
ENV ODOO_ADDONS /mnt/extra-addons

VOLUME [${ODOO_DATA}, ${ODOO_ADDONS},${ODOO_PATH}]

# Install Odoo
#ADD ./odoo_cubic.tar.gz /etc/

# Copy entrypoint script and Odoo configuration file
COPY ./entrypoint.sh /
#COPY ./odoo.conf ${ODOO_PATH}/

# Creating user Odoo 
RUN groupadd odoo \
	&& useradd -s /bin/false -g odoo -d /opt/odoo odoo \	
	&& chmod +x /entrypoint.sh 

# Mount /var/lib/odoo to allow restoring filestore and /mnt/extra-addons for users addons
RUN mkdir -p ${ODOO_ADDONS} \
    && chown -R odoo ${ODOO_ADDONS} \
	&& mkdir -p ${ODOO_DATA} \
	&& chown -R odoo ${ODOO_DATA}  \
	&& mkdir -p ${ODOO_PATH} \
	&& chown odoo ${ODOO_PATH} 
# Expose Odoo services
EXPOSE 8069 8071

# Set the default config file
ENV ODOO_RC ${ODOO_PATH}/odoo.conf

# Set default user when running the container
USER odoo

ENTRYPOINT ["/entrypoint.sh"]
CMD ["odoo"]
