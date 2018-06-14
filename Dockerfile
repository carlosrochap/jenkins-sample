FROM jenkins/jnlp-slave

USER root

# install Docker
RUN apt-get update && apt-get install -y vim


USER jenkins