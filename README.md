# docker-registry-oss
Dockerfile to build a [Docker-Registry](https://docs.docker.com/registry/) container image. Form the Docker official latest stable [version 0.9.1](https://github.com/docker/docker-registry).

### Quick Start
Launch a docker-registry container
```bash
docker run \
    -e OSS_BUCKET=<Bucket Name> \
    -e STORAGE_PATH=/registry \
    -e OSS_HOST=vpc100-oss-cn-beijing.aliyuncs.com \
    -e OSS_KEY=<Access Key ID> \
    -e OSS_SECRET=<Access Key Secret> \
    -p 5000:5000 \
    -d \
    nunchuk/docker-registry-oss
```
Point your browser to `http://localhost:5000` and confirm the success of the service.
### Configuration Parameters
- **OSS_HOST**: See the list of [OSS Region](http://help.aliyun.com/document_detail/oss/user_guide/endpoint_region.html), or [OSS in VPC](http://help.aliyun.com/knowledge_detail/6700335.html).
