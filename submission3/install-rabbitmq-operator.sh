#!/bin/bash

# Install the RabbitMQ cluster operator
# ref: https://www.rabbitmq.com/kubernetes/operator/quickstart-operator.html
kubectl apply -f "https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml"
