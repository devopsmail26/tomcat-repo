FROM openjdk:8

RUN apt-get update && apt-get clean

RUN curl -L https://downloads.apache.org/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz --output /opt/tomcat.tar.gz

#RUN tar -xvzf /opt/apache-tomcat-8.5.73.tar.gz -C /opt/ --one-top-level=pretty_name --strip-components 1 && rm -rf 

RUN tar -xvzf /opt/tomcat.tar.gz -C /opt/ --one-top-level=tomcat --strip-components 1 && rm -rf /opt/tomcat.tar.gz

COPY host-manager-conext.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml

COPY manager-context.xml /opt/tomcat/webapps/manager/META-INF/context.xml

COPY tomcat-user.xml /opt/tomcat/conf/tomcat-users.xml

#RUN curl https://downloads.apache.org/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz --output /opt/tomcat/tomcat.tar.gz && tar -xvzf /opt/tomcat/tomcat.tar.gz

RUN chmod +x /opt/tomcat/bin/*

RUN ln -s /opt/tomcat/bin/catalina.sh /usr/local/bin/tomcatup

CMD ["tomcatup", "run"]

