FROM jenkins/jenkins
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Create log folder
USER root
RUN mkdir /var/log/jenkins

RUN apt-get update
#RUN apt-get install tar -y
#RUN apt-get install wget -y
#RUN apt-get install build-essential -y
#RUN apt-get install clang gcc g++ git -y
#RUN apt-get install -y vim
#RUN apt-get install -y doxygen graphviz
#RUN apt-get install -y python

# GLM and GLFW
#RUN apt-get install -y libglm-dev libxcb-dri3-0 libxcb-present0
#RUN apt-get install -y libpciaccess0 libpng-dev libxcb-keysyms1-dev
#RUN apt-get install -y libxcb-dri3-dev libx11-dev libmirclient-dev
#RUN apt-get install -y libwayland-dev libxrandr-dev
#RUN apt-get install -y libglfw3-dev
#
## Vulkan SDK
#RUN wget -O VulkanSDK.tar.gz https://sdk.lunarg.com/sdk/download/1.1.92.1/linux/vulkansdk-linux-x86_64-1.1.92.1.tar.gz?u=true && \
#    mkdir VulkanSDK && \
#    cd VulkanSDK && \
#    tar xvf /VulkanSDK.tar.gz

#RUN	cd VulkanSDK/1.1.92.1
#ENV	VULKAN_SDK="/VulkanSDK/1.1.92.1/x86_64:${VULKAN_SDK}"
#ENV	PATH="${VULKAN_SDK}/bin:${PATH}"
#ENV	LD_LIBRARY_PATH="${VULKAN_SDK}/lib:${LD_LIBRARY_PATH}"
#ENV	VK_LAYER_PATH="${VULKAN_SDK}/etc/explicit_layer.d:${VK_LAYER_PATH}"

# Install Cmake
#RUN wget -qO- "https://cmake.org/files/v3.13/cmake-3.13.4-Linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

# Copy plugin settings
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

# Add jobs
COPY jobs/1-fling-engine-job.xml /usr/share/jenkins/ref/jobs/1-fling-engine-job/config.xml

# Make a log directory and a jenkins user
RUN chown -R jenkins:jenkins /var/log/jenkins
USER jenkins

# Setting up environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Set default options
ENV JAVA_OPTS="-Xmx4096m -Djenkins.install.runSetupWizard=false"
ENV JENKINS_OPTS=" --handlerCountMax=100"