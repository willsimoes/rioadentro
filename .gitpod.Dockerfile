# Use uma imagem base mais recente e genérica do Gitpod
FROM gitpod/workspace-full-vnc

# Garanta que os comandos abaixo sejam executados como o usuário 'gitpod'
USER gitpod

# Define o shell para que os comandos do SDKMAN sejam reconhecidos
SHELL ["/bin/bash", "-c"]

# Instala o Java 21 usando o SDKMAN e o define como a versão padrão
RUN . /home/gitpod/.sdkman/bin/sdkman-init.sh && \
    echo "Y" | sdk install java 21.0.1-tem && \
    sdk default java 21.0.1-tem

# Define as variáveis de ambiente JAVA_HOME e PATH para garantir a compatibilidade
# com outras ferramentas (como Maven)
ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/21.0.1-tem
ENV PATH=$JAVA_HOME/bin:$PATH
