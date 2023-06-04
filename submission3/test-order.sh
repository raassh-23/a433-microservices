#!/bin/bash

# Get the host IP of the Istio Ingress Gateway
host=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

# Get the port of the Istio Ingress Gateway
port=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')

# Construct the gateway URL using the host and port
gatewayUrl=$host:$port

# Print the gateway URL
echo "Gateway URL: $gatewayUrl"

# Define the data payload for the POST request
data='{"order": {"orderld" : "abcdef" , "productid" : "123456" , "productName" : "Harry Potter Book" , "productprice" : "l00000" , "orderDate" : "28-03-2023" , "shippingAddress" : "Jl. Batik Kuneli No. 50 Bandung"}}'

# Send a POST request to the gateway URL with the data payload
curl -i -H "Content-Type: application/json" -X POST -d "$data" "$gatewayUrl/order"
