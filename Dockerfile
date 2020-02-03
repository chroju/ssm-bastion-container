FROM amazonlinux:2

LABEL maintainer "chroju <chor.chroju@gmail.com>"

ENV SSM_AGENT_ID=id
ENV SSM_AGENT_CODE=code

RUN yum update -y && \
    yum install -y systemd curl tar sudo && \
    yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

COPY ssm-agent.sh /usr/local/bin/ssm-agent.sh
RUN chmod +x /usr/local/bin/ssm-agent.sh

WORKDIR /opt/amazon/ssm/
CMD ["/usr/local/bin/ssm-agent.sh"]
