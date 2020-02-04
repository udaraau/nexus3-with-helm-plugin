FROM sonatype/nexus3:3.20.1

USER root

# install nexus-p2-repository-plugin
RUN curl --fail --silent --location --retry 3 \
    -o /tmp/nexus-repository-helm-1.0.3-SNAPSHOT-bundle.kar \
    https://github.com/udaraau/nexus3-with-helm-plugin/raw/master/nexus-repository-helm-1.0.3-SNAPSHOT-bundle.kar \
  && mkdir -p /opt/sonatype/nexus/system/org/sonatype/nexus/plugins/nexus-repository-helm/1.0.2/ \
  && cp -r /tmp/nexus-repository-helm-1.0.3-SNAPSHOT-bundle.kar  \
    /opt/sonatype/nexus/deploy/ \
  && find /opt/sonatype/nexus/deploy/ \
    -type f -exec chmod 644 {} \; \
  && rm /tmp/nexus-repository-helm-1.0.3-SNAPSHOT-bundle.kar

USER nexus 