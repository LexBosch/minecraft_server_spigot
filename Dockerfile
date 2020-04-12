FROM ubuntu

WORKDIR /minecraftserver

COPY ./test.sh ./

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install openjdk-8-jdk openjdk-8-jre -y
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
CMD git config --global --unset core.autocrlf
RUN java -jar BuildTools.jar
RUN chmod +x test.sh
RUN ./test.sh
RUN rm ./eula.txt
COPY ./eula.txt ./

EXPOSE 25565
CMD ./test.sh
