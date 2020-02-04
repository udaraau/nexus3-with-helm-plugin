FROM sonatype/nexus3:3.20.1

USER root

# install nexus-p2-repository-plugin
RUN curl --fail --silent --location --retry 3 \
    -o /tmp/nexus-repository-helm-1.0.2.jar \
    https://repo1.maven.org/maven2/org/sonatype/nexus/plugins/nexus-repository-helm/1.0.2/nexus-repository-helm-1.0.2.jar \
  && mkdir -p /opt/sonatype/nexus/system/org/sonatype/nexus/plugins/nexus-repository-helm/1.0.2/ \
  && cp -r /tmp/nexus-repository-helm-1.0.2.jar  \
    /opt/sonatype/nexus/system/org/sonatype/nexus/plugins/nexus-repository-helm/1.0.2/ \
  && find /opt/sonatype/nexus/system/org/sonatype/nexus/plugins/nexus-repository-helm/1.0.2/ \
    -type f -exec chmod 644 {} \; \
  && rm /tmp/nexus-repository-helm-1.0.2.jar

RUN curl --fail --silent --location --retry 3 \
 -o /tmp/nexus-oss-feature-3.20.1-feature.xml \
 https://raw.githubusercontent.com/udaraau/nexus3-with-helm-plugin/master/nexus-oss-feature-3.20.1-01-feature.xml \
 && cp -r /tmp/nexus-oss-feature-3.20.1-feature.xml \
    /opt/sonatype/nexus/system/com/sonatype/nexus/assemblies/nexus-oss-feature/3.20.1-01/nexus-oss-feature-3.20.1-01-features.xml

RUN echo $(cat /opt/sonatype/nexus/system/com/sonatype/nexus/assemblies/nexus-oss-feature/3.20.1-01/nexus-oss-feature-3.20.1-01-features.xml)

USER nexus 