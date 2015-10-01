FROM python:3.5.0-slim
RUN mkdir /py
ADD sample.py /py/sample.py
CMD python /py/sample.py
