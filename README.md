```shell
docker-compose up
```

The endpoint will be displayed in the output of the deploy_1 container, e.g. :
```shell
...
http://localhost:4566/restapis/7a2pxwqllm/local/_user_request_
...
```

The route to test it is:
```shell
http://OUTPUT_FROM_DEPLOY_CONTAINER/version
```


The problem here is in `src / serverless / main.py` where the import only works if you use the absolute path:
```python
from serverless.constants import VERSION  # it works
# from .constants import VERSION  # it doesn't work
```