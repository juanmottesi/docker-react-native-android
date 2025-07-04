FROM --platform=linux/amd64 node:20

LABEL Set up Java

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y wget unzip openjdk-17-jdk

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

LABEL Set up Android

ENV ANDROID_SDK=https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip
ENV PLATFORM_TOOLS=https://dl.google.com/android/repository/platform-tools_r34.0.5-linux.zip 

ENV ANDROID_HOME=/opt/android-sdk
RUN mkdir --parents $ANDROID_HOME

WORKDIR /tmp

RUN wget -O sdk-tools.zip ${ANDROID_SDK} && \
  wget -O platform-tools.zip ${PLATFORM_TOOLS} && \
  unzip '*.zip' && \
  mkdir --parents ${ANDROID_HOME}/cmdline-tools/tools && \
  mv cmdline-tools/* ${ANDROID_HOME}/cmdline-tools/tools && \
  mkdir --parents ${ANDROID_HOME}/platform-tools && \
  mv platform-tools/* ${ANDROID_HOME}/platform-tools && \
  rm -rf *

ENV PATH="${ANDROID_HOME}/cmdline-tools/tools/bin:${PATH}"
ENV PATH="${ANDROID_HOME}/platform-tools:${PATH}"

RUN yes | sdkmanager --licenses && sdkmanager --update

RUN sdkmanager "platforms;android-35" "build-tools;34.0.0" "cmake;3.22.1" "ndk;25.1.8937393"

CMD ["/bin/bash"]