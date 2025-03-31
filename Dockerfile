FROM fedora:latest

#
# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    dnf install -y \
      bash \
      python3.10 \
      git

# Download the source
RUN git clone https://github.com/michael-lazar/gemini-portal
WORKDIR "/gemini-portal"
ADD start.sh .
RUN tools/bootstrap
RUN chmod +x start.sh

# Start server
CMD ["/gemini-portal/start.sh"]
EXPOSE 5000
